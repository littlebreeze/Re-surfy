package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;

public interface OwnService {

	public void register(List<OwnVO> cart);

	public boolean remove(Long cno);

	public List<OwnVO> getList();
}
