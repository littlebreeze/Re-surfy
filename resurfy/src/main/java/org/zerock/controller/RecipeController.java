package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@PostMapping("/registerRecipe.do")
	public String register(HttpServletRequest request, @RequestParam("recipeName") String recipeName, @RequestParam("recipeDescription") String recipeDescription,
			@RequestParam("image") String image, @RequestParam("foodType") String combinedFoodValue, @RequestParam("person") String person, 
			@RequestParam("difficulty") String difficulty, @RequestParam("time") String time, 
			@RequestParam("ingreType") String [] ingreType, @RequestParam("ingreMeasure") String [] ingreMeasure, @RequestParam("ingreName") String [] ingreName, 
			@RequestParam("stepNo") Long [] stepNo, @RequestParam("stepDescription") String [] StepDescription, @RequestParam("stepImage") String [] stepImage,
			@RequestParam("tip") String [] tip,
			RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if(sessionUser!=null) 
			userID=sessionUser.getId();
		
        RecipeVO rvo = new RecipeVO();
        rvo.setRecipeName(recipeName);
        rvo.setRecipeDescription(recipeDescription);
        rvo.setImage(image);
        rvo.setId(userID);
        rvo.setRecipeDate(null);
        
        String[] FoodValue = combinedFoodValue.split("\\|");
        Long foodTypeNo = Long.parseLong(FoodValue[0]);
        String foodType = FoodValue[1];
        
        rvo.setFoodType(foodType);
        rvo.setFoodTypeNo(foodTypeNo);
        rvo.setPerson(person);
        rvo.setDifficulty(difficulty);
        rvo.setTime(time);
        
        List<IngredientVO> ingredientList = new ArrayList<>();
        for (int i = 0; i < ingreType.length; i++) {
            IngredientVO ingredient = new IngredientVO();
            
            // ingreType 파라미터 값에서 ingreTypeNo와 ingreType을 추출하여 IngredientVO 객체에 설정
            String[] ingreTypeValue = ingreType[i].split("\\|");
            Long ingreTypeNo = Long.parseLong(ingreTypeValue[0]);
            String ingreType1 = ingreTypeValue[1];
            ingredient.setIngreTypeNo(ingreTypeNo);
            ingredient.setIngreType(ingreType1);
            
            ingredient.setIngreMeasure(ingreMeasure[i]);
            ingredient.setIngreName(ingreName[i]);
            ingredientList.add(ingredient);
        }
        
        List<StepVO> stepList = new ArrayList<>();
        for (int i = 0; i < stepNo.length; i++) {
            StepVO step = new StepVO();
            step.setStepNo(stepNo[i]);
            step.setStepDescription(StepDescription[i]);
            step.setStepImage(stepImage[i]);
            step.setTip(tip[i]);
            stepList.add(step);
        }
        
        rService.register(rvo);
        boolean iSuccess = iService.register(ingredientList);
        boolean sSuccess = sService.register(stepList);
        
        		
        if (iSuccess && sSuccess) {
        rttr.addFlashAttribute("result", "success");
        } else {
        rttr.addFlashAttribute("result", "failure");
        }

        rttr.addFlashAttribute("message", "register success");
        return "redirect:/recipe/get";
		
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