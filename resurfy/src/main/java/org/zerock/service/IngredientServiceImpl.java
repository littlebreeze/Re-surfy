package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;
import org.zerock.mapper.RecipeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor //모든 생성자를 주입한다.
public class IngredientServiceImpl implements IngredientService {
	private RecipeMapper mapper;

	@Override
	public void register(IngredientVO board) {
		log.info("register......" + board);
		mapper.insertIngredient(board);
	}

	@Override
	public IngredientVO get(Long ino) {
		log.info("get......." + ino);
		return mapper.readIngredient(ino);
	}

	@Override
	public boolean modify(IngredientVO board) {
		log.info("modify....." + board);
		return mapper.updateIngredient(board) == 1;
	}

	@Override
	public boolean remove(Long ino) {
		log.info("remove....." + ino);
		return mapper.deleteIngredient(ino) == 1;
	}

}
