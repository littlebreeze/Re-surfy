package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mypage/*")
public class CartController {
	
	private CartService service;
	
	@GetMapping("/cart")
	public void cartList(Criteria cri, Model model) {
		log.info("장바구니 페이지 진입");
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PostMapping("/deleteCart")
	public String remove(@RequestParam(value="chbox[]") List<Long> cno, RedirectAttributes rttr) {
		log.info(cno.toString());
		if(service.remove(cno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/cart";
	}
	
	@PostMapping("/addCart")
	public String register(@RequestParam(value = "pArr[]") List<Long> pArr,
			@RequestParam(value = "tArr[]") List<String> tArr, @RequestParam(value = "igArr[]") List<String> igArr,
			@RequestParam(value = "imArr[]") List<String> imArr,@RequestParam(value = "pIdArr[]") List<Long> pIdArr, RedirectAttributes rttr) {

		List<Long> pidList = service.getpIDList();
		//이미 있는 제품이면 update를 하고 없으면 insert를 하고싶은디
		
		List<CartVO> cart = new ArrayList<CartVO>();
		List<CartVO> cartUpdate = new ArrayList<CartVO>();
		
		for (int i = 0; i < pArr.size(); i++) {
			CartVO c = new CartVO();
			c.setId("user1");
			c.setPrice(pArr.get(i));
			String str = tArr.get(i).length() > 30 ? tArr.get(i).substring(0, 30) : tArr.get(i); // DB에 맞춰 문자열 길이 변경
			c.setCount(1L);
			c.setPname(str);
			c.setIname(igArr.get(i));
			c.setPimage(imArr.get(i));
			c.setProductid(pIdArr.get(i));
			if(pidList.contains(pIdArr.get(i)))	//이미 있으면 update 해야하니까
				cartUpdate.add(c);
			else
				cart.add(c);
		}
		if (service.register(cart)) {
			rttr.addFlashAttribute("result", "success");
		}
		if (service.modify(cartUpdate)) {
			rttr.addFlashAttribute("resultUp", "success");
		}
		return "redirect:/mypage/cart";
	}
	
	@PostMapping("/updateCart")
	public String modify(@RequestParam(value = "cno") Long cno, @RequestParam(value = "count") Long count, RedirectAttributes rttr) {
		CartVO c = new CartVO();
		c.setCno(cno);
		c.setCount(count);
		if (service.modifyCount(c)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/cart";
	}
}
