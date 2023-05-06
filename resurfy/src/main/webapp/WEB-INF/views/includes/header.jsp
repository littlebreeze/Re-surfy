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
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/assets/fadeblueLogo.png"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"> -->
<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />

<link href="/resources/css/pagingButton.css" rel="stylesheet">
<link href="/resources/css/mypageStyles.css" rel="stylesheet" />

<link href="/resources/css/header.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css"
	rel="stylesheet">
<body>
	<font face='NanumGothic'>
		<div id="header_menu" style="border-bottom: 0px;">
			<div id="logo">
				<a href="/recipe/get"> <img
					src="/resources/assets/horizontal_logo.png" width= "300px;"
					height="auto;">
				</a>
			</div>
			<div id="header_menu_move"
				style="padding-bottom: 5%; font-size: 20px;">
				<ul class="nav nav-pills">
					<%
					UserVO user = (UserVO) session.getAttribute("member");
					%>

					<%
					if (user == null) {
					%>
					<li class="nav-item" data-bs-toggle="tooltip"
						data-bs-placement="bottom" data-bs-original-title="로그인/회원가입"><a
						href="/member/login.do"> <img
							src="/resources/assets/main/unlocked.png" width="20"
							height="auto">
					</a></li>
					<%
					} else if (user != null && user.getId().contains("admin")) {
					%>
					<form action="/member/logout.do" id="logout" method="post">
						<li class="nav-item" data-bs-toggle="tooltip"
							data-bs-placement="bottom" data-bs-original-title="로그아웃">
							<div id="btnLogout">
								<a href="/member/login.do"> <img
									src="/resources/assets/main/lock.png" width="20" height="auto">
								</a>
							</div>
						</li>
						<li class="nav-item" data-bs-toggle="tooltip"
							data-bs-placement="bottom" data-bs-original-title="관리자 페이지"><a
							href="/mypage/list"> <img
								src="/resources/assets/main/user.png" width="20" height="auto">
						</a></li>
						<li class="nav-item" data-bs-toggle="tooltip"
							data-bs-placement="bottom" data-bs-original-title="레시피 등록"><a
							href="/recipe/registerRecipe"> <img
								src="/resources/assets/main/edit.png" width="20" height="auto"></a></li>
						<li class="nav-item" id="welcome-text"><font color='#000000'>
								관리자(<%=user.getId()%>)</li>
					</form>
					<%
					} else if (user != null) {
					%>
					<form action="/member/logout.do" id="logout" method="post">
						<li class="nav-item" data-bs-toggle="tooltip"
							data-bs-placement="bottom" data-bs-original-title="로그아웃">
							<div id="btnLogout">
								<a href="/member/login.do"> <img
									src="/resources/assets/main/lock.png" width="20" height="auto">
								</a>
							</div>
						</li>
						<li class="nav-item" data-bs-toggle="tooltip"
							data-bs-placement="bottom" data-bs-original-title="마이페이지"><a
							href="/mypage/list"> <img
								src="/resources/assets/main/user.png" width="20" height="auto">
						</a></li>
						<li class="nav-item" data-bs-toggle="tooltip"
							data-bs-placement="bottom" data-bs-original-title="레시피 등록"><a
							href="/recipe/registerRecipe"> <img
								src="/resources/assets/main/edit.png" width="20" height="auto"></a></li>
						<li class="nav-item" id="welcome-text"><font color='#000000'>
								회원(<%=user.getId()%>)</li>
					</form>
					<%
					}
					%>
				</ul>
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
		</script> <script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

		<script>
			// 툴팁 초기화
			var tooltipTriggerList = [].slice.call(document
					.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList
					.map(function(tooltipTriggerEl) {
						return new bootstrap.Tooltip(tooltipTriggerEl)
					})
		</script>