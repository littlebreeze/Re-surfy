
package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.RecipeMapper;
import org.zerock.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor //모든 생성자를 주입한다.

public class CartServiceImpl implements CartService {
	
	private CartMapper mapper;
	
	@Override
	public void register(List<CartVO> cart) {
		for (CartVO cartVO : cart) {
			mapper.insert(cartVO);
		}
	}

	@Override
	public boolean modify(CartVO cart) {
		mapper.update(cart);
		return false;
	}

	@Override
	public boolean remove(Long cno) {
		mapper.delete(cno);
		return false;
	}

	@Override
	public List<CartVO> getList() {
		return mapper.getList();
	}

}
