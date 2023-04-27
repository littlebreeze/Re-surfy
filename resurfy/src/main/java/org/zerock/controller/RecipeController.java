package org.zerock.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	private RecipeService rService;
	private StepService sService;
	private IngredientService iService;
	private ShoppingService shService;
	private OwnService oService;
	static Long bno = 195564L;					//시퀀스 번호 Resurfy 계정마다 다름

	@GetMapping("/registerRecipe")
	public void register() {
	}

	@PostMapping("/registerRecipe")
	public String register(RecipeVO rvo, HttpServletRequest request, @RequestParam("recipeName") String recipeName,
			@RequestParam("recipeDescription") String recipeDescription,
			@RequestParam("image") String image,
			@RequestParam("combinedFoodValue") String combinedFoodValue, @RequestParam("person") String person,
			@RequestParam("difficulty") String difficulty, @RequestParam("time") String time,
			@RequestParam("ingreType") String[] ingreType, @RequestParam("ingreMeasure") String[] ingreMeasure,
			@RequestParam("ingreName") String[] ingreName, @RequestParam("stepNo") Long[] stepNo,
			@RequestParam("stepDescription") String[] StepDescription, @RequestParam("stepImage") String[] stepImage,
			@RequestParam("tip") String[] tip, RedirectAttributes rttr) {

		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if (sessionUser != null)
			userID = sessionUser.getId();
		
		rvo.setBno(bno);
		rvo.setRecipeName(recipeName);
		rvo.setRecipeDescription(recipeDescription);
		rvo.setId(userID);
		rvo.setRecipeDate(null);

		String[] FoodValue = combinedFoodValue.split("\\|");
		String foodType = FoodValue[1];
		Long foodTypeNo = Long.parseLong(FoodValue[0]);

		rvo.setFoodType(foodType);
		rvo.setFoodTypeNo(foodTypeNo);

		rvo.setPerson(person);
		rvo.setDifficulty(difficulty);
		rvo.setTime(time);
		rvo.setImage("" + image);
		
		rService.register(rvo);
		rttr.addFlashAttribute("result_recipe", rvo.getBno());

		List<IngredientVO> ingredientList = new ArrayList<>();
		for (int i = 0; i < ingreType.length; i++) {
			IngredientVO ingredient = new IngredientVO();

			// ingreType 파라미터 값에서 ingreTypeNo와 ingreType을 추출하여 IngredientVO 객체에 설정
			String[] ingreTypeValue = ingreType[i].split("\\|");
			Long ingreTypeNo = Long.parseLong(ingreTypeValue[0]);
			String ingreType1 = ingreTypeValue[1];
			ingredient.setIngreTypeNo(ingreTypeNo);
			ingredient.setIngreType(ingreType1);
			ingredient.setBno(rvo.getBno());

			ingredient.setIngreMeasure(ingreMeasure[i]);
			ingredient.setIngreName(ingreName[i]);
			ingredientList.add(ingredient);
		}

		List<StepVO> stepList = new ArrayList<>();
		for (int i = 0; i < stepNo.length; i++) {
			StepVO step = new StepVO();
			step.setBno(rvo.getBno());
			step.setStepNo(stepNo[i]);
			step.setStepDescription(StepDescription[i]);
			step.setStepImage(stepImage[i]);
			step.setTip(tip[i]);
			stepList.add(step);
		}
		bno++;
		iService.registerAll(ingredientList);
		sService.registerAll(stepList);

		rttr.addFlashAttribute("register_step", stepList);
		rttr.addFlashAttribute("register_ingredient", ingredientList);

		return "redirect:/recipe/get";

	}

	@GetMapping("/detail")
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

	@GetMapping("/modify")
	public void modifyGet(@RequestParam("bno") Long bno, Model model) {
		log.info("/detail or modify");
		model.addAttribute("recipe", rService.get(bno));
		model.addAttribute("ingre", iService.get(bno));
		model.addAttribute("step", sService.get(bno));
	}

	@PostMapping("/modify")
	public String modify(RecipeVO board, @RequestParam List<Long> ino, @RequestParam List<String> ingreType,
			@RequestParam List<String> ingreName, @RequestParam List<String> ingreMeasure, @RequestParam List<Long> sno,
			@RequestParam List<String> stepDescription, @RequestParam List<String> stepTip, RedirectAttributes rttr) {

		if (rService.modifyw(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		List<IngredientVO> iboard = new ArrayList<>();
		;
		List<StepVO> sboard = new ArrayList<>();

		for (int i = 0; i < ino.size(); i++) {
			IngredientVO ivo = new IngredientVO();
			ivo.setIno(ino.get(i));
			ivo.setIngreType(ingreType.get(i));
			ivo.setIngreName(ingreName.get(i));

			switch (ingreType.get(i)) {
			case "주재료":
				ivo.setIngreTypeNo(3060001L);
				break;
			case "부재료":
				ivo.setIngreTypeNo(3060002L);
				break;
			case "양념":
				ivo.setIngreTypeNo(3060003L);
				break;
			}
			ivo.setIngreMeasure(ingreMeasure.get(i));
			iboard.add(ivo);
		}

		for (int i = 0; i < sno.size(); i++) {
			StepVO svo = new StepVO();
			svo.setSno(sno.get(i));
			svo.setStepDescription(stepDescription.get(i));
			svo.setStepNo((long) (i + 1));
			svo.setTip(stepTip.get(i));
			sboard.add(svo);
		}

		if (iService.modify(iboard)) {
			rttr.addFlashAttribute("result", "success");
		}

		if (sService.modify(sboard)) {
			rttr.addFlashAttribute("result", "success");
		}

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
	public void ListSort(Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("sortByReply", rService.sortByReplyCnt());
		model.addAttribute("sortByVisit", rService.sortByVisitCnt());
	}

	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	public String modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
	}

	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return null;
	}

}