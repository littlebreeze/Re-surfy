package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.StepVO;

public interface RecipeMapper {
	public RecipeVO readRecipe(Long bno);
	public StepVO readStep(Long sno);
	public IngredientVO readIngredient(long ino);
	public void insertRecipe(RecipeVO board);
	public void insertStep(StepVO board);
	public void insertIngredient(IngredientVO board);
	public void updateRecipe(RecipeVO board);
	public void updateStep(StepVO board);
	public void updateIngredient(IngredientVO board);
	public Long delete(Long bno);
	public List<RecipeVO> getList();
	public  List<RecipeVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") Long amount);
}