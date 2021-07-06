package com.lamtd.java.lucene.spellcheck;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.AnalyzerWrapper;
import org.apache.lucene.analysis.TokenFilter;
import org.apache.lucene.analysis.ngram.EdgeNGramTokenFilter;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.spell.*;
import org.apache.lucene.store.RAMDirectory;

import static com.lamtd.java.lucene.spellcheck.Common.getGramAnalyzer;

public class EnglishSpellChecker {

    private static SpellChecker checker1 = null;
    private static SpellChecker checker2 = null;

    static {
        try {
            IndexReader reader = Common.getIndexReader();
            Dictionary dict = new LuceneDictionary(reader, Common.FIELD_VN);
            // use in-memory lucene spell checker
            RAMDirectory ram = new RAMDirectory();
            IndexWriterConfig indexWriterConfig = new IndexWriterConfig(getGramAnalyzer());
            checker1 = new SpellChecker(ram);
            checker1.indexDictionary(dict, indexWriterConfig, true);
            checker1.setStringDistance(new LevensteinDistance());

            IndexWriterConfig indexWriterConfig2 = new IndexWriterConfig(getGramAnalyzer());
            checker2 = new SpellChecker(ram);
            checker2.indexDictionary(dict, indexWriterConfig2, true);
            checker2.setStringDistance(new LevensteinDistance());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    public static String[] suggest(String eng, SuggestMode mode) {
        try {
            System.out.println(mode);
            return checker1.suggestSimilar(eng, 20, (IndexReader) null, (String) null, mode);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
