package org.zerock.service;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RecipeServiceTests {
	@Autowired
	private RecipeService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
 /*select max(bno) from recipe_tbl; 하고 SELECT sequence_name, last_number, increment_by, min_value, max_value, cache_size 
	FROM user_sequences 
	WHERE sequence_name = 'SEQ_RECIPE';
	로 계속 bno 값 확인하시고 test 하면 수행 됩니다.
	*/

	@Test
	public void testRegister() {
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
		
		service.register(board);
		log.info("생성된 게시물의 번호 : " + board.getBno());
	}
	
	@Test
	public void testGetRecipeList() {
		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testModify() {
		RecipeVO board = service.get(1L);
		
		if (board==null) {
			return;
		}
		
		board.setRecipeDescription("간단한 요리입니다.");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
	
	@Test
	public void testRemove() {
		log.info("REMOVE RESULT : " + service.remove(195477L));
	}

	

}
