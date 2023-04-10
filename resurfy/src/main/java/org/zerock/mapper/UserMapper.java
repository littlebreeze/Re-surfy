package org.zerock.mapper;

import org.zerock.domain.UserVO;

public interface UserMapper {
	public int insert(UserVO vo);
	public int delete(String id);
	public UserVO read(String id);
}
