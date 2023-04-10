package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Recipe/*")
@AllArgsConstructor
public class CartController {
	private CartService Service;
	
	public void list(Model model) {}
	public String register(CartVO vo , RedirectAttributes rttr) {
		return "";
	}
	public void register() {}
	
	public String modify(Long OwnNo, RedirectAttributes rttr) {
		return null;
	}
	
	public String remove(Long OwnNo, RedirectAttributes rttr) {
		return null;
	}
	
}
