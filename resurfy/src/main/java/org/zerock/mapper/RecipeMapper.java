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
	public void insert(RecipeVO board);
	public void insert(StepVO board);
	public void insert(IngredientVO board);
	public void update(RecipeVO board);
	public void update(StepVO board);
	public void update(IngredientVO board);
	public Long delete(Long bno);
	public List<RecipeVO> getList();
	public  List<RecipeVO> getListWithPaging(Criteria cri);
	public Long getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") Long amount);
}