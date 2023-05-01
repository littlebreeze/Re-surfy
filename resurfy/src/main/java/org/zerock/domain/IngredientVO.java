package org.zerock.domain;

import lombok.Data;

@Data
public class IngredientVO {
	private Long ino;
	private Long bno;
	private String ingreName;
	private String ingreMeasure;
	private String ingreType;
}
