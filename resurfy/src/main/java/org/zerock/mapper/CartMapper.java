package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CartVO;

public interface CartMapper {
	public int insert(CartVO vo);
	public List<CartVO> getList();
	public int delete(Long cno);
	public int update(CartVO vo);
}
