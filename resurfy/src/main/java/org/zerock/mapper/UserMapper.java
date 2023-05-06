package org.zerock.mapper;

import org.zerock.domain.UserVO;

public interface UserMapper {
	public void insert(UserVO userVO);
	public UserVO loginCheck(UserVO vo);
	public int idCheck(String memberId);
}
