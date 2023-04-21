package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.UserVO;
import org.zerock.service.IngredientService;
import org.zerock.service.OwnService;
import org.zerock.service.RecipeService;
import org.zerock.service.ShoppingService;
import org.zerock.service.StepService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recipe/*")
@AllArgsConstructor
public class RecipeController {
	private RecipeService rService;
	private StepService sService;
	private IngredientService iService;
	private ShoppingService shService;
	private OwnService oService;

		
	@GetMapping("/registerRecipe")
	public void register() {
		log.info("/registerRecipe");
	}	
	
	@GetMapping({"/detail", "/modify"})
	public void get(HttpServletRequest request, @RequestParam("bno") Long bno, Model model) {
		log.info("/detail or modify");
		model.addAttribute("recipe", rService.get(bno));
		model.addAttribute("ingre", iService.get(bno));
		model.addAttribute("step", sService.get(bno));
		
		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if(sessionUser!=null)
			userID=sessionUser.getId();
		model.addAttribute("shopNotIn", shService.searchFromAPI(iService.getIngreList(bno, userID)));
		model.addAttribute("shopIn", shService.searchFromAPI(iService.getIngreListHave(bno, userID)));

	} 
		
	@GetMapping("/get")
	public void list(HttpServletRequest request, @ModelAttribute("cri") Criteria cri , Model model) {
		log.info("get" + cri);
		model.addAttribute("get",rService.getList(cri));
		log.info("list");
		model.addAttribute("listRecipe",rService.getAllList());
		model.addAttribute("sortByReply",rService.sortByReplyCnt());
		model.addAttribute("sortByVisit",rService.sortByVisitCnt());
		
		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		if(sessionUser!=null) {
			String userID = sessionUser.getId();		
			model.addAttribute("list",oService.getList(userID));
		}
		
		int total = rService.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove recipe..." + bno);
		if(sService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		if(iService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		if(rService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/recipe/get";
	}
	
	@GetMapping("/TopTen")
	public void ListSort(Model model) {
		model.addAttribute("sortByReply",rService.sortByReplyCnt());
		model.addAttribute("sortByVisit",rService.sortByVisitCnt());
	}
	
		
	
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri , Model model) {
		
	}
	
	public String modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
	}
	
	public String remove(@RequestParam("bno")Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
	}
	
}