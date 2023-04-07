package org.zerock.domain;

import lombok.Data;

@Data
public class CartVO {
	private Long cno;
	private String id;
	private Long price;
	private String product;
	private String pname;
	private Long count;
}
