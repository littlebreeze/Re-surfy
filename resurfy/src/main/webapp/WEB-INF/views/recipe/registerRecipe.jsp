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
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/registerRecipeStyle.css" rel="stylesheet" />
    <link href="/resources/css/registerRecipeGrid.css" rel="stylesheet"/>
  </head>
  <body>
    <form action="/recipe/registerRecipe" method="post" id="registerRecipe">
      <div class="register_recipe_wrapper">
        <div class="register_wrapper">
          <div class="register_title">레시피 등록</div>
          <div class="wrapper_box pad_l_60">
            <div id="MainImageBox" class="cont_pic2">
              <input type="hidden" name="main_image" id="main_image" value="">
              <input type="hidden" name="new_main_image" id="new_main_image" value="">
              <input type="hidden" name="del_main_photo" id="del_main_image" value="">
              <div style="position:absolute;left:-3000px">
                <input type="file" name="mainImage" id="mainImage" file_gubun="main" accept="jpeg,png,gif" style="display:;width:250px;height:250px;font-size:0px;" text="">
              </div>
              <div id="divMainImageContainer">
                <img id="mainImageHolder" onclick="browseMainFile()" src="../resources/assets/uploadimage.png" style="width:100%; heigh:100%; margin-top:30px; resize:none; cursor:pointer;">
              </div>
            </div>

            <div class="wrapper_line">
              <p class="wrapper_title1">레시피 제목</p>
              <input type="text" name="recipeName" id="recipeName" value="" class="form-control" placeholder="예) 10분 완성 김치찌개" style="width:600px; margin-top:13px; display:inline-block;" control-id="ControlID-30">              
            </div>
            <div class="wrapper_line pad_b_25">
              <p class="wrapper_title1">요리소개</p>
              <textarea name="recipeDescription" id="recipeDescription" class="form-control recipeDescription" placeholder="예) 최대한 빠르고 간편하게 만드는 김치찌개입니다." style="height:100px; width:600px; resize:none;"></textarea>
            </div>
            <div class="wrapper_line">
              <p class="wrapper_title1">카테고리</p>
              <select class="form-select" id="food_type" name="foodType" control-id="ControlID-11">
                <option>유형별</option>
                <option>한식</option>
                <option>중국</option>
                <option>일본</option>
                <option>서양</option>
                <option>이탈리아</option>
                <option>동남아시아</option>
                <option>퓨전</option>
              </select>
              <select class="form-select" id="person" name="person" control-id="ControlID-11">
                <option value="" >인원</option>
                <option value="1">1인분</option>
                <option value="2">2인분</option>
                <option value="3">3인분</option>
                <option value="4">4인분</option>
                <option value="5">5인분이상</option>
              </select>
              <span class="pad_l_30"> </span>
              <select class="form-select" id="time" name="time" control-id="ControlID-11">
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
              <select class="form-select" id="difficulty" name="difficulty" control-id="ControlID-11">
                <option value="" >난이도</option>
                <option value="31">초보환영</option>
                <option value="32">보통</option>
                <option value="33">어려움</option>
              </select>
            </div>
          </div>

		<!-- 재료 등록 박스 -->
          <div class="wrapper_box pad_l_60">
            <div class="mag_b_25 ui-sortable" id="divIngredientGroupArea">
              <div class="wrapper_line">
                <p class="wrapper_title1">재료</p>
                <ul id="ingredientAra_1" class="ingredientGroup">
                  <select class="form-select" id="ingredient_type" control-id="ControlID-11">
                    <option value="">재료별</option>
                    <option value="23">주재료</option>
                    <option value="28">부재료</option>
                    <option value="24">양념</option>
                  </select>		
                  <li id="liIngredient_1_1">
                    <input type="text" name="addIngredient_name_1[]" id="recipIngredient_name_1_1"
                    class="addIngredient_name" style="width:285px; border-radius: 0.375rem" placeholder="예) 돼지고기" control-id="ControlID-19">
                    <input type="text" name="addIngredient_amount_1[]" id="recipIngredient_amount_1_1"
                    class="addIngredient_amount" style="width:210px; border-radius: 0.375rem" placeholder="예) 300g" control-id="ControlID-20">
                    <button type="button" class="btn btn-danger deleteIngredientBtn">삭제</button>
                  </li>
                </ul>
              </div>
            </div>
            <div class="btn_add" style="padding: 0 0 20px 420px; witdth:800px">
              <button type="button" onclick="addIngredient(1)" class="btn btn-primary" id="addIngredient" control-id="ControlID-44">
                <span class="glyphicon glypicon-plus-sign"></span>추가
              </button>
            </div>
          </div><!--재료 등록 finish-->

			<!-- 과정 등록 박스 -->
          <div class="wrapper_box2 pad_l_60">
            <input type="file" name="file" id="multifile_1" file_gubun="step" style="display:none;" multiple/>
            <p class="wrapper_title2">요리순서</p>
            <div id="stepArea" class="stepArea">
              <div id="stepItem_STEP" class="step">
                <p id="stepNum_STEP" class="stepNo_STEP ui-sortable-handle" data-original-title="" title=""  style="width: 100px; display: inline-block; font-size: 18px; font-weight: normal; vertical-align: top; color: #33afe9; margin-left: 40px;">Step 1</p>
                <div id="stepDescription_STEP" style="display:inline-block">
                  <textarea name="stepDescription[]" id="stepDescription_STEP" class="form-control stepDescription" placeholder="예) 김치를 적당한 크기로 썰어 팬에 볶아주세요." style="height:100px; width:410px; resize:none;" control-id="ControlID-29"></textarea>
                </div>
                <div id="stepUpload_STEP" style="display:inline-block">
                  <input type="hidden" name="step_no[]" id="step_no_STEP" value="" control-id="ControlID-30">
                  <input type="hidden" name="step_image[]" id="step_image_STEP" value="">
                  <input type="hidden" name="new_step_image[]" id="new_step_image_STEP" value="">
                  <input type="hidden" name="del_step_image[]" id="del_step_image_STEP" value="">
                  <div style="position:absolute;left:-3000px">
                    <input type="file" name="q_step_file_1" id="q_step_file_STEP" file_gubun="step" accept="jpeg,png,gif" style="display:none;width:0px;height:0px;font-size:0px;" text="" control-id="ControlID-31">
                  </div>
				  <div id="stepImageBox_STEP" is_over="0" onclick="browseStepFile(STEP)" style="cursor:pointer">
					<img id="stepImageHolder_STEP" src="../resources/assets/uploadimage.png" style="width:200px; height:200px; fill:200px" class="bi bi-file-image" viewBox="0 0 16 16"">
			      </div>
                </div>
                <div id="tipItem_1" class="tip">
                  <p class="tip_title">팁</p>
                  <textarea name="tip_text[]" id="tip_text_1" class="form-control tipDescription" placeholder="조리 과정에 특별한 팁이 있다면 공유해주세요. 없다면 생략 가능합니다." style="height:50px; width:620px; resize:none;"></textarea>          
				  <button type="button" class="btn btn-danger deleteStepBtn" onclick="deleteStep(STEP)">삭제</button>
                </div>    
              </div>
            </div> <!--step regi box-->

            <!-- step template -->
            <div id="stepTemplate" style="display:none">
              <div id="stepItem_STEP" class="step">
                <p id="stepNum_STEP" class="stepNo_STEP ui sortable handle" style="width: 100px; display: inline-block; font-size: 18px; font-weight: normal; vertical-align: top; color: #33afe9; margin-left: 40px;">Step STEP</p>
                <div id="stepDescription_STEP" style="display:inline-block">
                  <textarea name="stepDescrption[]" id="stepDescription_STEP" class="form-control stepDescription" placeholder="과정을 적어주세요." style="height:100px; width:410px; resize:none;"></textarea>
                </div>
                <div id="stepUpload_STEP" style="display:inline-block">
                  <input type="hidden" name="step_no[]" id="step_no_STEP" value="" control-id="ControlID-30">
                  <input type="hidden" name="step_image[]" id="step_image_STEP" value="">
                  <input type="hidden" name="new_step_image[]" id="new_step_image_STEP" value="">
                  <input type="hidden" name="del_step_image[]" id="del_step_image_STEP" value="">
                  <div style="position:absolute;left:-3000px">
                    <input type="file" name="q_step_file_1" id="q_step_file_STEP" file_gubun="step" accept="jpeg,png,gif" style="display:none;width:0px;height:0px;font-size:0px;" text="" control-id="ControlID-31">
                  </div>
				  <div id="stepImageBox_STEP" is_over="0" onclick="browseStepFile(STEP)" style="cursor:pointer">
					<img id="stepImageHolder_STEP" src="../resources/assets/uploadimage.png" style="width:200px; height:200px; fill:200px" class="bi bi-file-image" viewBox="0 0 16 16"">
			      </div>
                </div>
                <div id="tipItem_STEP" class="tip">
                <p class="tip_title">팁</p>
                <textarea name="tip_text[]" id="tip_text_STEP" class="form-control tipDescription" placeholder="팁을 공유해주세요. 없다면 생략 가능합니다." style="height:50px; width:620px; resize:none;"></textarea> 
					<button type="button" class="btn btn-danger deleteStepBtn" onclick="deleteStep(STEP)">삭제</button>
                </div>
              </div>
            </div><!--step template finish-->
            <div class="btn_add mag_b_25" style="padding:0 0 20px 410px; width:820px;">
              <button type="button" onclick="addStep()" class="btn btn-primary" control-id="ControlID-83">
                <span class="glyphicon glyphicon-plus-sign"></span>순서추가
              </button>              
            </div>
          </div><!--과정 등록 박스 finish-->
        </div><!--레시피 등록 finish box-->

        <div class="regi_btm">
          <button type="button" onclick="save()" class="save" id="save" control-id="ControlID-44">저장</button>
          <button type="button" onclick="location.href='/recipe/get'" class="btn-lg btn-danger" id="cancel" control-id="ControlID-49" >취소</button>
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
