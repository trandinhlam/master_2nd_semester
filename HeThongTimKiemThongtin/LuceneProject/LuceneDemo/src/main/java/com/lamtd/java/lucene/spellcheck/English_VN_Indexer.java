package com.lamtd.java.lucene.spellcheck;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Scanner;

public class English_VN_Indexer {

    public static void index() throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(Common.FILE_PATH, Charset.forName("UTF-16")));
        IndexWriter writer = Common.getIndexWriter();
        String line;
        while ((line = br.readLine()) != null) {
            String[] split = line.split(",");
            if (split == null || split.length < 2) {
                continue;
            }
            String eng = split[0];
            String viet = line.substring(eng.length() + 1, line.length());
            Document doc = new Document();
            doc.add(new Field(Common.FIELD_ENG, eng, TextField.TYPE_STORED));
            doc.add(new Field(Common.FIELD_VN, viet, TextField.TYPE_STORED));
            writer.addDocument(doc);
        }
        writer.commit();
    }

    public static void main(String[] args) throws IOException {
        index();

    }
}
