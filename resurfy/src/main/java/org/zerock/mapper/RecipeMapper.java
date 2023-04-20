package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.StepVO;

public interface RecipeMapper {
	public RecipeVO readRecipe(Long bno);
	public List<StepVO> readStep(Long bno);
	public List<IngredientVO> readIngredient(Long bno);
	public void insertRecipe(RecipeVO board);
	public void insertStep(StepVO board);
	public void insertIngredient(IngredientVO board);
	public int updateRecipe(RecipeVO board);
	public int updateStep(StepVO board);
	public int updateIngredient(IngredientVO board);
	
	public int deleteRecipe(Long bno);
	public int deleteStep(Long bno);
	public int deleteIngredient(Long bno);
	
	public List<RecipeVO> getRecipeList();
	public List<StepVO> getStepList();
	public List<IngredientVO> getIngreList();
	public List<RecipeVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	public List<String> readIngreName(Long bno); 
	public List<String> readIngreNameHave(Long bno);

	public List<RecipeVO> getUserList(@Param(value = "cri") Criteria cri, @Param(value = "userID") String userID);
	public int getUserTotalCount(@Param(value = "cri") Criteria cri, @Param(value = "userID") String userID);
	
	public List<RecipeVO> getRecipeOrderByReplycnt();
	
	public void updateVisitCnt(@Param("bno") Long bno, @Param("amount") int amount);
	

	
}