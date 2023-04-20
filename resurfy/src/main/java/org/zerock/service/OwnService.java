package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;

public interface OwnService {

	public boolean register(List<OwnVO> cart);

	public boolean remove(List<Long> cno);

	public List<OwnVO> getList(String userID);
	
	public List<Map<String, Object>>autocomplete(Map<String, Object> paramMap) throws Exception;
}
