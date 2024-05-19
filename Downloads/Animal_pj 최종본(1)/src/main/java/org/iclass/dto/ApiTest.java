package org.iclass.dto;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


import org.iclass.dao.animalDao;

public class ApiTest {
	public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic");
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50","UTF-8")); /*한 페이지 결과 수(1,000 이하)*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json","UTF-8")); /*xml(기본값) 또는 json*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String jsonStr = sb.toString();
        System.out.println(jsonStr);
        
     
        
        JSONParser jsonParser = new JSONParser();
        try {
            Object obj = jsonParser.parse(jsonStr);
            JSONObject jsonObject = (JSONObject) obj;

            JSONObject response = (JSONObject) jsonObject.get("response");
            JSONObject body = (JSONObject) response.get("body");
            JSONObject items = (JSONObject) body.get("items");
            JSONArray itemArray = (JSONArray) items.get("item");

            List<Animal> animalList = new ArrayList<>();
            
            for (Object itemObj : itemArray) {
                JSONObject item = (JSONObject) itemObj;

                String kindCd = (String) item.get("kindCd"); // "[개] 믹스견"
                int startIndex = kindCd.indexOf("[");
                int endIndex = kindCd.indexOf("]");
                
                String kind = null;
                String breed = null;
                
                if (startIndex != -1 && endIndex != -1) {
                    kind = kindCd.substring(startIndex + 1, endIndex);
                    breed = kindCd.substring(endIndex + 2); // +2는 "공백"과 "뒤에 있는 문자"를 제거하기 위함
                }

                Animal animal = Animal.builder()
                        .desertionNo((String) item.get("desertionNo"))
                        .filename((String) item.get("filename"))
                        .happenDt((String) item.get("happenDt"))
                        .kindCd(kind)
                        .colorCd((String) item.get("colorCd"))
                        .age((String) item.get("age"))
                        .weight((String) item.get("weight"))
                        .processState((String) item.get("processState"))
                        .sexCd((String) item.get("sexCd"))
                        .neuterYn((String) item.get("neuterYn"))
                        .specialMark((String) item.get("specialMark"))
                        .careNm((String) item.get("careNm"))
                        .build();
                animalList.add(animal);
                System.out.println(animal);
               
               
            }
	}   catch (Exception e) {
		System.out.println(e.getMessage());
}
}
}
