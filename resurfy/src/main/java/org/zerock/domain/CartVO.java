package org.zerock.domain;

import lombok.Data;

@Data
public class CartVO {

	private Long cno;
	private String id;
	private Long price;		//ShopVO의 lprice
	private String pname;	//ShopVO의 title
	private Long count;
	private String pimage;	//shopVO의 image
	private String iname;	//ShopVO의 ingredient
	private Long productid;
}
