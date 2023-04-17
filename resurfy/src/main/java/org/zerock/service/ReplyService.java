package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	public void register(ReplyVO vo);
	public ReplyVO get(Long rno);
	public boolean modify(ReplyVO vo);
	public List<ReplyVO> getList(Criteria cri,Long bno);
	public int getTotal(Long bno);
	public int remove(Long rno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	
}
