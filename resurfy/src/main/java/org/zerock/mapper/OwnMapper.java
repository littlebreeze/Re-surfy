package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;

public interface OwnMapper {

	public List<OwnVO> getList();
	
	public List<OwnVO> getListPaging(Criteria cri);
	
	public void insert(OwnVO cart);
	
	public int delete(Long bno);
	
	public int getTotalCount(Criteria cri);
}
