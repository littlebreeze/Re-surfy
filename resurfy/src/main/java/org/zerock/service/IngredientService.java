package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;

public interface IngredientService {
	public boolean register(List<IngredientVO> ingredientList);
	public List<IngredientVO> get(Long bno);
	public boolean modify(IngredientVO vo);
	public boolean remove(Long bno);
	//public List<IngredientVO> getList(Criteria cri);
	public List<IngredientVO> getList();
	
	public List<String> getIngreList(Long bno, String userID);
	public List<String> getIngreListHave(Long bno, String userID); 
}
