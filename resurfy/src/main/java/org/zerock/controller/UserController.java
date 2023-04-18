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
        log.info("-------------------확인용-------------------");
        log.info("joinConfirm(일반 회원): " + userVO.toString());
=======
    public String join(UserVO userVO) {
        log.info("-------------------�솗�씤�슜------------------");
        log.info("joinConfirm(�씪諛섑쉶�썝): " + userVO.toString());
>>>>>>> branch 'main' of https://github.com/barcataeeon/Re-surfy.git
        Service.join(userVO);
        return "member/login";
	}
	
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	/* 濡쒓렇�씤 */
    @RequestMapping(value="loginCheck.do", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, UserVO vo, RedirectAttributes rttr) throws Exception{
        
        System.out.println("login 硫붿꽌�뱶 吏꾩엯");
        System.out.println("�쟾�떖�맂 �뜲�씠�꽣 : " + vo);
    	
    	HttpSession session = request.getSession();
    	UserVO lvo = Service.loginCheck(vo);
        
    	if(lvo == null) {                                // �씪移섑븯吏� �븡�뒗 �븘�씠�뵒, 鍮꾨��踰덊샇 �엯�젰 寃쎌슦
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "member/login";
            
        }
        session.setAttribute("member", lvo);             // �씪移섑븯�뒗 �븘�씠�뵒, 鍮꾨��踰덊샇 寃쎌슦 (濡쒓렇�씤 �꽦怨�)
        return "recipe/get";
    }
	
	 
	
}