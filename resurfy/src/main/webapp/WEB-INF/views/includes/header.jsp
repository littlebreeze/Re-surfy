<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>resurfy - 레시피를 공유하고 공유받는 우리는.</title>
        <!-- 사이트 이모티콘(픽토그램) 테마-->
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/assets/favicon.png" rel="stylesheet"/>
        <!-- Bootstrap에서 사용되는 아이콘들-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- CSS CORE 테마-->
        <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" />
        <!-- Bootstrap 테마  -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
       <div id="wrapper">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container px-4 px-lg-5">
            <!-- 홈 이미지 button -->
                <a href="#"><img src ="/resources/assets/favicon.png"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5" >
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
				<p class="lead fw-normal text-white-50 mb-0">관리자 추천 레시피</p>
				<br>
				<br>
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					    <a href="#">
					      <img src="http://file.okdab.com/UserFiles/searching/recipe/000200.jpg" class="d-block rounded mx-auto" alt="나물비빔밥" style="width:Xrem;">
					      </a>
					    </div>
					    <div class="carousel-item">
					    <a href="#">
					      <img src="http://file.okdab.com/UserFiles/searching/recipe/000300.jpg" class="d-block rounded mx-auto" alt="오곡밥" style="width:Xrem;">
					    </a>
					    </div>
					    <div class="carousel-item">
					    <a href="#">
					      <img src="http://file.okdab.com/UserFiles/searching/recipe/000400.jpg" class="d-block rounded mx-auto" alt="잡재밥" style="width:Xrem;">
					    </a>
					    </div>
					  </div>
					</div>
                </div>
            </div>
        </header>
        <br>