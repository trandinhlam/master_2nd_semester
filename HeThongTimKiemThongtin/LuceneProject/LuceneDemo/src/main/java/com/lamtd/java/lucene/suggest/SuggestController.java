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
import org.apache.lucene.search.spell.SuggestMode;
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
        if (key == null || key.isEmpty()) {
            return null;
        }
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
    public String[] check(@RequestParam("key") String key, @RequestParam("strmode") String strmode) throws IOException, ParseException {
        if (key == null || key.isEmpty()) {
            return null;
        }
        SuggestMode mode = SuggestMode.SUGGEST_WHEN_NOT_IN_INDEX;
        if (strmode != null && !strmode.isEmpty()) {
            switch (strmode) {
                case "popular":
                    mode = SuggestMode.SUGGEST_MORE_POPULAR;
                    break;
                case "always":
                    mode = SuggestMode.SUGGEST_ALWAYS;
                    break;
            }
            LinkedHashMap<String, String> search = English_VN_Searcher.search(key);
            return search.keySet().toArray(new String[0]);
        } else {
            return EnglishSpellChecker.suggest(key, mode);
        }
    }
}
