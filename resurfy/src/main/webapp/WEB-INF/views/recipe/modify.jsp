<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UPDATE - <c:out value="${recipe.recipeName }"/></title>
<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../resources/assets/RE-SURFY.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles_detail.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/registerRecipeStyle.css" rel="stylesheet" />
    <link href="/resources/css/registerRecipeGrid.css" rel="stylesheet"/>
</head>
<body>
 <form>
      <div class="register_recipe_wrapper">
        <div class="register_wrapper">
          <div class="register_title">레시피 수정 - <c:out value="${recipe.recipeName }"/></div>
          <div class="wrapper_box pad_l_60">
            <div id="mainPhotoUpload" class="cont_pic2">
              <input type="hidden" name="main_photo" id="main_photo" value="">
              <input type="hidden" name="new_main_photo" id="new_main_photo" value="">
              <input type="hidden" name="del_main_photo" id="del_main_photo" value="">
              <div style="position:absolute;left:-3000px">
                <input type="file" name="q_main_file" id="q_main_file" file_gubun="main" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text="">
              </div>
              
              <img src='<c:out value="${recipe.image }"/>' readonly="readonly" width=250px height=250px  alt="...">
               <button type="button" onclick="addIngredient(1)" class="btn btn-primary" control-id="ControlID-44">
                <span class="glyphicon glypicon-plus-sign"></span>수정
              </button>
            </div><br>
            <div class="wrapper_line">
              <p class="wrapper_title1">레시피 제목</p>
              <input type="text" name="recipeName" id="recipeName" value='<c:out value="${recipe.recipeName }"/>'  class="form-control" style="width:600px; margin-top:13px; display:inline-block;" control-id="ControlID-30">              
            </div>
            <div class="wrapper_line pad_b_25">
              <p class="wrapper_title1">요리소개</p>
              <textarea name="recipeDescription" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;">
              <c:out value="${recipe.recipeDescription }"/>
              </textarea>
            </div>
            <div class="wrapper_line">
              <p class="wrapper_title1">카테고리</p>
              <div>
              <select class="form-select" id="food_type" control-id="ControlID-11">
                <option value="" >유형별</option>
                <option value="한식" <c:if test ="${recipe.foodType eq '한식'}">selected="selected"</c:if>>한식 </option>
                <option value="중국" <c:if test ="${recipe.foodType eq '중국'}">selected="selected"</c:if>>중국</option>
                <option value="일본" <c:if test ="${recipe.foodType eq '일본'}">selected="selected"</c:if>>일본</option>
                <option value="서양식" <c:if test ="${recipe.foodType eq '서양식'}">selected="selected"</c:if>>서양식</option>
                <option value="이탈리아" <c:if test ="${recipe.foodType eq '이탈리아'}">selected="selected"</c:if>>이탈리아</option>
                <option value="동남아시아" <c:if test ="${recipe.foodType eq '동남아시아'}">selected="selected"</c:if>>동남아시아</option>
				<option value="퓨전" <c:if test ="${recipe.foodType eq '퓨전'}">selected="selected"</c:if>>퓨전</option>
              </select>
             <select class="form-select" id="person" control-id="ControlID-11">
                <option value="" >인원</option>
                <option value="1인분" <c:if test ="${recipe.person eq '1인분'}">selected="selected"</c:if>>1인분</option>
                <option value="2인분" <c:if test ="${recipe.person eq '2인분'}">selected="selected"</c:if>> 2인분</option>
                <option value="3인분" <c:if test ="${recipe.person eq '3인분'}">selected="selected"</c:if>> 3인분</option>
                <option value="4인분" <c:if test ="${recipe.person eq '4인분'}">selected="selected"</c:if>> 4인분</option>
                <option value="5인분이상" <c:if test ="${recipe.person eq '5인분이상'}">selected="selected"</c:if>> 5인분이상</option>
            </select>
            <span class="pad_l_30"> </span>
            <select class="form-select" id="time" control-id="ControlID-11">
              <option value="" >시간</option>
              <option value="5">5분이내</option>
              <option value="10">10분이내</option>
              <option value="15">15분이내</option>
              <option value="20">20분이내</option>
              <option value="30">30분이내</option>
              <option value="60">1시간이내</option>
              <option value="999">1시간이상</option>
            </select>
            <span class="pad_l_30"> </span>
            <select class="form-select" id="difficulty" control-id="ControlID-11">
              <option value="" >난이도</option>
              <option value="초보환영" <c:if test ="${recipe.difficulty eq '초보환영'}">selected="selected"</c:if>> 초보환영</option>
              <option value="보통" <c:if test ="${recipe.difficulty eq '보통'}">selected="selected"</c:if>> 보통</option>
              <option value="어려움" <c:if test ="${recipe.difficulty eq '어려움'}">selected="selected"</c:if>> 어려움</option>
            </select>
            </div>
          </div>
        </div>
        
        <div class="wrapper_box pad_l_60">
          <div class="mag_b_25 ui-sortable" id="divIngredientGroupArea">
            <div class="wrapper_line">
            <p class="wrapper_title1">재료</p><br>
            <!-- <ul id="ingredientAra_1" class="ingredientGroup" style="list-style: none;"> -->
            <c:forEach items="${ingre}" var="ing">
            <c:if test="${ing.ingreType eq '주재료'}">
             <ul id="ingredientAra_1" class="ingredientGroup" style="list-style: none;">
              <li id="liIngredient_1_1">
               <select class="form-select" id="ingredient_type" control-id="ControlID-11">
                <option>재료별</option>
                <option value="주재료" <c:if test ="${ing.ingreType eq '주재료'}">selected="selected"</c:if>> 주재료</option>
                <option value="부재료" <c:if test ="${ing.ingreType eq '부재료'}">selected="selected"</c:if>>부재료</option>
                <option value="양념" <c:if test ="${ing.ingreType eq '양념'}">selected="selected"</c:if>>양념</option>
              </select>		
                <input type="text" name="addIngredient_name_1[]" id="recipIngredient_name_1_1"
                class="addIngredient_name" value = '<c:out value="${ing.ingreName }"/>' style="width:285px; border-radius: 0.375rem" control-id="ControlID-19">
                <input type="text" name="addIngredient_amount_1[]" id="recipIngredient_amount_1_1"
                class="addIngredient_amount"  value = '<c:out value="${ing.ingreMeasure }"/>' style="width:210px; border-radius: 0.375rem"  control-id="ControlID-20">
                <a id="btnIngredientDel_1_1" href="javascript:delIngreidient(1,1)" class="btn-del" style="display: none;"></a>
              </li>
            </ul><br>
            </c:if>
            </c:forEach>
            
            <c:forEach items="${ingre}" var="ing">
            <c:if test="${ing.ingreType eq '부재료'}">
             <ul id="ingredientAra_1" class="ingredientGroup" style="list-style: none;">
              <li id="liIngredient_1_1">
               <select class="form-select" id="ingredient_type" control-id="ControlID-11">
                <option>재료별</option>
                <option value="주재료" <c:if test ="${ing.ingreType eq '주재료'}">selected="selected"</c:if>> 주재료</option>
                <option value="부재료" <c:if test ="${ing.ingreType eq '부재료'}">selected="selected"</c:if>>부재료</option>
                <option value="양념" <c:if test ="${ing.ingreType eq '양념'}">selected="selected"</c:if>>양념</option>
              </select>		
                <input type="text" name="addIngredient_name_1[]" id="recipIngredient_name_1_1"
                class="addIngredient_name" value = '<c:out value="${ing.ingreName }"/>' style="width:285px; border-radius: 0.375rem" control-id="ControlID-19">
                <input type="text" name="addIngredient_amount_1[]" id="recipIngredient_amount_1_1"
                class="addIngredient_amount"  value = '<c:out value="${ing.ingreMeasure }"/>' style="width:210px; border-radius: 0.375rem"  control-id="ControlID-20">
                <a id="btnIngredientDel_1_1" href="javascript:delIngreidient(1,1)" class="btn-del" style="display: none;"></a>
              </li>
            </ul><br>
            </c:if>
            </c:forEach>
            <c:forEach items="${ingre}" var="ing">
                 <c:if test="${ing.ingreType eq '양념'}">
             <ul id="ingredientAra_1" class="ingredientGroup" style="list-style: none;">
              <li id="liIngredient_1_1">
               <select class="form-select" id="ingredient_type" control-id="ControlID-11">
                <option>재료별</option>
                <option value="주재료" <c:if test ="${ing.ingreType eq '주재료'}">selected="selected"</c:if>> 주재료</option>
                <option value="부재료" <c:if test ="${ing.ingreType eq '부재료'}">selected="selected"</c:if>> 부재료</option>
                <option value="양념" <c:if test ="${ing.ingreType eq '양념'}">selected="selected"</c:if>>양념</option>
              </select>		
                <input type="text" name="addIngredient_name_1[]" id="recipIngredient_name_1_1"
                class="addIngredient_name" value = '<c:out value="${ing.ingreName }"/>' style="width:285px; border-radius: 0.375rem" control-id="ControlID-19">
                <input type="text" name="addIngredient_amount_1[]" id="recipIngredient_amount_1_1"
                class="addIngredient_amount"  value = '<c:out value="${ing.ingreMeasure }"/>' style="width:210px; border-radius: 0.375rem"  control-id="ControlID-20">
                <a id="btnIngredientDel_1_1" href="javascript:delIngreidient(1,1)" class="btn-del" style="display: none;"></a>
              </li>
            </ul><br>
            </c:if>
			</c:forEach>
            <div class="btn_add" style="padding: 0 0 20px 420px; witdth:800px">
              <button type="button" onclick="addIngredient(1)" class="btn btn-primary" control-id="ControlID-44">
                <span class="glyphicon glypicon-plus-sign"></span>추가
              </button>
            </div>
          </div>
        </div>
      </div><!--recipe insert box-->
   
       

      <div class="wrapper_box2 pad_l_60">
        <input type="file" name="file" id="multifile_1" file_gubun="step" style="display:none;" multiple/>
        <p class="wrapper_title2">요리순서</p>
        <div id="stepArea" class="ui-sortable">
        <c:forEach items="${step}" var="st">
							<c:choose>

      							<c:when test="${st.stepImage == ' ' || st.stepImage == '0'}"> 
      							<div class="py-3 row">
      							<div class="col"><img src="/resources/assets/logo.jpg" width=200px height=200px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step<c:out value="${st.stepNo}" /></div>
								<%-- <input type="text" name="stepDescription" id="stepDescription" value='<c:out value="${st.stepDescription }"/>'  class="form-control" style="width:600px; margin-top:13px; display:inline-block;" control-id="ControlID-30"> --%>              
								<textarea name="recipeDescription" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;">
              					<c:out value="${st.stepDescription }"/>
              					</textarea>
								<c:choose>
      							<c:when test="${st.tip == ' ' || st.stepImage == '0'}"> 
								<div style="font-size:13px"></div>
								</c:when>
								<c:otherwise>
								<div class="fw-bolder" style="font-size:13px">❈ tip <br> 
								<textarea name="recipeDescription" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;">
              					<c:out value="${st.tip }"/>
              					</textarea></div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:when> 

      							<c:otherwise>
      							<div class="py-3 row"> 
								<div class="col"><img src='<c:out value="${st.stepImage }"/>' readonly="readonly" width=200px height=200px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step<c:out value="${st.stepNo}" /></div>
								
								<textarea name="recipeDescription" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;">
              					<c:out value="${st.stepDescription }"/>
              					</textarea>            
									<c:choose>
      							<c:when test="${st.tip == ' ' || st.stepImage == '0'}"> 
								<div style="font-size:13px"></div>
								</c:when>
								<c:otherwise>
								<div class="fw-bolder" style="font-size:13px">❈ tip <br> 
								<textarea name="recipeDescription" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;">
              					<c:out value="${st.tip }"/>
              					</textarea></div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:otherwise> 

							</c:choose> 
						
               
                     </c:forEach>
         <!--  <div id="stepItem_1" class="step">
            <p id="stepNum_1" class="step_title_1 ui-sortable-handle" data-original-title="" title="">Step1</p>
            <div id="stepText_1" style="display:inline-block">
              <textarea name="step_text[]" id="step_text_1" class="form-control step_cont" placeholder="예) 김치를 적당한 크기로 썰어 팬에 볶아주세요." style="height:100px; width:410px; resize:none;" control-id="ControlID-29"></textarea>
            </div>
            <div id="stepUpload_1" style="display:inline-block">
              <input type="hidden" name="step_no[]" id="step_no_1" value="" control-id="ControlID-30">
              <input type="hidden" name="step_image[]" id="step_image_1" value="">
              <input type="hidden" name="new_step_photo[]" id="new_step_image_1" value="">
              <input type="hidden" name="del_step_photo[]" id="del_step_image_1" value="">
              <div style="position:absolute;left:-3000px">
                <input type="file" name="q_step_file_1" id="q_step_file_1" file_gubun="step" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text="" control-id="ControlID-31">
              </div>
              <div id="stepImageBox_1" is_over="0">
                <img id="stepImageHolder_1" onclick="browseStepFile(1)" src="" width="200px" height="200px" style="cursor:pointer">
              </div>
            </div>
          </div>
          <div id="tipItem_1" class="tip">
            <p class="tip_title_1">팁</p>
       		<textarea name="tip_text[]" id="tip_text_1" class="form-control step_cont" placeholder="조리 과정에 특별한 팁이 있다면 공유해주세요." style="height:50px; width:620px; resize:none;"></textarea>          
         </div>  -->     
        </div> <!--step regi box-->
 
        <div class="btn_add mag_b_25" style="padding:0 0 20px 410px; width:820px;">
          <button type="button" onclick="addStep()" class="btn btn-primary" control-id="ControlID-83">
            <span class="glyphicon glyphicon-plus-sign"></span>순서추가
          </button>              
        </div>
      </div><!--step finish box-->
    </div><!--regi_center box-->

       <div class="regi_btm">        
          <button type="button" onclick="save();" class="btn-lg btn-success" id="save" control-id="ControlID-44">수정</button>
		  <div class="modal">
			<div class="modal-dialog" role="document" id="openBtn">
				<div class="modal-content">
			      <div class="modal-body">
			        <p>레시피 등록이 완료되었습니다.</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" onclick="confrim();" class="btn btn-primary" id="confirm">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
          <button type="button" onclick="history.back();" class="btn-lg btn-danger" control-id="ControlID-49">취소</button>
        </div><!--save and cancel-->
      </div><!--container finish-->
    </form>

	        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      
      <!-- 	버튼 기능 구현 코드 작성중 -->
      <script type="text/javascript">
      
      document.getElementById("save").onclick = function () {
    	  $(".modal").fadeIn();
    };
    
	   </script>
 <%@include file="../includes/footer.jsp"%>
  </body>
 
</body>
</html>