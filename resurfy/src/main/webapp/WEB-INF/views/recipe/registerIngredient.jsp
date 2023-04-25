<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 재료 등록 박스 -->
          <div class="wrapper_box pad_l_60">
            <div class="mag_b_25 ui-sortable" id="divIngredientGroupArea">
              <div class="wrapper_line">
                <p class="wrapper_title1" style="color:black;">재료</p>
                <ul id="ingredientAra_1" class="ingredientGroup">
                  <select class="form-select" id="ingreType" name="ingreType" control-id="ControlID-11">
                    <option value="">재료별</option>
                    <option value="3060001|주재료"<c:if test="${ingreType == '3060001|주재료'}">selected</c:if>>주재료</option>
                    <option value="3060002|부재료"<c:if test="${ingreType == '3060002|부재료'}">selected</c:if>>부재료</option>
                    <option value="3060003|양념"<c:if test="${ingreType == '3060003|양념'}">selected</c:if>>양념</option>
                  </select>		
                  <li id="liIngredient_1_1">
                    <input type="text" name="ingreName_1[]" id="ingreName_1_1" value="<c:out value='${ingreName_1_1}'/>"
                    class="addIngredient_name" style="width:285px; border-radius: 0.375rem" placeholder="예) 돼지고기" control-id="ControlID-19">
                    <input type="text" name="ingreMeasure_1[]" id="ingreMeasure_1_1" value="<c:out value='${ingreMeasure_1_1}'/>"
                    class="addIngredient_amount" style="width:210px; border-radius: 0.375rem" placeholder="예) 300g" control-id="ControlID-20">
                    <button type="button" class="btn btn-warning deleteIngredientBtn">삭제</button>
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