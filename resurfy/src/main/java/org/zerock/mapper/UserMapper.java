package org.zerock.mapper;

import org.zerock.domain.UserVO;

public interface UserMapper {
	public void insert(UserVO userVO);
	public int delete(String id);
	public UserVO read(String id);
	public UserVO loginCheck(UserVO vo);
	public int idCheck(String memberId);
}
