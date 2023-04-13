package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;

public interface IngredientService {
	public void register(IngredientVO board);
	public IngredientVO get(Long bno);
	public boolean modify(IngredientVO vo);
	public boolean remove(Long bno);
	//public List<IngredientVO> getList(Criteria cri);
	public List<IngredientVO> getList();
}
