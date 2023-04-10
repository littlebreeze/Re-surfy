package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	public void register(ReplyVO vo);
	public ReplyVO get(Long bno);
	public boolean modify(ReplyVO vo);
	public List<ReplyVO> getList(Criteria cri)
	public int getTotal(Criteria cri);
	
}
