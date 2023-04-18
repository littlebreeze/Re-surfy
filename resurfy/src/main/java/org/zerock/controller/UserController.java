package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
<<<<<<< HEAD
    public String join(UserVO userVO , Model model) {
        log.info("-------------------Ȯ�ο�-------------------");
        log.info("joinConfirm(�Ϲ� ȸ��): " + userVO.toString());
=======
    public String join(UserVO userVO) {
        log.info("-------------------확인용------------------");
        log.info("joinConfirm(일반회원): " + userVO.toString());
>>>>>>> branch 'main' of https://github.com/barcataeeon/Re-surfy.git
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
        return "recipe/get";
    }
	
	 
	
}