package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;

public interface CartMapper {

	public List<CartVO> getList(String userID);
	
	public int insert(CartVO cart);
	
	public int delete(Long bno);
	
	public int update(CartVO board);
	public List<Long> getpIdList(String id);
	
	public boolean updateCount(CartVO cart);
}
