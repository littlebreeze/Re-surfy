package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.OwnVO;

public interface OwnMapper {

	public List<OwnVO> getList();
	
	public void insert(OwnVO cart);
	
	public int delete(Long bno);
}
