package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeVO;

public interface RecipeService {
	public boolean register(RecipeVO board);
	public RecipeVO get(Long bno);
	public boolean modify(RecipeVO board);
	public boolean modifyw(RecipeVO board);//필요한 부분만 수정(레시피)
	public boolean remove(Long bno);
	public List<RecipeVO> getList(Criteria cri);
	public List<RecipeVO> getAllList();
	public int getTotal(Criteria cri);

	public List<RecipeVO> getUserList(Criteria cri, String userID);
	public int getUserTotal(Criteria cri, String userID);
	
	public List<RecipeVO> sortByReplyCnt();
	public List<RecipeVO> sortByVisitCnt();
}
