package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
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
	
	@Test
	public void testGetRecipeList() {
		service.getList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(534L));
	}
	
	@Test
	public void testUpdate() {
		RecipeVO board = service.get(534L);
		
		if (board==null) {
			return;
		}
		
		board.setRecipeDescription("간단한 요리입니다.");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove(534L));
	}

	

}
