<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/login.css?"/>
<title>Re-Surfy</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
  </script>
</head>
<body>
<section>
  <div class="left">
    <img src="../resources/image/logo.jpg" height="550px" alt="" />
  </div>
  <div class="right">
    <div class="sign-up">
      <h1>JOIN</h1>
      <form action="join.do" id="join_form" method="post">
      <div class="con1">
	       <input type="text" id="j_id" placeholder="UserId" name="userId" style="float:left; width:265px; margin-right:4px;"/>
	       <button type="button" style="float:left; width:70px;">중복확인</button>
      </div>
        <input type="text" id="j_name" placeholder="UserName" name="userName" />
        <input type="password" id="j_pw" name="userPw" placeholder="Password" />
        <input type="text"id="j_nick" name="userNick" placeholder="UserNickname" />
        <div class="con2">
	        <input type="tel" id="j_phone" name="userPhone" placeholder="Phone Number" style="width:265px;" />
	        <button type="button" style="float:left; width:80px;">인증번호</br>전송</button>
        </div>
        <div class="con3">
        	<input type="text" style="width:265px;"/>
			<button type="button" style="float:left; width:80px;">인증</button>
        </div>
        <input class="btnJoin" type="button" value="Sing Up" onclick="formCheck(this.form)" />
      </form>
      <div class="separator">
      	<a href="#login" id="sign-in" onclick="toggle()">Sign In</a>
      </div>
    </div>
    <div class="sign-in">
      <h1>LOGIN</h1>
      <form id="sign_form" method="post" action="login.do">
        <input type="text" id="userid" name="id" placeholder="UserId" />
        <input type="password" id="passwd" name="pw" placeholder="Password" />
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
			 document.sign_form.submit(); //제출
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
				$("#join_form").attr("action", "join.do");
				$("#join_form").submit();
				alert( userNick+"("+userId+") 님 \n회원가입이 완료되었습니다.");
				
			});
		});
		
	</script>
</body>
</html>