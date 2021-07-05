package com.lamtd.java.lucene.spellcheck;

import org.apache.lucene.document.Document;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;

public class English_VN_Searcher {
    public static LinkedHashMap<String, String> search(String english) throws ParseException, IOException {
        LinkedHashMap<String, String> rs = new LinkedHashMap<>();
        QueryParser parser = new QueryParser(Common.FIELD_ENG, Common.standardAnalyzer);
        Query query = parser.parse(english);
        IndexSearcher searcher = Common.getIndexSearcher();

        ScoreDoc[] hits = searcher.search(query, 20).scoreDocs;
        Arrays.stream(hits).forEachOrdered(hit -> {
                    try {
                        Document hitDoc = null;
                        hitDoc = searcher.doc(hit.doc);
                        String eng = hitDoc.get(Common.FIELD_ENG);
                        String viet = hitDoc.get(Common.FIELD_VN);
                        rs.put(eng, viet);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
        );
        return rs;
    }
}
