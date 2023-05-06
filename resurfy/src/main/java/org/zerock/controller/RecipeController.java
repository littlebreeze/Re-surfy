package org.zerock.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import org.zerock.utils.UploadFileUtils;

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

	private String uploadPath;

	@GetMapping("/registerRecipe")
	public void register() {
	}

	@PostMapping("/registerRecipe.do")
	public String register(HttpServletRequest request, RecipeVO recipe, MultipartFile[] stepImage,
			@RequestParam List<String> ingreType, @RequestParam List<String> ingreName,
			@RequestParam List<String> ingreMeasure, @RequestParam List<String> stepDescription,
			@RequestParam List<String> tip, RedirectAttributes rttr) throws Exception {

		log.info("넘어온 재료 개수 : " + ingreName.size());
		log.info("넘어온 재료타입 개수 : " + ingreType.size());
		log.info("넘어온 재료용량 개수 : " + ingreMeasure.size());
		log.info("넘어온 과정 개수 : " + stepDescription.size());
		log.info("넘어온 tip 개수 : " + tip.size());
		log.info("넘어온 과정이미지 개수 : " + stepImage.length);

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (stepImage[0] != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, stepImage[0].getOriginalFilename(),
					stepImage[0].getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		// vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator +
		// fileName);

		HttpSession session = request.getSession();
		UserVO sessionUser = (UserVO) session.getAttribute("member");
		String userID = "";
		if (sessionUser != null)
			userID = sessionUser.getId();

		recipe.setId(userID);
		recipe.setImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		log.info("BNO (전) : " + recipe.getBno());
		boolean rSuccess = rService.register(recipe);
		log.info("BNO (전) : " + recipe.getBno());

		List<IngredientVO> iboard = new ArrayList<>();
		for (int i = 0; i < ingreName.size(); i++) {
			IngredientVO ivo = new IngredientVO();
			ivo.setBno(recipe.getBno());
			ivo.setIngreType(ingreType.get(i));
			ivo.setIngreName(ingreName.get(i));
			ivo.setIngreMeasure(ingreMeasure.get(i));
			iboard.add(ivo);
		}

		List<StepVO> sboard = new ArrayList<>();
		for (int i = 0; i < stepDescription.size() - 1; i++) { // +1개가 넘어와서 -1을 적어줬다.
			StepVO svo = new StepVO();
			svo.setBno(recipe.getBno());
			svo.setStepNo((long) (i + 1));
			svo.setStepDescription(stepDescription.get(i));
			if (!stepImage[i + 1].isEmpty()) {
				fileName = UploadFileUtils.fileUpload(imgUploadPath, stepImage[i + 1].getOriginalFilename(),
						stepImage[i + 1].getBytes(), ymdPath);
				svo.setStepImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			} else {
				svo.setStepImage("");
			}
			svo.setTip(tip.get(i));
			sboard.add(svo);
		}

		boolean iSuccess = iService.register(iboard);
		boolean sSuccess = sService.register(sboard);

		if (rSuccess && iSuccess && sSuccess) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "failure");
		}

		rttr.addFlashAttribute("message", "register success");

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
		model.addAttribute("soloList", rService.getRecipeSolo());
		model.addAttribute("coupleList", rService.getRecipeCouple());
		model.addAttribute("familyList", rService.getRecipeFamily());
		
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

	@GetMapping("/TopTenByReply")
	public void ListSortByReply(Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("sortByReply", rService.sortByReplyCnt());
	}

	@GetMapping("/TopTenByVisit")
	public void ListSortByVisit(Model model, @ModelAttribute("cri") Criteria cri) {
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