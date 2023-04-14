package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class UserController {
	
	private UserService Service;
	
	public String register(UserVO vo , RedirectAttributes rttr) {
		return "";
	}
	public void register() {}
	
	public void get(Model model) {}
	
	public String remove(String id, RedirectAttributes rttr) {
		return null;
	
	}
	
	@PostMapping("join.do")
    public String join(UserVO userVO) {
        log.info("-------------------확인용-------------------");
        log.info("joinConfirm(일반 회원): " + userVO.toString());
        Service.join(userVO);
        return "member/login";
	}
	
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	 
	
}