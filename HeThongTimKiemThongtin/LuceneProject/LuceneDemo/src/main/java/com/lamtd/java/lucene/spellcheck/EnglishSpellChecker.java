package com.lamtd.java.lucene.spellcheck;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.AnalyzerWrapper;
import org.apache.lucene.analysis.TokenFilter;
import org.apache.lucene.analysis.ngram.EdgeNGramTokenFilter;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.spell.Dictionary;
import org.apache.lucene.search.spell.LevensteinDistance;
import org.apache.lucene.search.spell.LuceneDictionary;
import org.apache.lucene.search.spell.SpellChecker;
import org.apache.lucene.store.RAMDirectory;

public class EnglishSpellChecker {

    private static SpellChecker checker = null;

    static {
        try {
            IndexReader reader = Common.getIndexReader();
            Dictionary dict = new LuceneDictionary(reader, Common.FIELD_ENG);
            // use in-memory lucene spell checker
            RAMDirectory ram = new RAMDirectory();
            IndexWriterConfig indexWriterConfig = new IndexWriterConfig(getGramAnalyzer());
            checker = new SpellChecker(ram);
            checker.indexDictionary(dict, indexWriterConfig, true);
            checker.setStringDistance(new LevensteinDistance());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private static Analyzer getGramAnalyzer() {
        return new AnalyzerWrapper(Analyzer.PER_FIELD_REUSE_STRATEGY) {
            @Override
            protected Analyzer getWrappedAnalyzer(String fieldName) {
                return Common.standardAnalyzer;
            }

            @Override
            protected Analyzer.TokenStreamComponents wrapComponents(String fieldName, Analyzer.TokenStreamComponents components) {
                if (fieldName.equals(Common.FIELD_ENG)) {
                    // TODO: should use an EdgeNGramTokenFilterFactory here
                    TokenFilter filter = new EdgeNGramTokenFilter(components.getTokenStream(), 1, 10);
                    return new Analyzer.TokenStreamComponents(components.getTokenizer(), filter);
                } else {
                    return components;
                }
            }
        };
    }

    public static String[] suggest(String eng) {
        try {
            return checker.suggestSimilar(eng, 5);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
