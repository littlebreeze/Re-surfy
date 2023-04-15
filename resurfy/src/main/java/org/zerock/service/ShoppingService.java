package org.zerock.service;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.List;
import java.util.Map;

import org.zerock.domain.Criteria;
import org.zerock.domain.ShopVO;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;

public interface ShoppingService {
	
	public List<ShopVO> searchFromAPI(List<String> iname);

	public String get(String apiUrl, Map<String, String> requestHeaders);

	public HttpURLConnection connect(String apiUrl);

	public String readBody(InputStream body);

	public List<ShopVO> parse(String responseBody, String iname);

	public String removeTag(String text);
}
