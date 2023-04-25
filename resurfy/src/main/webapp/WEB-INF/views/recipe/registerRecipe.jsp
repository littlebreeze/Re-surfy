<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Recipe 등록</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../resources/assets/RE-SURFY.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../resources/css/registerRecipeStyle.css" rel="stylesheet" />
    <link href="../resources/css/registerRecipeGrid.css" rel="stylesheet"/>
	
	<!-- Font-->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">


  </head>
  <body>
    <form action="/recipe/registerRecipe" id="registerRecipe" onsubmit="return validateForm();" method="post">
      <div class="register_recipe_wrapper">
        <div class="register_wrapper">
          <div class="register_title" style="color:black;">레시피 등록</div>
          <div class="wrapper_box pad_l_60">
            <div id="MainImageBox" class="cont_pic2">
              <input type="hidden" name="main_image" id="main_image" value="">
              <input type="hidden" name="new_main_image" id="new_main_image" value="">
              <input type="hidden" name="del_main_photo" id="del_main_image" value="">
              <div style="position:absolute;left:-3000px">
                <input type="file" name="image" id="mainImage" file_gubun="main" accept="jpeg,png,gif" style="display:;width:250px;height:250px;font-size:0px;" text="">
              </div>
              <div id="divMainImageContainer">
                <img id="mainImageHolder" onclick="browseMainFile()" src="../resources/assets/uploadimage.png" style="width:100%; heigh:100%; margin-top:30px; resize:none; cursor:pointer;">
              </div>
            </div>

            <div class="wrapper_line">
              <p class="wrapper_title1" style="color:black;">레시피 제목</p>
              <input type="text" name="recipeName" id="recipeName" value="<c:out value='${recipeName}'/>" class="form-control" placeholder="예) 10분 완성 김치찌개" style="width:600px; margin-top:13px; display:inline-block;" control-id="ControlID-30">              
            </div>
            <div class="wrapper_line pad_b_25">
              <p class="wrapper_title1" style="color:black;">요리소개</p>
              <textarea name="recipeDescription" id="recipeDescription" class="form-control recipeDescription" placeholder="예) 최대한 빠르고 간편하게 만드는 김치찌개입니다." style="height:100px; width:600px; resize:none;"><c:out value="${recipeDescription}"/></textarea>
            </div>
            <div class="wrapper_line">
              <p class="wrapper_title1" style="color:black;">카테고리</p>
              <select class="form-select" id="foodType" name="foodType" control-id="ControlID-11">
                <option value="">유형별</option>
		   	    <option value="3020001|한식" <c:if test="${foodType == '3020001|한식'}">selected</c:if>>한식</option>
			    <option value="3020004|중국" <c:if test="${foodType == '3020004|중국'}">selected</c:if>>중국</option>
			    <option value="3020003|일본" <c:if test="${foodType == '3020003|일본'}">selected</c:if>>일본</option>
			    <option value="3020002|서양" <c:if test="${foodType == '3020002|서양'}">selected</c:if>>서양</option>
			    <option value="3020006|이탈리아" <c:if test="${foodType == '3020006|이탈리아'}">selected</c:if>>이탈리아</option>
			    <option value="3020005|동남아시아" <c:if test="${foodType == '3020005|동남아시아'}">selected</c:if>>동남아시아</option>
			    <option value="3020009|퓨전" <c:if test="${foodType == '3020009|퓨전'}">selected</c:if>>퓨전</option>
              </select>
              <select class="form-select" id="person" name="person" control-id="ControlID-11">
                <option value="" >인원</option>
                <option value="1인분"<c:if test="${person == '1인분'}">selected</c:if>>1인분</option>
                <option value="2인분"<c:if test="${person == '2인분'}">selected</c:if>>2인분</option>
                <option value="3인분"<c:if test="${person == '3인분'}">selected</c:if>>3인분</option>
                <option value="4인분"<c:if test="${person == '4인분'}">selected</c:if>>4인분</option>
                <option value="5인분이상"<c:if test="${person == '5인분이상'}">selected</c:if>>5인분이상</option>
              </select>
              <span class="pad_l_30"> </span>
              <select class="form-select" id="time" name="time" control-id="ControlID-11">
                <option value="" >시간</option>
                <option value="5분"<c:if test="${time == '5분'}">selected</c:if>>5분</option>
                <option value="10분"<c:if test="${time == '10분'}">selected</c:if>>10분</option>
                <option value="15분"<c:if test="${time == '15분'}">selected</c:if>>15분</option>
                <option value="20분"<c:if test="${time == '20분'}">selected</c:if>>20분</option>
                <option value="30분"<c:if test="${time == '30분'}">selected</c:if>>30분</option>
                <option value="40분"<c:if test="${time == '40분'}">selected</c:if>>40분</option>
                <option value="50분"<c:if test="${time == '50분'}">selected</c:if>>50분</option>
                <option value="60분"<c:if test="${time == '60분'}">selected</c:if>>60분</option>
                <option value="90분"<c:if test="${time == '90분'}">selected</c:if>>90분</option>
                <option value="120분"<c:if test="${time == '120분'}">selected</c:if>>120분</option>
                <option value="180분"<c:if test="${time == '180분'}">selected</c:if>>180분</option>
              </select>
              <span class="pad_l_30"> </span>
              <select class="form-select" id="difficulty" name="difficulty" control-id="ControlID-11">
                <option value="" >난이도</option>
                <option value="초보환영"<c:if test="${difficulty == '초보환영'}">selected</c:if>>초보환영</option>
                <option value="보통"<c:if test="${difficulty == '보통'}">selected</c:if>>보통</option>
                <option value="어려움"<c:if test="${difficulty == '어려움'}">selected</c:if>>어려움</option>
              </select>
            </div>
          </div>
		<%@include file="../recipe/registerIngredient.jsp"%>
		<%@include file="../recipe/registerStep.jsp"%>
        <div class="regi_btm">
          <button type="submit" onclick="save()" class="btn-lg btn-primary" id="save" control-id="ControlID-44">저장</button>
          <button type="button" onclick="location.href='/recipe/get'" class="btn-lg btn-warning" id="cancel" control-id="ControlID-49" >취소</button>
        </div><!--save and cancel-->        
      </div><!--container finish-->
    </form>
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- 	버튼 기능 구현 코드 작성중-->
    <script type="text/javascript" src="../resources/js/registerRecipeScripts.js">
    
    </script>
  </body>
  <%@include file="../includes/footer.jsp"%>

</html>
