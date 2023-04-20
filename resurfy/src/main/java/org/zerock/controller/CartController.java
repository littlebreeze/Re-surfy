package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.UserVO;
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
	public void cartList(HttpServletRequest request, Criteria cri, Model model) {
		log.info("enter Cart page");
		
		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if(sessionUser!=null)
			userID=sessionUser.getId();

		model.addAttribute("list", service.getList(userID));
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
	public String register(HttpServletRequest request, @RequestParam(value = "pArr[]") List<Long> pArr,
			@RequestParam(value = "tArr[]") List<String> tArr, @RequestParam(value = "igArr[]") List<String> igArr,
			@RequestParam(value = "imArr[]") List<String> imArr,@RequestParam(value = "pIdArr[]") List<Long> pIdArr, RedirectAttributes rttr) {

		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");

		List<Long> pidList = service.getpIDList(sessionUser.getId());
		
		List<CartVO> cart = new ArrayList<CartVO>();
		List<CartVO> cartUpdate = new ArrayList<CartVO>();
		
		for (int i = 0; i < pArr.size(); i++) {
			CartVO c = new CartVO();
			c.setId(sessionUser.getId());
			c.setPrice(pArr.get(i));
			String str = tArr.get(i).length() > 30 ? tArr.get(i).substring(0, 30) : tArr.get(i);
			c.setCount(1L);
			c.setPname(str);
			c.setIname(igArr.get(i));
			c.setPimage(imArr.get(i));
			c.setProductid(pIdArr.get(i));
			if(pidList.contains(pIdArr.get(i)))
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