package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.OwnVO;
import org.zerock.service.OwnService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Recipe/*")
@AllArgsConstructor
public class OwnController {
	private OwnService Service;
	
	public String register(OwnVO vo , RedirectAttributes rttr) {
		return "";
	}
	public void register() {}
	
	public void list(Model model) {}
	
	public String modify(OwnVO vo, RedirectAttributes rttr) {
		return null;
	}
	
}
