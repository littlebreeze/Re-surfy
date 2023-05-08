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
		RecipeVO board = mapper.readRecipe(1L); //����� ���׶��� ������ �����Դϴ�
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
	
	@Test
	public void testInsertRecipe() {
		RecipeVO board = new RecipeVO();
		board.setId("user1");
		board.setRecipeName("�Ķ��̰��");
		board.setRecipeDescription("�̰��� ������ �丮�Դϴ�.");
		board.setFoodTypeNo(3020001L);
		board.setFoodType("�ѽ�");
		board.setTime("3��");
		board.setPerson("1�κ�");
		board.setDifficulty("�ʺ�");
		board.setImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		
		mapper.insertRecipe(board);
		log.info(board);
	}
	
	@Test
	public void testInsertStep() {
		StepVO board = new StepVO();
		board.setBno(195457L);
		board.setStepNo(1L);
		board.setStepDescription("����� ����.");
		board.setStepImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		board.setTip("�ʹ� �����ϴ�.");
		
		mapper.insertStep(board);
		log.info(board);
	}
	
	@Test
	public void testInsertIngredient() {
		IngredientVO board = new IngredientVO();
		board.setBno(195457L);
		board.setIngreName("���");
		board.setIngreMeasure("�ణ");
		board.setIngreType("�����");
		
		mapper.insertIngredient(board);
		log.info(board);
	}
	// �⺻Ű , �ܷ�Ű�� Ȯ��
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
	
	@Test
	public void testUpdateRecipe() {
		RecipeVO board = new RecipeVO();
		board.setBno(195457L);
		board.setId("user1");
		board.setRecipeName("�Ķ��̰����");
		board.setRecipeDescription("�̰��� ������ �丮�Դϴ�!");
		board.setFoodTypeNo(3020001L);
		board.setFoodType("�ѽ�");
		board.setTime("3��");
		board.setPerson("1�κ�");
		board.setDifficulty("�ʺ�");
		board.setImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		
		int count = mapper.updateRecipe(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testUpdateRecipew() { //필요한 부분만 udpate(레시피)
		RecipeVO board = new RecipeVO();
		board.setBno(195454L);
		board.setRecipeName("계란후라이");
		board.setRecipeDescription("매우 간단한 요리!!");
		board.setFoodTypeNo(3020001L);
		board.setFoodType("한식");
		board.setTime("5분");
		board.setPerson("1인분");
		board.setDifficulty("초보환영");
		
		int count = mapper.updateRecipew(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testUpdateStep() {
		StepVO board = new StepVO();
		board.setSno(3026L);
		board.setBno(195457L);
		board.setStepNo(1L);
		board.setStepDescription("�ұ��� �ִ´�.");
		board.setStepImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		board.setTip("����");
		
		int count = mapper.updateStep(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testUpdateIngredient() {
		IngredientVO board = new IngredientVO();
		board.setIno(195468L);
		board.setBno(195457L);
		board.setIngreName("�ұ�");
		board.setIngreMeasure("�ణ");
		board.setIngreType("���");
		
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