package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;
import org.zerock.service.CartService;
import org.zerock.service.OwnService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mypage/*")
public class OwnController {
	
	private OwnService service;	
	
	@GetMapping("/own")
	public void ownList(Criteria cri, Model model) {
		log.info("가진 재료 페이지 진입");
		model.addAttribute("list", service.getList());
	}
	
	public String register(OwnVO vo , RedirectAttributes rttr) {
		return "";
	}
	public void register() {}
	
	public String modify(OwnVO vo, RedirectAttributes rttr) {
		return null;
	}
	
}
