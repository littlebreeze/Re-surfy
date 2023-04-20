package org.zerock.domain;

import lombok.Data;

@Data
public class UserVO {
	private Long sno;
	private Long bno;
	private Long stepNo;
	private String stepDescription;
	
	private String id;
	private String password;
    private String userName;
    private String nickname;
    private String phone;
}
