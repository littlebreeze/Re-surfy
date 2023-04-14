package org.zerock.domain;

import lombok.Data;

@Data
public class UserVO {
	private Long sno;
	private Long bno;
	private Long stepNo;
	private String stepDescription;
	
	private String userId;
	private String userPw;
    private String userName;
    private String userNick;
    private String userPhone;
}
