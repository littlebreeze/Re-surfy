package org.zerock.domain;

import lombok.Data;

@Data
public class CartVO {

	private Long cno;
	private String id;
	private Long price;		//ShopVOÀÇ lprice
	private String pname;	//ShopVOÀÇ title
	private Long count;
	private String pimage;	//shopVOÀÇ image
	private String iname;	//ShopVOÀÇ ingredient
	private Long productid;
}