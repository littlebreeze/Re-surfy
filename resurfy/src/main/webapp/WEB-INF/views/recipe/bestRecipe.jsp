<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/bestRecipe.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootStrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type = "text/javascript" src = "/resources/js/reply.js"></script>

<!-- Header-->
<div class = "recipe_carousel">
<h1>Resurfy에는 이곳에 있는 모든 요리들의 레시피를 확인 할 수 있습니다.</h1>
<div class="slide_div_wrap">
	<div class="slide_div">
	<c:forEach items="${listRecipe}" var="recipe">
		<div class = "slide_item">
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
			<div>
				<img src="${recipe.image}"/>
			</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		</div>
			</c:forEach>	
		</div>	
	</div>	
</div>

<button onclick="location.href='/recipe/TopTen'" class="btn btn-primary btn-sm">
	Recipe Ranking
</button>


<script>
$(document).ready(function(){
			$(".slide_div").slick({
				  centerMode: true,
				  centerPadding: '90px',
				  slidesToShow: 4,
				  slidesToScroll : 1,
				  autoplay : true,
				  autoplaySpeed : 1000,
				  responsive: [
				    {
				      breakpoint: 768,
				      settings: {
				        arrows: false,
				        centerMode: true,
				        centerPadding: '30px',
				        slidesToShow: 3
				      }
				    },
				    {
				      breakpoint: 480,
				      settings: {
				        arrows: false,
				        centerMode: true,
				        centerPadding: '30px',
				        slidesToShow: 1
				      }
				    }
				  ]
			});
});
</script>