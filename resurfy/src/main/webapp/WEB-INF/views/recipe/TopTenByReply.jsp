<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
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
	href="<%=request.getContextPath()%>/resources/assets/favicon.png"
	rel="stylesheet" />
<!-- Bootstrap에서 사용되는 아이콘들-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- CSS CORE 테마-->
<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/TopTen.css" rel="stylesheet">
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootStrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<body>
	<div class="TopTen_recipe" style="display: flex; justify-content: center; align-items: center;">
		<table style = "width : 100%;">
			<thead style="height: 50px; font-size : 20px;
			border-bottom : 1px solid #fff; background-color : #F0DDD8;
			color : #FF7851;">
				<tr>
					<th scope="col">순위</th>
					<th scope="col">레시피</th>
					<th scope="col">레시피 설명</th>
					<th scope="col">댓글 수</th>
				</tr>
			</thead>
			<c:forEach items="${sortByReply}" var="bestRecipe" varStatus="status">
				<c:if test="${status.index < 10}">
					<tbody style="height: auto; font-size : 20px;
					border-bottom : 1px solid #F0DDD8; background-color : #fff;">
						<tr >
							<th scope="row" style = "font-size: 50px;">${status.index + 1}</th>
							<td><a
								href="/recipe/detail?bno=<c:out value="${bestRecipe.bno}" />">
									<img src="${bestRecipe.image}" 
									style = "width : 300px; height: 300px;"/> 
								<div style ="text-decoration : none; color : #000;">
									<b> <c:out value="${bestRecipe.recipeName}" />
									</b>
								</div>
							</a></td>
								
							<td><c:out value="${bestRecipe.recipeDescription}" /></td>
							<td><c:out value="${bestRecipe.replycnt}" /></td>
						</tr>
					</tbody>
				</c:if>
			</c:forEach>
		</table>
		</div>
		<%@include file = "../includes/footer.jsp" %>
</body>
</html>
