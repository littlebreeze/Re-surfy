package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;

public interface OwnMapper {

	public List<OwnVO> getList();
	
	public List<OwnVO> getListPaging(Criteria cri);
	
	public int insert(OwnVO cart);
	
	public int delete(Long bno);
	
	public int getTotalCount(Criteria cri);
	
	public List<Map<String, Object>>autocomplete(Map<String, Object> paramMap) throws Exception;
}
