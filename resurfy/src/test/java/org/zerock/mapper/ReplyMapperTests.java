package org.zerock.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	@Autowired
	private ReplyMapper mapper;
	
	private Long[] bnoArr = {2L ,3L ,4L ,5L ,6L};
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO board = new ReplyVO();
			
			board.setBno(bnoArr[i%5]);
			board.setReply("´ñ±Û Å×½ºÆ® " + i);
			
			mapper.insert(board);
		
		});
	}
	
	@Test
	public void testRead() {
		ReplyVO board = mapper.read(5L);
		
		log.info(board);
		
	}
	
	@Test
	public void testDelete() {
		mapper.delete(5L);
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		replies.forEach(reply -> log.info(reply));
	}
	
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria (1,4);
		List<ReplyVO> replies = mapper.getListWithPaging(cri,1L);
		
		replies.forEach(reply -> log.info(reply));
	}
}
