package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.UserVO;

import org.zerock.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor 
public class UserServiceImpl implements UserService {
	private UserMapper mapper;
	@Override
	public void register(UserVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public UserVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(Criteria cri) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<UserVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public void join(UserVO userVO) {
		log.info("join....." + userVO);
		mapper.insert(userVO);
		
	}

}
