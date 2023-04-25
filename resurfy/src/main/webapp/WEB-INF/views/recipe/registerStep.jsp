<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
	<!-- 과정 등록 박스 -->
          <div class="wrapper_box2 pad_l_60">
            <input type="file" name="file" id="multifile_1" file_gubun="step" style="display:none;" multiple/>
            <p class="wrapper_title2" style="color:black;">요리순서</p>
            <div id="stepArea" class="stepArea">
              <div id="stepItem_STEP" class="step">
                <p id="stepNum_STEP" name="stepNo" class="stepNo_STEP ui-sortable-handle" data-original-title="" title=""  style="width: 100px; display: inline-block; font-size: 18px; font-weight: normal; vertical-align: top; color: #black; margin-left: 40px;">Step 1</p>
                <div id="stepDescription_STEP" style="display:inline-block">
                  <textarea name="stepDescription" id="stepDescription_STEP" class="form-control stepDescription" placeholder="예) 김치를 적당한 크기로 썰어 팬에 볶아주세요." style="height:100px; width:410px; resize:none;" control-id="ControlID-29"><c:out value='${stepDescription_STEP}'/></textarea>
                </div>
                <div id="stepUpload_STEP" style="display:inline-block">
                  <input type="hidden" name="step_no[]" id="step_no_STEP" value="" control-id="ControlID-30">
                  <input type="hidden" name="step_image[]" id="step_image_STEP" value="">
                  <input type="hidden" name="new_step_image[]" id="new_step_image_STEP" value="">
                  <input type="hidden" name="del_step_image[]" id="del_step_image_STEP" value="">
                  <div style="position:absolute;left:-3000px">
                    <input type="file" name="stepImage" id="q_step_file_STEP" file_gubun="step" accept="jpeg,png,gif" style="display:none;width:0px;height:0px;font-size:0px;" text="" control-id="ControlID-31">
                  </div>
				  <div id="stepImageBox_STEP" is_over="0" onclick="browseStepFile(STEP)" style="cursor:pointer">
					<img id="stepImageHolder_STEP" src="../resources/assets/uploadimage.png" style="width:200px; height:200px; fill:200px" class="bi bi-file-image" viewBox="0 0 16 16"">
			      </div>
                </div>
                <div id="tipItem_1" class="tip">
                  <p class="tip_title" style="color:black;">팁</p>
                  <textarea name="tip" id="tip_text_1" class="form-control tipDescription" placeholder="조리 과정에 특별한 팁이 있다면 공유해주세요. 없다면 생략 가능합니다." style="height:50px; width:620px; resize:none;"><c:out value='${tip_text_1}'/></textarea>          
				  <button type="button" class="btn btn-warning deleteStepBtn" onclick="deleteStep(STEP)">삭제</button>
                </div>    
              </div>
            </div> <!--step regi box-->

            <!-- step template -->
            <div id="stepTemplate">
              <div id="stepItem_STEP" class="step">
                <p id="stepNum_STEP" class="stepNo_STEP ui sortable handle" style="width: 100px; display: inline-block; font-size: 18px; font-weight: normal; vertical-align: top; color: black; margin-left: 40px;">Step STEP</p>
                <div id="stepDescription_STEP" style="display:inline-block">
                  <textarea name="stepDescrption[]" id="stepDescription_STEP" class="form-control stepDescription" placeholder="과정을 적어주세요." style="height:100px; width:410px; resize:none;"><c:out value='${stepDescription_STEP}'/></textarea>
                </div>
                <div id="stepUpload_STEP" style="display:inline-block">
                  <input type="hidden" name="step_no[]" id="step_no_STEP" value="" control-id="ControlID-30">
                  <input type="hidden" name="step_image[]" id="step_image_STEP" value="">
                  <input type="hidden" name="new_step_image[]" id="new_step_image_STEP" value="">
                  <input type="hidden" name="del_step_image[]" id="del_step_image_STEP" value="">
                  <div style="position:absolute;left:-3000px">
                    <input type="file" name="stepImage" id="q_step_file_STEP" file_gubun="step" accept="jpeg,png,gif" style="display:none;width:0px;height:0px;font-size:0px;" text="" control-id="ControlID-31">
                  </div>
				  <div id="stepImageBox_STEP" is_over="0" onclick="browseStepFile(STEP)" style="cursor:pointer">
					<img id="stepImageHolder_STEP" src="../resources/assets/uploadimage.png" style="width:200px; height:200px; fill:200px" class="bi bi-file-image" viewBox="0 0 16 16"">
			      </div>
                </div>
                <div id="tipItem_STEP" class="tip">
                <p class="tip_title"  style="color:black;">팁</p>
                <textarea name="tip" id="tip_text_STEP" class="form-control tipDescription" placeholder="팁을 공유해주세요. 없다면 생략 가능합니다." style="height:50px; width:620px; resize:none;"><c:out value='${tip_text_STEP}'/></textarea> 
					<button type="button" class="btn btn-warning deleteStepBtn" onclick="deleteStep(STEP)">삭제</button>
                </div>
              </div>
            </div><!--step template finish-->
            <div class="btn_add mag_b_25" style="padding:0 0 20px 410px; width:820px;">
              <button type="button" onclick="addStep()" class="btn btn-primary" control-id="ControlID-83" style="background-color:#e95420;">
                <span class="glyphicon glyphicon-plus-sign"></span>순서추가
              </button>              
            </div>
          </div><!--과정 등록 박스 finish-->
        </div><!--레시피 등록 finish box-->
