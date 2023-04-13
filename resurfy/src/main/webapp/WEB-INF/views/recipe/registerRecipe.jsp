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
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/registerRecipeStyles.css" rel="stylesheet" />
    <link href="/resources/css/registerRecipeGrid.css" rel="stylesheet">
  </head>
  <body>
    <form>
      <div class="register_recipe_wrapper">
        <div class="register_wrapper">
          <div class="register_title">레시피 등록</div>
          <div class="wrapper_box pad_l_60">
            <div class="wrapper_line">
              <p class="wrapper_title1">레시피 제목</p>
              <input type="text" name="recipeName" id="recipeName" value="" class="form-control" placeholder="예) 10분 완성 김치찌개" style="width:600px; margin-top:13px; display:inline-block;">
            </div>
            <div class="wrapper_line pad_b_25">
              <p class="wrapper_title1">요리소개</p>
              <textarea name="recipeDescription" id="recipeDescription" class="form-control step_cont" placeholder="예) 최대한 빠르고 간편하게 만드는 김치찌개입니다." style="height:100px; width:600px; resize:none;"></textarea>
            </div>
            <div class="wrapper_line">
              <p class="wrapper_title1">카테고리</p>
              <select name="foodType" id="foodType" text="유형별">
                <option value="" >유형별</option>
                <option value="56">한식</option>
                <option value="54">중식</option>
                <option value="55">일식</option>
                <option value="60">양식</option>
                <option value="53">지중해식</option>
                <option value="52">아시안식</option>
              </select>

              <select name="ingreType" id="ingreType" text="재료별">
                <option value="" >재료별</option>
                <option value="23">육류</option>
                <option value="28">채소류</option>
                <option value="24">해물류</option>
                <option value="50">달걀/유제품</option>
                <option value="33">가공식품류</option>
                <option value="47">쌀</option>
                <option value="32">밀가루</option>
                <option value="25">건어물류</option>
                <option value="31">버섯류</option>
                <option value="48">과일류</option>
                <option value="27">콩/견과류</option>
                <option value="26">곡류</option>
                <option value="34">기타</option>
              </select>
            </div>
            <div class="wrapper_line">
              <p class="wrapper_title1">요리정보</p>
              <select name="person" id="person" text="인원">
                <option value="" >인원</option>
                <option value="1">1인분</option>
                <option value="2">2인분</option>
                <option value="3">3인분</option>
                <option value="4">4인분</option>
                <option value="5">5인분이상</option>
              </select>
              <span class="pad_l_30"> </span>
              <select name="time" id="time"  text="요리시간">
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
              <select name="difficulty" id="difficulty"  text="난이도">
                <option value="" >난이도</option>
                <option value="1">쉬움</option>
                <option value="2">보통</option>
                <option value="3">어려움</option>
              </select>
            </div>
		  </div>
		  
          <div class="wrapper_box pad_l_60">
            <div class="mag_b_25 ui-sortable" id="divIngredientGroupArea">
				<div class="wrapper_line">
             		<p class="wrapper_title1">재료</p>
                	<ul id="ingredientAra_1" class="ingredientGroup">
	                  <li id="liIngredient_1_1">
	                    <input type="text" name="addIngredient_name_1[]" id="recipIngredient_name_1_1"
	                    class="addIngredient_name" style="width:350px;" placeholder="예) 돼지고기" control-id="ControlID-19">
	                    <input type="text" name="addIngredient_amount_1[]" id="recipIngredient_amount_1_1"
	                    class="addIngredient_amount" style="width:250px;" placeholder="예) 300g" control-id="ControlID-20">
	                    <a id="btnIngredientDel_1_1" href="javascript:delIngreidient(1,1)" class="btn-del" style="display: none;"></a>
	                  </li>
                	</ul>
	                <div class="btn_add" style="padding: 0 0 20px 420px; witdth:800px">
	                  <button type="button" onclick="addIngredient(1)" class="btn-lg btn-primary" control-id="ControlID-44">
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
              <div id="stepItem_1" class="step">
                <p id="stepNum_1" class="step_title1 ui-sortable-handle" data-original-title="" title="">Step1</p>
                <div id="stepText_1" style="display:inline-block">
                  <textarea name="step_text[]" id="step_text_1" class="form-control step_cont" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="height:200px; width:410px; resize:none;" control-id="ControlID-29"></textarea>
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
            </div> <!--step regi box-->

                  <!-- step template -->
            <div id="stepTemplate" style="display:none">
              <div id="stepItem_STEP" class="step">
                <p id="stepNum_STEP" class="step_title2 ui sortable handle" style="cursor:pointer">Step 2</p>
                <div id="stepText_STEP" style="display:inline-block">
                  <textarea name="step_text[]" id="step_text_STEP" class="form-control step_cont" placeholder="과정을 적어주세요." style="height:200px; width:410px; resize:none;"></textarea>
                </div>
                <div id="stepUpload_STEP" style="display:inline-block;">
                  <input type="hidden" name="step_no[]" id="step_no_STEP" value="">
                  <input type="hidden" name="step_image[]" id="step_image_STEP" value="">
                  <input type="hidden" name="new_step_image[]" id="new_step_image_STEP" value="">
                  <input type="hidden" name="del_step_image[]" id="del_step_image_STEP" value="">
                  <div style="position:absolute;left:-3000px">
                    <input type="file" name="q_step_file_STEP" id="q_step_file_STEP" file_gubun="step" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text="">
                  </div>
                  <div id="stepImageBox_STEP" is_over="0">
                    <img id="stepImageHolder_STEP" onclick="browseStepFile(__STEP)" src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" width="200" height="200" style="cursor:pointer">
                  </div>
                </div>
                <div style="width:580px;border:2px solid #33afe9;margin:5px 200px 5px;"></div>
              </div>
            </div><!--step template finish-->

            <div class="btn_add mag_b_25" style="padding:0 0 20px 410px; width:820px;">
              <button type="button" onclick="addStep()" class="btn-lg btn-primary" control-id="ControlID-44">
                <span class="glyphicon glyphicon-plus-sign"></span>순서추가
              </button>
            </div>

            <p class="wrapper_title1">요리완성사진
              <input type="file" name="file" id="multifile_2" file_gubun="work" style="display:none;" multiple/>
            </p>
            <div id="imagekArea" style="display:inline-flex;" class="imageGroup">
              <div id="imageUpload_1" class="complete_image">
                <input type="hidden" name="image[]" id="image_1" value="">
                <input type="hidden" name="new_image[]" id="new_image_1" value="">
                <input type="hidden" name="del_image[]" id="del_image_1" value="">
                <div style="position:absolute;left:-3000px">
                  <input type="file" name="q_work_file_1" id="q_work_file_1" file_gubun="work" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text="">
                </div>
                <div id="imageBox_1" is_over="0">
                  <a href="#" class="pic_del" style="display:inline-block;"></a>
                  <img id="imageHolder_1" onclick="browseWorkFile(1)" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 200px; height: 200px; cursor:pointer">
                </div>
              </div>
			  <div id="imageUpload_2" class="complete_image2">
                <input type="hidden" name="image[]" id="image_2" value="">
                <input type="hidden" name="new_image[]" id="new_image_2" value="">
                <input type="hidden" name="del_image[]" id="del_image_2" value="">
                <div style="position:absolute;left:-3000px">
                  <input type="file" name="q_work_file_2" id="q_work_file_2" file_gubun="work" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text="">
                </div>
                <div id="imageBox_2" is_over="0">
                  <a href="#" class="pic_del" style="display:inline-block;"></a>
                  <img id="imageHolder_2" onclick="browseWorkFile(2)" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 200px; height: 200px; cursor:pointer">
                </div>
              </div>
			  <div id="imageUpload_3" class="complete_image3">
                <input type="hidden" name="image[]" id="image_3" value="">
                <input type="hidden" name="new_image[]" id="new_image_3" value="">
                <input type="hidden" name="del_image[]" id="del_image_3" value="">
                <div style="position:absolute;left:-3000px">
                  <input type="file" name="q_work_file_3" id="q_work_file_3" file_gubun="work" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text="">
                </div>
                <div id="imageBox_3" is_over="0">
                  <a href="#" class="pic_del" style="display:inline-block;"></a>
                  <img id="imageHolder_3" onclick="browseWorkFile(3)" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 200px; height: 200px; cursor:pointer">
                </div>
              </div>
            </div>
          </div><!--photo-->

          <div class="wrapper_box pad_l_60">
            <p class="wrapper_title1">요리팁</p>
            <textarea name="tip" id="tip" class="tip" placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요." style="height:120px; width:620px; resize:none;"></textarea>
          </div><!--tip-->
        </div><!--regi_center box-->

        <div class="regi_btm">        
          <button type="button" onclick="doSubmit('save')" class="btn-lg btn-primary" control-id="ControlID-44">저장</button>
          <button type="button" onclick="history.back();" class="btn-lg btn-danger" control-id="ControlID-49">취소</button>
        </div><!--save and cancel-->
      </div><!--container finish-->
    </form>

	        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
  </body>
 <%@include file="../includes/footer.jsp"%>
  
</html>
