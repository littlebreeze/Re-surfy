package org.zerock.domain;

import lombok.Data;

@Data
public class StepVO {
	private Long sno;
	private Long bno;
	private Long stepNo;
	private String stepDescription;
	private String stepImage;
	private String tip;
}
