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
	public void register(RecipeVO board) {
		log.info("register......" + board);
		mapper.insertRecipe(board);
	}

	@Override
	public RecipeVO get(Long bno) {
		log.info("get......" + bno);
		return mapper.readRecipe(bno);
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove....." + bno);
		return mapper.deleteRecipe(bno) == 1;
	}

	@Override
	public boolean modify(RecipeVO board) {
		log.info("modify....." + board);
		return mapper.updateRecipe(board) == 1;
	}

	@Override
	public List<RecipeVO> getList(Criteria cri) {
		log.info("getList....." + cri);
		return mapper.getRecipeList();
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal....." + cri);
		return mapper.getTotalCount(cri);
	}
	

}
