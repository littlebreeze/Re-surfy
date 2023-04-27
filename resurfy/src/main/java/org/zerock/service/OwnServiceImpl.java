package org.zerock.service;

import java.util.List;
import java.util.Map;

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
	public List<OwnVO> getList(String userID){
		return mapper.getList(userID);
	}
	
	@Override
	public List<Map<String, Object>>autocomplete(Map<String, Object> paramMap) throws Exception{
		return mapper.autocomplete(paramMap);
	}

	@Override
	public int getTotalRecipe(String userID) {
		return mapper.getTotalRecipe(userID);
	}

	@Override
	public int getTotalReply(String userID) {
		return mapper.getTotalReply(userID);
	}
}
