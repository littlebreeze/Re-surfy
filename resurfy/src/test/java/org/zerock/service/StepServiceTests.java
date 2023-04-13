package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.StepVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class StepServiceTests {
	@Autowired
	private StepService service;

	@Test
	public void testRegister() {
		StepVO board = new StepVO();
		board.setBno(195457L);
		board.setStepNo(1L);
		board.setStepDescription("계란을 깬다.");
		board.setStepImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		board.setTip("너무 쉽습니다.");
		
		service.register(board);
		log.info("생성된 게시물 먼호..." + board.getSno());
	}
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testGetStepList() {
		service.getList().forEach(board -> log.info(board));;
	}
	
	@Test
	public void testGetStep() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testStepUpdate() {
		StepVO board = service.get(1L);
		
		if(board == null) {
			return;
		}
		board.setStepDescription("매우 쉽습니다");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
	
	@Test
	public void testStepDelete() {
		log.info("REMOVE RESULT : " + service.remove(1L));
	}

	

}
