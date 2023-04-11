package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CartVO;

public interface CartMapper {

	public List<CartVO> getList();
	
	public void insert(CartVO cart);
	
	public int delete(Long bno);
	
	public int update(CartVO board);
}
