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
import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;
import org.zerock.domain.PageDTO;
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
	private CartService cService;
	
	@GetMapping("/own")
	public void ownList(Criteria cri, Model model) {
		log.info("가진 재료 페이지 진입");
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getList());
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PostMapping("/addOwn")
	public String ownRegister(@RequestParam(value = "ingreArr[]") List<String> ingreArr, @RequestParam(value = "chbox[]") List<Long> cno, RedirectAttributes rttr) {

		List<OwnVO> own = new ArrayList<OwnVO>();
		for (int i = 0; i < ingreArr.size(); i++) {
			OwnVO o = new OwnVO();
			o.setId("user1");
			o.setIngreName(ingreArr.get(i));
			own.add(o);
		}
		cService.remove(cno);	//장바구니에서 삭제
		if (service.register(own)) {	//가진 재료로 등록
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/own";
	}
	
	@PostMapping("/deleteOwn")
	public String remove(@RequestParam(value = "chbox[]") List<Long> cno, RedirectAttributes rttr) {
		log.info(cno.toString());
		if (service.remove(cno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/cart";
	}
	
	public String modify(OwnVO vo, RedirectAttributes rttr) {
		return null;
	}
	
}
