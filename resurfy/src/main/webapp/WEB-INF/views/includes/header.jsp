<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="org.zerock.domain.UserVO"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>resurfy-레시피를 공유하고 공유받는 우리는.</title>
<!-- 사이트 이모티콘(픽토그램) 테마-->
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/assets/fadeblueLogo.png"
	rel="stylesheet" />
<!-- Bootstrap에서 사용되는 아이콘들-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- CSS CORE 테마-->
<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />

<link href="/resources/css/pagingButton.css" rel="stylesheet">
<link href="/resources/css/mypageStyles.css" rel="stylesheet" />

<link href="/resources/css/header.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<body>

	<div id="header_menu">
		<div id="logo">
			<a href="/recipe/get"> 
			<img src="/resources/assets/fadeblueLogo.png" width = "200" height = "auto">
			</a>
		</div>
		<div id="header_menu_move">
			<ol class="breadcrumb">
				<%
				UserVO user = (UserVO) session.getAttribute("member");
				%>

				<%
				if (user == null) {
				%>
				
				<li><a href="/member/login.do">
						<font face='NanumGothic'>
							로그인</button>
				</a></li>
				<li> | </li>
				<li>비회원 입니다.</li>
				
				<%
					} else {
				%>
				
				<form action="/member/logout.do" id="logout" method="post">
					<li>
					<div id = "btnLogout">
					<a href="/member/login.do">
								<font face='NanumGothic'>로그아웃
					</a>
					</div>
					</li>
					<li> | </li>
					<li><a href="/mypage/list">
								<font face='NanumGothic'>마이페이지
					</a></li>
					<li> | </li>
					<li><a href ="/recipe/registerRecipe">
								<font face='NanumGothic'>레시피등록</a>
					</li>
					<li> | </li>
					<li id="welcome-text">
					<font color='#000000'>
					<%=user.getId()%>님 환영합니다.
					</li>
				
				</form>
				<%
				}
				%>
			</ol>
<div class="modal">
  <div class="modal-dialog" id ="myModal" role="dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"></span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
		</div>
	</div>


	<script type="text/javascript">
		var btnLogout = document.getElementById('btnLogout');
		if (btnLogout != null) {
			btnLogout.onclick = function() {
				alert("로그아웃 되었습니다.");
			}
		}
		document.getElementById("welcome-text").style.color = "#FFFFFF";
	</script>
	
	<script type="text/javascript">
	$(document)
	.ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);
				history.replaceState({}, null, null);
				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result)
										+ " 번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				});
	</script>
	