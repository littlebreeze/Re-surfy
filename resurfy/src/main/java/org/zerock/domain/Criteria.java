package org.zerock.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; 
	private int amount;
	
    private String type; 
	private String keyword; 
	
	private List<String> chk;

	public Criteria() {
		this(1,12);
	}
	
	public Criteria(int pageNum, int amount) { 
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
	
	
	
	
}
