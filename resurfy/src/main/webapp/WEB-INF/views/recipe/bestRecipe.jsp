<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/bestRecipe.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootStrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>

<!-- Header-->
<div class="slide_div_wrap" style = " background-color: #fff;">
				<div class="slide_div" style="background-color: #F0DDD8;">
					<div>
						<a href = "https://github.com/barcataeeon/Re-surfy.git">
							<img src="/resources/assets/main/slick_first.png"
							style=" width = 1000px; height: 500px; padding : 0 100px;">
						</a>
					</div>
					<div >
						<a href = "/recipe/TopTenByReply">
							<img src="/resources/assets/main/slick_second.png"
							style=" width = 1000px; height: 500px; padding : 0 100px;">
						</a>
					</div>
					<div>
						<a href = "/recipe/TopTenByVisit">
							<img src="/resources/assets/main/slick_third.png"
							style=" width = 1000px; height: 500px; padding : 0 100px;">
						</a>
					</div>				
				</div>	
			</div>

<script>
	$(document).ready(function() {
		$(".slide_div").slick({
			centerMode : true,
			centerPadding : '90px',
			slidesToShow : 1,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 5000,
			infinite: true,
			adaptiveHeight: true
		});
	});
</script>


