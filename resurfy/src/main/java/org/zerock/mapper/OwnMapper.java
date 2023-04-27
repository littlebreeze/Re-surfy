package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;

public interface OwnMapper {

	public List<OwnVO> getList(String userID);
	
	public int insert(OwnVO cart);
	
	public int delete(Long bno);
	
	public List<Map<String, Object>>autocomplete(Map<String, Object> paramMap) throws Exception;

	public int getTotalRecipe(String userID);

	public int getTotalReply(String userID);
}
