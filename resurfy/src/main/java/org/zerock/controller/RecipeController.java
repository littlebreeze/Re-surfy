package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.StepVO;
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
	
	@Autowired
	private RecipeService rService;
	@Autowired
	private StepService sService;
	@Autowired
	private IngredientService iService;
	@Autowired
	private ShoppingService shService;
	@Autowired
	private OwnService oService;

	@GetMapping("/registerRecipe")
	public void register() {
	}

	@PostMapping("/registerRecipe")
	public String registerRecipe(HttpServletRequest request, RecipeVO recipe , RedirectAttributes rttr){		
		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if(sessionUser!=null) 
			userID=sessionUser.getId();
			recipe.setId(userID);
	
		rService.register(recipe);
		rttr.addFlashAttribute("register...recipe",recipe.getBno());
		return "redirect:/recipe/get";
	}	
	
	@PostMapping("/registerSteps")
	public ResponseEntity<String> registerSteps(@RequestBody List<StepVO> steps) {
	    try {
	        sService.registerAll(steps);
	        return new ResponseEntity<>("success", HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}

	@PostMapping("/registerIngredients")
	public ResponseEntity<String> registerIngredients(@RequestBody List<IngredientVO> ingrs) {
	    try {
	        iService.registerAll(ingrs);
	        return new ResponseEntity<>("success", HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}

	@GetMapping({ "/detail", "/modify" })
	public void get(HttpServletRequest request, @RequestParam("bno") Long bno, Model model) {
		log.info("/detail or modify");
		model.addAttribute("recipe", rService.get(bno));
		model.addAttribute("ingre", iService.get(bno));
		model.addAttribute("step", sService.get(bno));

		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if (sessionUser != null)
			userID = sessionUser.getId();
		model.addAttribute("shopNotIn", shService.searchFromAPI(iService.getIngreList(bno, userID)));
		model.addAttribute("shopIn", shService.searchFromAPI(iService.getIngreListHave(bno, userID)));

	}

	@GetMapping("/get")
	public void list(HttpServletRequest request, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get" + cri);
		model.addAttribute("get", rService.getList(cri));
		log.info("list");
		model.addAttribute("listRecipe", rService.getAllList());
		model.addAttribute("sortByReply", rService.sortByReplyCnt());
		model.addAttribute("sortByVisit", rService.sortByVisitCnt());

		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		if (sessionUser != null) {
			String userID = sessionUser.getId();
			model.addAttribute("list", oService.getList(userID));
		}

		int total = rService.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/modify")
	public String modify(RecipeVO board, IngredientVO iboard, StepVO sboard, RedirectAttributes rttr) {

		log.info("modfiy:" + iboard);
		String str = iboard.getIngreName();
		log.info("str : " + str);

		if (rService.modifyw(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		/*
		 * if(iService.modify(iboard)) { rttr.addFlashAttribute("result", "success"); }
		 * 
		 * if(sService.modifyw(sboard)) { rttr.addFlashAttribute("result", "success"); }
		 */
		return "redirect:/recipe/get";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove recipe..." + bno);
		if (sService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		if (iService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		if (rService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/recipe/get";
	}

	@GetMapping("/TopTen")
	public void ListSort(Model model ,@ModelAttribute("cri") Criteria cri) {
		model.addAttribute("sortByReply",rService.sortByReplyCnt());
		model.addAttribute("sortByVisit",rService.sortByVisitCnt());
	}

	
	
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri , Model model) {
	

	}

	public String modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
	}

	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
	}

}