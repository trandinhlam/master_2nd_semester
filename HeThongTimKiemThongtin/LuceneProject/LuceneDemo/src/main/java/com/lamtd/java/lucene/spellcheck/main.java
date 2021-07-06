package com.lamtd.java.lucene.spellcheck;

import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.spell.SuggestMode;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;

public class main {

    public static void main(String[] args) throws IOException, ParseException {
//        English_VN_Indexer.index();
        _test();
    }

    private static void _test() throws IOException, ParseException {
        String keyword = "this";
        for (int i = 0; i < 5; i++) {
            long start = System.nanoTime();
            LinkedHashMap<String, String> rs = English_VN_Searcher.search(keyword);
            long end = System.nanoTime();
            System.out.println("search time (micro): " + (end - start) / 1000l);
            System.out.println(rs.keySet());
            start = System.nanoTime();
            String[] suggest = EnglishSpellChecker.suggest(keyword, SuggestMode.SUGGEST_ALWAYS);
            end = System.nanoTime();
            System.out.println("suggest time (micro): " + (end - start) / 1000l);
            if (suggest != null) {
                Arrays.stream(suggest).forEachOrdered(System.out::println);
            }

        }
    }
}
