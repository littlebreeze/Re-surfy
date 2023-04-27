package org.zerock.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class RecipeVO {
	private Long bno;
	private String recipeName;
	private String recipeDescription;
	private String id;
	private Date recipeDate;
	private Date recipeUpdateDate;
	private Long rno;
	private String image;
	private Long foodTypeNo;
	private String foodType;
	private String difficulty;
	private String person;
	private String time;
	private Long replycnt;
	private Long visitcnt;

}
