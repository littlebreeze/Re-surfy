package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.RecipeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class StepServiceTests {
	@Autowired
	private StepService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testGetStepList() {
		service.getList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testGetStep() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testStepUpdate() {
		
	}
	
	@Test
	public void testStepDelete() {
		log.info("REMOVE RESULT : " + service.remove(534L));
	}

	

}
