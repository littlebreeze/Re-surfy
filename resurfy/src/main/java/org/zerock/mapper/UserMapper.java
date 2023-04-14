package org.zerock.mapper;

import org.zerock.domain.UserVO;

public interface UserMapper {
	public void insert(UserVO userVO);
	public int delete(String id);
	public UserVO read(String id);
}
