package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.IngredientVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class IngredientServiceTests {
	
	@Autowired
	private IngredientService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	// 부모테이블(recipe_tbl)에 기본키 (bno) 값이 있으면 정상 수행
	@Test
	public void testRegister() {
		IngredientVO board = new IngredientVO();
		board.setBno(195457L);
		board.setIngreName("계란");
		board.setIngreMeasure("약간");
		board.setIngreTypeNo(3060001L);
		board.setIngreType("주재료");
		service.register(board);
		log.info("생성된 게시물의 번호 : " + board.getIno());
	}
	
	@Test
	public void testGet() {
		log.info(service.get(2L));
	}
	
	@Test
	public void testRemove() {
		log.info("REMOVE RESULT : " + service.remove(1L));
	}
	
	@Test
	public void testModify() {
		IngredientVO board = service.get(2L);
		
		if(board == null) {
			return;
		}
		board.setIngreMeasure("300g");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
		
}
