package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.StepVO;

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
	
	// 부모테이블(recipe_tbl)에 기본키 (bno) 값이 있으면 정상 수행
	@Test
	public void testRegister() {
		StepVO board = new StepVO();
		board.setBno(195457L);
		board.setStepNo(1L);
		board.setStepDescription("계란을 깬다.");
		board.setStepImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		board.setTip("너무 쉽습니다.");
		
		service.register(board);
		log.info("생성된 게시물의 번호 : " + board.getSno());
	}
	
	@Test
	public void testGet() {
		log.info(service.get(2L));
	}
	
	@Test
	public void testModify() {
		StepVO board = service.get(2L);
		if(board == null) {
			return;
		}
		board.setTip("굉장히 쉽습니다");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
	
	@Test
	public void testRemove() {
		log.info("REMOVE RESULT : " + service.remove(1L));
	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2,10)).forEach(board -> log.info(board));
	}
}
