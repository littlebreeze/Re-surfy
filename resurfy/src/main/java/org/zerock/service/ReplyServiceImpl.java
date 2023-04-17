package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.RecipeMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor 
public class ReplyServiceImpl implements ReplyService {
	private RecipeMapper recipeMapper;
	private ReplyMapper mapper;
	
	@Transactional
	@Override
	public void register(ReplyVO vo) {
		log.info("register....." + vo);
		mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long bno) {
		log.info("get...." + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ReplyVO vo) {
		log.info("modify......" + vo);
		return mapper.update(vo) == 1;
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("getList ith criteria....." + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public int getTotal(Long bno) {
		log.info("getTotal...." + bno);
		return mapper.getCountByBno(bno);
	}
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove......" + rno);
		return mapper.delete(rno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}
}
