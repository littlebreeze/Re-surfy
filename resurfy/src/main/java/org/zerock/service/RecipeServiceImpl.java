package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeVO;

import org.zerock.mapper.RecipeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor //모든 생성자를 주입한다.
public class RecipeServiceImpl implements RecipeService {
	private RecipeMapper mapper;
	@Override
	public void register(RecipeVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public RecipeVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<RecipeVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}
