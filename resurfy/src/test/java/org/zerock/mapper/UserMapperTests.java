package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.UserVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {

	@Setter(onMethod_ = @Autowired)
	private UserMapper usermapper;
	 /* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void loginCheck() {
        UserVO vo = new UserVO();
        
        /* 올바른 아이디 비번 입력경우 */
        vo.setId("user1");
        vo.setPassword("1234");
        
        usermapper.loginCheck(vo);
        System.out.println("결과 값 : " + usermapper.loginCheck(vo));
        
    }
    
    @Test
	public void memberIdChk() throws Exception{
		String id = "admin";	// 존재하는 아이디
		String id2 = "test123";	// 존재하지 않는 아이디
		usermapper.idCheck(id);
		usermapper.idCheck(id2);
	}
}
