package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;

public interface OwnService {
	public void register(OwnVO vo);
	public boolean remove(Long bno);
	public boolean modify(OwnVO vo);
	public List<OwnVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	
}
