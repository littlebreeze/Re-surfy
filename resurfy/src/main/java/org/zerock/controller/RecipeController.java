package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.IngredientService;
import org.zerock.service.OwnService;
import org.zerock.service.RecipeService;
import org.zerock.service.ReplyService;
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
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/detail or modify");
		model.addAttribute("recipe", rService.get(bno));
		model.addAttribute("ingre", iService.get(bno));
		model.addAttribute("step", sService.get(bno));
		model.addAttribute("shopNotIn", shService.searchFromAPI(iService.getIngreList(bno)));
		model.addAttribute("shopIn", shService.searchFromAPI(iService.getIngreListHave(bno)));

	} 
		
	@GetMapping("/get")
	public void list(@ModelAttribute("cri") Criteria cri , Model model) {
		log.info("get" + cri);
		model.addAttribute("get",rService.getList(cri));
		log.info("list");
		model.addAttribute("listRecipe",rService.getAllList());
		model.addAttribute("list",oService.getList());
		int total = rService.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
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