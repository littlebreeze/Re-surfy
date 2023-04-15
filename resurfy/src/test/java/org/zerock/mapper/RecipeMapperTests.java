package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.StepVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RecipeMapperTests {
	
	@Autowired
	private RecipeMapper mapper;
	
	@Test
	public void testGetRecipeList() {
		mapper.getRecipeList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testGetStepList() {
		mapper.getStepList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testGetIngreList() {
		mapper.getIngreList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testRecipeRead() {
		RecipeVO board = mapper.readRecipe(1L); //콩비지 동그랑땡 나오면 정상입니다
		log.info(board);
	}
	
	
	@Test
	public void testStepRead() {
		List<StepVO> board = mapper.readStep(1L);
		log.info(board);
	
	}
	
	@Test
	public void testIngredientRead() {
		List<IngredientVO> board = mapper.readIngredient(1L);
		log.info(board);
	}
	
//	recipe 먼저 추가하고 , bno 값 확인 한 후에 step, ingredient insert 하면 됩니다
	@Test
	public void testInsertRecipe() {
		RecipeVO board = new RecipeVO();
		board.setId("user1");
		board.setRecipeName("후라이계란");
		board.setRecipeDescription("이것은 간단한 요리입니다.");
		board.setFoodTypeNo(3020001L);
		board.setFoodType("한식");
		board.setTime("3분");
		board.setPerson("1인분");
		board.setDifficulty("초보");
		board.setImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		
		mapper.insertRecipe(board);
		log.info(board);
	}
	
	@Test
	public void testInsertStep() {
		StepVO board = new StepVO();
		board.setBno(195457L);
		board.setStepNo(1L);
		board.setStepDescription("계란을 깬다.");
		board.setStepImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		board.setTip("너무 쉽습니다.");
		
		mapper.insertStep(board);
		log.info(board);
	}
	
	@Test
	public void testInsertIngredient() {
		IngredientVO board = new IngredientVO();
		board.setBno(195457L);
		board.setIngreName("계란");
		board.setIngreMeasure("약간");
		board.setIngreTypeNo(3060001L);
		board.setIngreType("주재료");
		
		mapper.insertIngredient(board);
		log.info(board);
	}
	// 기본키 , 외래키값 확인
	@Test
	public void testStepDelete() {
		log.info("DELETE COUNT : " + mapper.deleteStep(3025L));
	}
	
	@Test
	public void testIngredientDelete() {
		log.info("DELETE COUNT : " + mapper.deleteIngredient(195467L));
	}
	
	@Test
	public void testRecipeDelete() {
		log.info("DELETE COUNT : " + mapper.deleteRecipe(195456L));
	}
	// 새로 하나 recipe,step,ingredient 생성하고 테스트, 기본키, 외래키를 변경하지 말고 하면 테스트 가능
	
	@Test
	public void testUpdateRecipe() {
		RecipeVO board = new RecipeVO();
		board.setBno(195457L);
		board.setId("user1");
		board.setRecipeName("후라이계란이");
		board.setRecipeDescription("이것은 간단한 요리입니다!");
		board.setFoodTypeNo(3020001L);
		board.setFoodType("한식");
		board.setTime("3분");
		board.setPerson("1인분");
		board.setDifficulty("초보");
		board.setImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		
		int count = mapper.updateRecipe(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testUpdateStep() {
		StepVO board = new StepVO();
		board.setSno(3026L);
		board.setBno(195457L);
		board.setStepNo(1L);
		board.setStepDescription("소금을 넣는다.");
		board.setStepImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		board.setTip("잘잘");
		
		int count = mapper.updateStep(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testUpdateIngredient() {
		IngredientVO board = new IngredientVO();
		board.setIno(195468L);
		board.setBno(195457L);
		board.setIngreName("소금");
		board.setIngreMeasure("약간");
		board.setIngreTypeNo(3060003L);
		board.setIngreType("양념");
		
		int count = mapper.updateIngredient(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<RecipeVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testGetTotal() {
		Criteria cri = new Criteria();
		int count = mapper.getTotalCount(cri);
		log.info("Total....." + count);
		
	}

}
