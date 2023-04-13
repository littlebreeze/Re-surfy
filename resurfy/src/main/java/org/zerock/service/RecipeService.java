package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeVO;

public interface RecipeService {
	public void register(RecipeVO board);
	public RecipeVO get(Long bno);
	public boolean remove(Long bno);
	public boolean modify(RecipeVO board);
	public List<RecipeVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
