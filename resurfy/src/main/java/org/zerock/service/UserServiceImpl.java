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
@AllArgsConstructor //모든 생성자를 주입한다.
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

}
