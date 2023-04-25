<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="org.zerock.domain.UserVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/login.css?after2"/>
<title>Re-Surfy</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
  </script>
</head>
<body>
<% session.invalidate(); %>
<section>
  <div class="left">
  <a href = "/recipe/get">
    <img src="/resources/assets/bluebackground.png" height="700px" alt="" />
    </a>
  </div>
  <div class="right">
    <div class="sign-up">
      <h1>JOIN</h1>
      <form action="join.do" id="join_form" method="post">
      <span>
      	<div>
      	   <h3><label for="j_id">아이디</label></h3>
	       <input type="text" id="j_id" placeholder="UserId" name="id"/>
	       <span class="id_input_re_1">* 사용 가능한 아이디입니다.</span>
		   <span class="id_input_re_2">* 아이디가 이미 존재합니다.</span>
	       </div>
      </span>
      
      <span>
      	<h3><label for="j_name">이름</label></h3>
        <input type="text" id="j_name" placeholder="UserName" name="userName"  />
       </span>
       <span>
        <h3><label for="j_pw" >비밀번호</label></h3>
        <input type="password" id="j_pw" name="password" placeholder="Password" />
        </span>
        <span>
        <h3><label for="j_nick">닉네임</label></h3>
        <input type="text"id="j_nick" name="nickname" placeholder="UserNickname" />
        </span>
        <div class="con2">
        <div>
 	        <h3><label for="j_phone" >휴대폰번호</label></h3>
	        <input type="tel" id="j_phone" name="phone" placeholder="Phone Number" style="width:210px;" required/>
	        </div>
	        <button id="phoneChk" type="button" style="float:left; width:100px;">인증번호 전송</button>
	        
        </div>
        <div class="con3">
        <div>
 	        <h3><label for="j_num">인증번호</label></h3>
        	<input id="j_num" type="text" style="width:210px;" disabled required/>
        	<span class="j_input_re_3">* 인증완료</span>
			<span class="j_input_re_4">* 인증실패</span>
        </div>
			<button id="phoneChk2" type="button" style="float:left; width:100px;">인증</button>
        </div> 
        <div class="agree">
	        <p style="display: flex;"><input id="agree1" type="checkbox" style="width:15px;" required> 
	        	<a href="/resources/agree1.html" onClick="window.open(this.href, '','width=400, height=430'); return false;" >이용약관 동의</a> 
	        	<span class="fil">(필수)</span>
	        </p>
	        <p style="display: flex;"><input id="agree2" type="checkbox" style="width:15px;" required> 
		        <a href="/resources/agree2.html" onClick="window.open(this.href, '','width=400, height=430'); return false;">개인정보 수집 및 이용 동의 </a>
		        <span class="fil">(필수)</span>
		    </p>
        </div>
        <input class="btnJoin" type="button" value="Sing Up" onclick="formCheck(this.form)" />
      </form>
      <div class="separator">
      	<a href="#login" id="sign-in" onclick="toggle()">Sign In</a>
      </div>
    </div>
    <div class="sign-in">
      <h1>LOGIN</h1>
      <form id="sign_form" method="post">
      <span>
      	<h3><label for="userid">아이디</label></h3>
        <input type="text" id="userid" name="id" placeholder="UserId" />
      </span>
      <span>
        <h3><label for="passwd" >비밀번호</label></h3>  
        <input type="password" id="passwd" name="password" placeholder="Password" />   
      </span>
        <input type="submit" id="btnLogin" value="Login" />
      </form>
      <!-- separator -->
  <div class="separator">
     <a href="#join" onclick="toggle()">Sign Up</a>
  </div>
    </div>
  </div>
</section>
		
<script>
		function toggle() {
			  section = document.querySelector("section");
			  section.classList.toggle("active");
		}
		
		$(function(){
			$("#btnLogin").click(function(){
			 userid=$("#userid").val();
			 var passwd=$("#passwd").val(); 
			if(userid == ""){
			  alert("아이디를 입력하세요");
			  $("#userid").focus(); //입력포커스 이동

			  return; //함수 종료
			}
			if(passwd==""){
			 alert("비밀번호를 입력하세요"); 
			 $("#passwd").focus();
			 
			  return;
			}
			//폼 내부의 데이터를 전송할 주소
			$("#sign_form").attr("action", "loginCheck.do");
			$("#sign_form").submit();
			
			 });
			});
	 

		$(document).ready(function(){
			//회원가입 버튼(회원가입 기능 작동)
			$(".btnJoin").click(function(){
				userId=$("#j_id").val();
				var userName=$("#j_name").val();
				var userPw=$("#j_pw").val();
				var userNick=$("#j_nick").val();
				var userPhone=$("#j_phone").val();
				var Chknum=$("#j_num").val();
				var phoneChk2=$("#phoneChk2").val();
				
				if(userId == ""){
					  alert("아이디를 입력하세요");
					  $("#j_id").focus(); //입력포커스 이동
					  return; //함수 종료
					}
				if(userName == ""){
					  alert("이름을 입력하세요");
					  $("#j_name").focus(); //입력포커스 이동

					  return; //함수 종료
					}
				if(userPw == ""){
					  alert("패스워드를 입력하세요");
					  $("#j_pw").focus(); //입력포커스 이동

					  return; //함수 종료
					}
				if(userNick == ""){
					  alert("별명을 입력하세요");
					  $("#j_nick").focus(); //입력포커스 이동

					  return; //함수 종료
					}
				if(userPhone == ""){
					  alert("휴대폰을 입력하세요");
					  $("#j_phone").focus(); //입력포커스 이동

					  return; //함수 종료
					}
				if(Chknum == ""){
					  alert("인증번호를 입력하세요");
					  $("#j_num").focus(); //입력포커스 이동

					  return; //함수 종료
				}
				if($("#j_num").val() != code2){
					alert("휴대폰 인증을 완료해주세요");
					
					return;
		    	}
				if(!$("#agree1").prop("checked")){
					alert("이용약관 동의를 완료해주세요");
					
					return;
		    	}
				if(!$("#agree2").prop("checked")){
					alert("개인정보 제공 및 이용 동의를 완료해주세요");
					
					return;
		    	}
				
				$("#join_form").attr("action", "join.do");
				$("#join_form").submit();
				alert( userNick+"("+userId+") 님 \n회원가입이 완료되었습니다.");
				
			});
		});
		
		//아이디 중복검사
		$('#j_id').on("propertychange change keyup paste input", function(){

			/* console.log("keyup 테스트"); */	
			var memberId = $('#j_id').val();			// #j_id에 입력되는 값
			var data = {memberId : memberId}			// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({
				type : "post",
				url  : "/member/memberIdChk",
				data : data,
				success : function(result){
					if(result != 'fail'){
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none");				
					} else {
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");				
					}
				}
			}); // ajax 종료	

		});// function 종료
		
		//휴대폰 번호 인증
		var code2 = "";
		$("#phoneChk").click(function(){
			
			var phone = $("#j_phone").val();
			var userPhone=$("#j_phone").val();
			
			if(userPhone == ""){
				  alert("휴대폰을 입력하세요");
				  $("#j_phone").focus(); //입력포커스 이동

				  return; //함수 종료
			}
			alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
			$.ajax({
		        type:"GET",
		        url:"phoneCheck?phone=" + phone,
		        cache : false,
		        success:function(data){
		        	if(data == "fail"){
		        		alert("휴대폰 번호가 올바르지 않습니다.")
		        	}else{	        		
		        		alert("전송완료");
		        		$("#j_num").attr("disabled",false);
		        		$("#j_phone").attr("readonly",true);
		        		code2 = data;
		        	}
		        }
		    });
		});
		// 문자인증
		$("#phoneChk2").click(function(){
			var userPhone=$("#j_phone").val();
			var Chknum=$("#j_num").val();

			if(userPhone == ""){
				  alert("휴대폰을 입력하세요");
				  $("#j_phone").focus(); //입력포커스 이동

				  return; //함수 종료
			}
			if(Chknum == ""){
				  alert("인증번호를 입력하세요");
				  $("#j_num").focus(); //입력포커스 이동

				  return; //함수 종료
			}
			if($("#j_num").val() == code2){
				$('.j_input_re_4').css("display","none");
				$('.j_input_re_3').css("display","inline-block");
			}else{
				$('.j_input_re_4').css("display","inline-block");
				$('.j_input_re_3').css("display","none");
				$('#j_num').val('');
			}
		});
		
	</script>
</body>
</html>