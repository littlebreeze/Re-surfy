
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
	public boolean register(List<CartVO> cart) {
		int cnt = 0;
		for (CartVO cartVO : cart) {
			cnt += mapper.insert(cartVO);
		}
		return cnt==cart.size();
	}

	@Override
	public boolean modify(List<CartVO> cart) {
		int cnt = 0;
		for (CartVO cartVO : cart) {
			cnt += mapper.update(cartVO);
		}
		return cnt==cart.size();
	}

	@Override
	public boolean remove(List<Long> cno) {
		int cnt = 0;
		for (Long long1 : cno) {
			cnt += mapper.delete(long1);
		}
		return cnt==cno.size();
	}

	@Override
	public List<CartVO> getList(String userID) {
		return mapper.getList(userID);
	}
	
	@Override
	public List<Long> getpIDList(String userID) {
		return mapper.getpIdList(userID);
	}
	
	@Override
	public boolean modifyCount(CartVO cart) {
		return mapper.updateCount(cart);
	}
	
}
