package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;
import org.zerock.mapper.OwnMapper;

public class OwnServiceImpl implements OwnService {
	private OwnMapper mapper;
	@Override
	public void register(OwnVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(OwnVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<OwnVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}
