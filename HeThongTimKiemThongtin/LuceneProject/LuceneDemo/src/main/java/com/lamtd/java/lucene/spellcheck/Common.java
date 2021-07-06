package com.lamtd.java.lucene.spellcheck;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.AnalyzerWrapper;
import org.apache.lucene.analysis.TokenFilter;
import org.apache.lucene.analysis.ngram.EdgeNGramTokenFilter;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.similarities.ClassicSimilarity;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.IOException;
import java.nio.file.Path;


public class Common {
    public static final String FIELD_ENG = "eng";
    public static final String FIELD_VN = "vn";
    public static final String FILE_PATH = "data/input/en-vi.csv";
    public static final String INDEX_PATH = "data/index";
    public static Analyzer standardAnalyzer = new StandardAnalyzer();

    static IndexWriter iWriter;
    static IndexReader iReader;
    static IndexSearcher searcher;

    public static IndexWriter getIndexWriter() throws IOException {
        if (iWriter == null) {
            synchronized (INDEX_PATH) {
//                Analyzer analyzer = getGramAnalyzer();
                Analyzer analyzer = standardAnalyzer;
                //Store index in mem
                IndexWriterConfig conf = new IndexWriterConfig(analyzer);
                conf.setSimilarity(new ClassicSimilarity());
                Directory directory = FSDirectory.open(Path.of(INDEX_PATH));
                iWriter = new IndexWriter(directory, conf);
            }
        }
        return iWriter;
    }

    public static IndexReader getIndexReader() throws IOException {
        if (iReader == null) {
            synchronized (INDEX_PATH) {
                Directory dir = FSDirectory.open(Path.of(INDEX_PATH));
                iReader = DirectoryReader.open(dir);
            }
        }
        return iReader;
    }


    public static IndexSearcher getIndexSearcher() throws IOException {
        if (searcher == null) {
            synchronized (INDEX_PATH) {
                searcher = new IndexSearcher(getIndexReader());
            }
        }
        return searcher;
    }

    public static Analyzer getGramAnalyzer() {
        return new AnalyzerWrapper(Analyzer.PER_FIELD_REUSE_STRATEGY) {
            @Override
            protected Analyzer getWrappedAnalyzer(String fieldName) {
                return Common.standardAnalyzer;
            }

            @Override
            protected Analyzer.TokenStreamComponents wrapComponents(String fieldName, Analyzer.TokenStreamComponents components) {
//                if (fieldName.equals(Common.FIELD_ENG)) {
                // TODO: should use an EdgeNGramTokenFilterFactory here
                TokenFilter filter = new EdgeNGramTokenFilter(components.getTokenStream(), 1, 10);
                return new Analyzer.TokenStreamComponents(components.getTokenizer(), filter);
//                } else {
//                    return components;
//                }
            }
        };
    }
}
