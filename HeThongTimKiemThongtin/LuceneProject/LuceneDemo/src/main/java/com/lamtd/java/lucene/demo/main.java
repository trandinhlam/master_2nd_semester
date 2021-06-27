package com.lamtd.java.lucene.demo;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.IOException;
import java.nio.file.Path;

public class main {
    public static void main(String[] args) throws IOException, ParseException {
        _index();
        _search();
    }

    private static final String fieldName = "fieldName";
    private static final String PATH = "data/log/lucene/index";
    private static final String text = "This is the text to be indexted.";


    private static void _index() throws IOException {
        Analyzer analyzer = new StandardAnalyzer();
        //Store index in mem
        IndexWriterConfig conf = new IndexWriterConfig(analyzer);
//        Directory directory = new RAMDirectory();
        Directory directory = FSDirectory.open(Path.of(PATH));
        IndexWriter iWriter = new IndexWriter(directory, conf);
        Field field = new Field(fieldName, text, TextField.TYPE_STORED);
        Document doc = new Document();
        doc.add(field);
        iWriter.addDocument(doc);
        iWriter.close();
    }

    private static void _search() throws IOException, ParseException {
        Analyzer analyzer = new StandardAnalyzer();
        QueryParser parser = new QueryParser(fieldName, analyzer);
        Query query = parser.parse("text");

        Directory dir = FSDirectory.open(Path.of(PATH));
        IndexReader reader = DirectoryReader.open(dir);
        IndexSearcher searcher = new IndexSearcher(reader);

        ScoreDoc[] hits = searcher.search(query, 1000).scoreDocs;
        for (int i = 0; i < hits.length; i++) {
            Document hitDoc = searcher.doc(hits[i].doc);
            String fieldname = hitDoc.get(fieldName);
            System.out.println(fieldname);
        }
        reader.close();
        dir.close();
    }
}

