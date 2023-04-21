package org.zerock.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class UserController {
	
	@Autowired
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
        log.info("-------------------확인용------------------");
        log.info("joinConfirm(일반회원): " + userVO.toString());
        Service.join(userVO);
        return "member/login";
	}
	
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	/* 로그인 */
    @RequestMapping(value="loginCheck.do", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, UserVO vo, RedirectAttributes rttr) throws Exception{
        
        System.out.println("login 메서드 진입");
        System.out.println("전달된 데이터 : " + vo);
    	
    	HttpSession session = request.getSession();
    	UserVO lvo = Service.loginCheck(vo);
       
    	
    	if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "member/login";
            
        }
        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        return "redirect:/recipe/get";
    }
    
    @PostMapping("logout.do")
   	public String logout(HttpServletRequest request, UserVO vo, RedirectAttributes rttr) throws Exception{
       	System.out.println("세션삭제");
       	HttpSession session = request.getSession();
       	request.getSession(true).invalidate();
   		return "redirect:/recipe/get";
   	}
    
	// 아이디 중복 검사
    @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		
		int result = Service.idCheck(memberId);
		
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}
		
	}
    // 문자인증
    @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
    @ResponseBody
    public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
    	int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

    	Service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
    	
    	return Integer.toString(randomNumber);
    }
	 
	
}