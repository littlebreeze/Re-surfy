package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno;
	private String id;
	private Long bno;
	private String reply;
	private Date replyDate;
	private Date replyUpdateDate;
	
}
