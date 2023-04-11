package org.zerock.service;

import java.util.List;

import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;


public interface CartService {
	public void register(CartVO vo);
	public boolean modify(CartVO vo);
	public int getTotal(Criteria cri);
	public List<CartVO> getList();
	
}
