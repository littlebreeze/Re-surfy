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
	public UserVO loginCheck(UserVO vo) throws Exception;
	public int idCheck(String memberId) throws Exception;
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);// 문자인증
	//push
}
