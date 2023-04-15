package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ShopVO {

	private String ingredient;	//제품에 해당하는 재료
	private String title;
	private String lprice;
	private String image;
	private String link;
	private String productId;
}
