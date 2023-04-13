<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/login.css"/>
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
  </script>
</head>
<body>
<section>
  <div class="left">
    <img src="../resources/assets/logo.jpg" height="500px" alt="" />
  </div>
  <div class="right">
    <div class="sign-up">
      <h1>JOIN</h1>
      <form id="join_form" method="post">
      <div class="con1">
	       <input type="text" placeholder="UserId" name="id" style="float:left; width:265px; margin-right:4px;"/>
	       <button style="float:left; width:70px;">중복확인</button>
      </div>
        <input type="password" name="pw" placeholder="Create Password" />
        <input type="text" name="nickname" placeholder="UserNickname" />
        <div class="con2">
	        <input type="tel" name="phone" placeholder="Phone Number" style="width:265px;" />
	        <button style="float:left; width:80px;">인증번호</br>전송</button>
        </div>
        <div class="con3">
        	<input type="text" style="width:265px;"/>
			<button style="float:left; width:80px;">인증</button>
        </div>
        <input class="join_btn" type="submit" value="Sing Up" />
      </form>
      <div class="separator">
      	<a href="#join" id="sign-in" onclick="toggle()">Sign In</a>
      </div>
      </p>
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
     <a href="#login" onclick="toggle()">Sign Up</a>
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
			  $("#userid").focus();

			  return;
			}
			if(passwd==""){
			 alert("비밀번호를 입력하세요"); 
			 $("#passwd").focus();
			  return;
			}
			
			 document.sign_form.submit();
			 });
			});
	</script>
</body>
</html>