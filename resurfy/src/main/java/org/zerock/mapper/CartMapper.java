package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;

public interface CartMapper {

	public List<CartVO> getList();
	
	public List<CartVO> getListPaging(Criteria cri);
	
	public void insert(CartVO cart);
	
	public int delete(Long bno);
	
	public int update(CartVO board);
	
	public int getTotalCount(Criteria cri);
}
