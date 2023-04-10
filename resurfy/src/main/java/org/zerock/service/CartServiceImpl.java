
package org.zerock.service;

import java.util.List;

import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.CartMapper;

public class CartServiceImpl implements CartService {
	private CartMapper mapper;
	@Override
	public void register(CartVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean modify(CartVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CartVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
