package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.RecipeMapper;
import org.zerock.mapper.ReplyMapper;

public class ReplyServiceImpl implements ReplyService {
	private RecipeMapper recipeMapper;
	private ReplyMapper mapper;
	@Override
	public void register(ReplyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ReplyVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ReplyVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}
