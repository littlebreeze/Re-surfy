package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

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
	}
	
	@PostMapping("/upload")
	public void upload(@RequestParam("uploadFile") MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "C:\\Users\\user\\git\\resurfy_project\\Re-surfy\\resurfy\\src\\main\\webapp\\resources\\assets\\upload";
		for (MultipartFile multipartFile : uploadFile) {
			log.info("--------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File size : " + multipartFile.getSize());
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}

	@PostMapping("/registerRecipe.do")
	public String register(RecipeVO rvo,IngredientVO ingre,StepVO step,
			HttpServletRequest request, 
			@RequestParam("recipeName") String recipeName,
			@RequestParam("recipeDescription") String recipeDescription,
			@RequestParam("image") String image,
			@RequestParam("foodType") String foodType, @RequestParam("person") String person,
			@RequestParam("difficulty") String difficulty, @RequestParam("time") String time,
			@RequestParam("ingreType") String ingreType, @RequestParam("ingreMeasure") String[] ingreMeasure,
			@RequestParam("ingreName") String[] ingreName, @RequestParam("stepNo") Long[] stepNo,
			@RequestParam("stepDescription") String[] StepDescription, @RequestParam("stepImage") String[] stepImage,
			@RequestParam("tip") String[] tip, RedirectAttributes rttr) {
		
		Long bno = rService.getNextBno() - 1;
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

		rvo.setFoodType(foodType);
		rvo.setPerson(person);
		rvo.setDifficulty(difficulty);
		rvo.setTime(time);
		String fileurl = "/resources/assets/upload/";
		rvo.setImage(fileurl + image);
		rService.register(rvo);
		rttr.addFlashAttribute("result_recipe", rvo.getBno());

		for (int i = 0; i < ingreName.length; i++) {
			ingre = new IngredientVO();
			ingre.setIngreType(ingreType);
			ingre.setBno(bno);
			ingre.setIngreMeasure(ingreMeasure[i]);
			ingre.setIngreName(ingreName[i]);
			iService.register(ingre);
			rttr.addFlashAttribute("register_ingredient", ingre.getIno());
		}
		for (int i = 0; i < stepNo.length; i++) {
			step = new StepVO();
			step.setBno(bno);
			step.setStepNo(stepNo[i]);
			step.setStepDescription(StepDescription[i]);
			step.setStepImage(stepImage[i]);
			step.setTip(tip[i]);
			sService.register(step);
			rttr.addFlashAttribute("register_step", step.getSno());
		}

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
	
	@PostMapping("/uploadAjaxAction")
	 public void uploadAjaxPost(MultipartFile[] uploadFile) {
	
	 log.info("update ajax post.........");
	
	 String uploadFolder = "C:\\Users\\user\\git\\resurfy_project\\Re-surfy\\resurfy\\src\\main\\webapp\\resources\\assets\\upload";
	 
	//make folder
	 		File uploadPath = new File(uploadFolder, getFolder());
	 		if(uploadPath.exists()==false) {
	 			uploadPath.mkdirs();
			}
	
	 for (MultipartFile multipartFile : uploadFile) {
	
	 log.info("-------------------------------------");
	 log.info("Upload File Name: " + multipartFile.getOriginalFilename());
	 log.info("Upload File Size: " + multipartFile.getSize());
	
	 String uploadFileName = multipartFile.getOriginalFilename();
	
	 // IE has file path
	 uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +
	 1);
	 
	 UUID uuid = UUID.randomUUID();
	 uploadFileName = uuid.toString() + "_" + uploadFileName;
	 
	 log.info("only file name: " + uploadFileName);
	
//	 File saveFile = new File(uploadFolder, uploadFileName);
	
	 try {
		 File saveFile = new File(uploadPath, uploadFileName);
		 multipartFile.transferTo(saveFile);
		 
		 if(checkImageType(saveFile)) {
				FileOutputStream thumbnail = new FileOutputStream(
						new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), 
						thumbnail, 100, 100);
				thumbnail.close();
			 
		 }
	 } catch (Exception e) {
	 log.error(e.getMessage());
	 } // end catch
	
	 } // end for
	
	 }
	
	 private String getFolder() {
		     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		     Date date = new Date();
		     String str = sdf.format(date);
		     return str.replace("-", File.separator);
		   }
	 
	 private boolean checkImageType(File file) {

			try {
				String contentType = Files.probeContentType(file.toPath());

				return contentType.startsWith("image");

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return false;
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