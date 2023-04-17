package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;
import org.zerock.mapper.RecipeMapper;
import org.zerock.mapper.RecipeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor 
public class IngredientServiceImpl implements IngredientService {
	private RecipeMapper mapper;
	@Override
	public void register(IngredientVO board) {
		log.info("register....." );
		mapper.insertIngredient(board);
	}

	/*@Override
	public List<IngredientVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}*/
	
	@Override
	public List<IngredientVO> getList() {
		log.info("getListIngre.......");
		return mapper.getIngreList();
	}
	
	@Override
	public List<IngredientVO> get(Long bno) {
		log.info("getIngre.......");
		return mapper.readIngredient(bno);
	}



	@Override
	public boolean remove(Long bno) {
		log.info("removeIngre......." + bno);
		return mapper.deleteRecipe(bno)==1;	
	}

	@Override
	public boolean modify(IngredientVO board) {
		log.info("modifyIngre......." + board);
		return mapper.updateIngredient(board) == 1;
		
	}
	
	@Override
	public List<String> getIngreList(Long bno) {
		return mapper.readIngreName(bno);
	}

	@Override
	public List<String> getIngreListHave(Long bno) { 
		return mapper.readIngreNameHave(bno);
	}


	




}
