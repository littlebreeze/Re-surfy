package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.OwnVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.UserVO;
import org.zerock.service.CartService;
import org.zerock.service.OwnService;
import org.zerock.service.RecipeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mypage/*")
public class OwnController {
	
	private OwnService service;	
	private CartService cService;
	private RecipeService rService;
	
	@GetMapping("/own")
	public void ownList(HttpServletRequest request, Criteria cri, Model model) {
		log.info("enter Own page");
		
		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if(sessionUser!=null)
			userID=sessionUser.getId();

		model.addAttribute("list", service.getList(userID));
	}
	
	@PostMapping("/addOwnFromCart")
	public String ownRegisterFromCart(HttpServletRequest request, @RequestParam(value = "ingreArr[]") List<String> ingreArr, @RequestParam(value = "chbox[]") List<Long> cno, RedirectAttributes rttr) {

		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		
		List<OwnVO> own = new ArrayList<OwnVO>();
		for (int i = 0; i < ingreArr.size(); i++) {
			OwnVO o = new OwnVO();
			o.setId(sessionUser.getId());
			o.setIngreName(ingreArr.get(i));
			own.add(o);
		}
		cService.remove(cno);
		if (service.register(own)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/own";
	}
	
	@PostMapping("/addOwn")
	public String ownRegister(HttpServletRequest request, String addIngreName, RedirectAttributes rttr) {

		List<OwnVO> own = new ArrayList<OwnVO>();
		OwnVO o = new OwnVO();
		
		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		if(sessionUser!=null)
			o.setId(sessionUser.getId());
		
		o.setIngreName(addIngreName);
		own.add(o);
		if (service.register(own)) {
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
	
	@GetMapping("/list")
	public void list(HttpServletRequest request, Criteria cri, Model model) {

		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if(sessionUser!=null)
			userID=sessionUser.getId();

		model.addAttribute("relist", rService.getUserList(cri, userID));

		int total = rService.getUserTotal(cri, userID);

		log.info("total : " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PostMapping("/autocomplete")
	public @ResponseBody Map<String, Object> autocomplete(@RequestParam Map<String, Object> paramMap) throws Exception {

		List<Map<String, Object>> resultList = service.autocomplete(paramMap);
		paramMap.put("resultList", resultList);

		return paramMap;
	}
	
}