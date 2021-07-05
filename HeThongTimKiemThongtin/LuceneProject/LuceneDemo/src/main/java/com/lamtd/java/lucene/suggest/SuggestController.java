package com.lamtd.java.lucene.suggest;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lamtd.java.lucene.spellcheck.Common;
import com.lamtd.java.lucene.spellcheck.EnglishSpellChecker;
import com.lamtd.java.lucene.spellcheck.English_VN_Searcher;
import org.apache.lucene.queryparser.classic.ParseException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.LinkedHashMap;

@RestController
@RequestMapping("/suggest")
public class SuggestController {

    @GetMapping(value = "/search", produces = "application/json")
    public JsonNode search(@RequestParam("key") String key) throws IOException, ParseException {
        LinkedHashMap<String, String> search = English_VN_Searcher.search(key);
        JsonObject rs = new JsonObject();
        JsonArray items = new JsonArray();
        rs.add("items", items);
        search.forEach((eng, viet) -> {
            JsonObject item = new JsonObject();
            item.addProperty(Common.FIELD_ENG, eng);
            item.addProperty(Common.FIELD_VN, viet);
            items.add(item);
        });
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readTree(rs.toString());
    }

    @GetMapping(value = "/check", produces = "application/json")
    public String[] check(@RequestParam("key") String key) throws IOException, ParseException {
        return EnglishSpellChecker.suggest(key);
    }
}
