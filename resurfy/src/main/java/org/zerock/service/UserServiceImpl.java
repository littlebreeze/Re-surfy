package org.zerock.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.UserVO;

import org.zerock.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
@Log4j
@Service
@AllArgsConstructor 
public class UserServiceImpl implements UserService {
	private UserMapper mapper;
	@Override
	public void register(UserVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public UserVO get(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(Criteria cri) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<UserVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public void join(UserVO userVO) {
		log.info("join....." + userVO);
		mapper.insert(userVO);
		
	}

	@Override
	public UserVO loginCheck(UserVO vo) throws Exception {
		return mapper.loginCheck(vo);
	}
	
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return mapper.idCheck(memberId);
	}

	// 문자인증
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSU4KF20BKCLMGU";
	    String api_secret = "HQAHD1HZTX3WUQK76CMXQIODJ42HEBM0";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01091966459");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
		
	}

}
