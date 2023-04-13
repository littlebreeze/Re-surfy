package org.zerock.service;

import java.util.List;

import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;


public interface CartService {
	public boolean register(List<CartVO> cart);

	public boolean modify(List<CartVO> cartUpdate);

	public boolean remove(List<Long> cno);

	public List<CartVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<Long> getpIDList();
	
	public boolean modifyCount(CartVO cart);
}
