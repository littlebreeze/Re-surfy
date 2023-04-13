package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;

import org.zerock.mapper.OwnMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor //모든 생성자를 주입한다.
public class OwnServiceImpl implements OwnService {
	
	private OwnMapper mapper;

	@Override
	public boolean register(List<OwnVO> own) {
		int cnt = 0;
		for (OwnVO OwnVO : own) {
			cnt += mapper.insert(OwnVO);
		}
		return cnt==own.size();
	}

	@Override
	public boolean remove(List<Long> cno) {
		int cnt = 0;
		for (Long OwnVO : cno) {
			cnt += mapper.delete(OwnVO);
		}
		return cnt==cno.size();
	}

	@Override
	public List<OwnVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<OwnVO> getList(Criteria cri) {
		return mapper.getListPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
}
