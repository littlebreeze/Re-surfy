package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.UserVO;

public interface UserService {
	public void register(UserVO vo);
	public UserVO get(Long bno);
	public boolean modify(Criteria cri);
	public List<UserVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public void join(UserVO userVO);
}
