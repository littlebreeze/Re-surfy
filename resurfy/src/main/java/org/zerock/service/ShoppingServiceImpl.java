package org.zerock.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.zerock.domain.ShopVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class ShoppingServiceImpl implements ShoppingService {
	
	@Override
	public List<ShopVO> searchFromAPI(List<String> iname) {
		String clientId = "NAVER_API_CLIENT_ID"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "NAVER_API_CLIENT_SECRET"; // 애플리케이션 클라이언트 시크릿값"
		
		List<ShopVO> allList = new ArrayList<ShopVO>();
		for (int i = 0; i < iname.size(); i++) {
			String text = null;
			try {
				text = URLEncoder.encode(iname.get(i), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException("검색어 인코딩 실패", e);
			}

			String apiURL = "https://openapi.naver.com/v1/search/shop?query=" + text; // json 결과
			apiURL+="&display=2&sort=sim";
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
			// // xml 결과

			Map<String, String> requestHeaders = new HashMap<>();
			requestHeaders.put("X-Naver-Client-Id", clientId);
			requestHeaders.put("X-Naver-Client-Secret", clientSecret);
			
			String responseBody = get(apiURL, requestHeaders);
			
			allList.addAll(parse(responseBody, iname.get(i)));
		}
		
		return allList;
	}

	@Override
	public String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
	}

	@Override
	public HttpURLConnection connect(String apiUrl) {
		try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
	}
	
	@Override
	public String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

	@Override
	public List<ShopVO> parse(String responseBody, String iname) {
		
		List<ShopVO> goods = new ArrayList<ShopVO>();
		
		JSONParser parser = new JSONParser();

		JSONObject jsonObject = null;
		try {
			jsonObject = (JSONObject) parser.parse(responseBody);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*---------------header------------------------------*/
		String lastBuildDate = (String) jsonObject.get("lastBuildDate");
		long total = (Long) jsonObject.get("total");
		long start = (Long) jsonObject.get("start");
		long display = (Long) jsonObject.get("display");

		System.out.println(lastBuildDate);
		System.out.println(total);
		System.out.println(start);
		System.out.println(display);

		/*---------------body------------------------------*/
		JSONArray blogs = (JSONArray) jsonObject.get("items");
		for (int i = 0; i < blogs.size(); i++) {

			JSONObject blog = (JSONObject) blogs.get(i);			
			
			String title = (String) blog.get("title");
			String lprice = (String) blog.get("lprice");
			String image = (String) blog.get("image");
			String link = (String) blog.get("link");
			String productId = (String) blog.get("productId");
			
			ShopVO good = new ShopVO();
			good.setIngredient(iname);
			good.setTitle(removeTag(title));
			good.setLprice(removeTag(lprice));
			good.setImage(removeTag(image));
			good.setLink(removeTag(link));
			good.setProductId(productId);
			
			goods.add(good);
		}
		
		return goods;
	}

	@Override
	public String removeTag(String text) {
		String textWithoutTag = text.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");	//정규표현식
		return textWithoutTag;
	}

}
