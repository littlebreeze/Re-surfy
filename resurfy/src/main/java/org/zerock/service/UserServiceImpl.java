package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

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
