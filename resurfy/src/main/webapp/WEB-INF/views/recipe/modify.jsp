<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>>UPDATE - <c:out value="${recipe.recipeName }"/></title>
       <link href="/resources/css/styles_detail.css" rel="stylesheet" />
       <link href="/resources/css/modifyStyles.css" rel="stylesheet" />
<!--        Bootstrap Core CSS -->
<!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"> -->

<!-- MetisMenu CSS -->
<!-- <link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet"> -->

<!-- DataTables CSS -->
<!-- <link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">-->

<!-- DataTables Responsive CSS -->
<!-- <link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">-->

<!-- Custom CSS -->
<!-- <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">-->

<!-- Custom Fonts -->
<!-- <link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">-->

</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="modify_title" align="center">레시피 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row" style=" width: 70%; margin: 0 auto; text-align:left">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading" align="center" style="margin: 0 auto; color: #33afe9"></div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/recipe/modify" method="post">

					<%-- <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'> 
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> --%>

						<div class="py-1 row">
    						
    					<div class="col">
						<div class="form-group" style=" margin: 0 auto; text-align:center">
						<img src='<c:out value="${recipe.image }"/>' readonly="readonly" 
							width=410px height=400px  alt="..." style="margin-top:20px;">
							
						</div>
						</div>
						
						<div class="col">
							<div class="form-group">
						<label>작성자</label> <input class="form-control" name='id'
							value='<c:out value="${recipe.id}"/>' readonly="readonly" style="margin-top:20px;">
					</div>
					
						<div class="form-group">
						<label>작성 날짜</label> <input class="form-control" name='recipeDate'
							value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${recipe.recipeDate}" />'
							readonly="readonly" style="margin-top:20px;">
					
						</div>
							<div class="form-group">
						<label>수정 날짜</label> <input class="form-control"
							name='recipeUpdateDate'
							value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${recipe.recipeUpdateDate}" />'
							readonly="readonly" style="margin-top:20px;">
					</div>
						
						
						
						</div>
						
						
						

						<div class="form-group" style="margin-top:30px;">
						<!-- <label>레시피 번호</label>--> <input type='hidden' class="form-control" name='bno'
							value='<c:out value="${recipe.bno }"/>' readonly="readonly" style="margin-top:20px;">
						</div>

					<div class="form-group">
						<label>레시피 제목</label> <input class="form-control" name='recipeName'
							value='<c:out value="${recipe.recipeName }"/>' style="margin-top:20px;">
					</div>

					<div class="form-group">
						<label>요리 소개</label>
						<textarea class="form-control" rows="3" name='recipeDescription' style="margin-top:20px; height:100px;"><c:out
								value="${recipe.recipeDescription}" /></textarea>
					</div>
					
					<div class="form-group">
						<label>카테고리</label> 
						<div class="py-1 row" style="margin-top:20px;">
						<div class="col">
			              <select class="form-select" id="food_type" control-id="ControlID-11" name="foodType">
			                <option value="" >유형별</option>
			                <option value="한식" <c:if test ="${recipe.foodType eq '한식'}">selected="selected"</c:if>>한식 </option>
			                <option value="중국" <c:if test ="${recipe.foodType eq '중국'}">selected="selected"</c:if>>중국</option>
			                <option value="일본" <c:if test ="${recipe.foodType eq '일본'}">selected="selected"</c:if>>일본</option>
			                <option value="서양" <c:if test ="${recipe.foodType eq '서양'}">selected="selected"</c:if>>서양</option>
			                <option value="이탈리아" <c:if test ="${recipe.foodType eq '이탈리아'}">selected="selected"</c:if>>이탈리아</option>
			                <option value="동남아시아" <c:if test ="${recipe.foodType eq '동남아시아'}">selected="selected"</c:if>>동남아시아</option>
							<option value="퓨전" <c:if test ="${recipe.foodType eq '퓨전'}">selected="selected"</c:if>>퓨전</option>
			              </select>
			              </div>
			              <div class="col">
			             <select class="form-select" id="person" control-id="ControlID-11" name="person">
			                <option value="" >인원</option>
			                <option value="1인분" <c:if test ="${recipe.person eq '1인분'}">selected="selected"</c:if>>1인분</option>
			                <option value="2인분" <c:if test ="${recipe.person eq '2인분'}">selected="selected"</c:if>> 2인분</option>
			                <option value="3인분" <c:if test ="${recipe.person eq '3인분'}">selected="selected"</c:if>> 3인분</option>
			                <option value="4인분" <c:if test ="${recipe.person eq '4인분'}">selected="selected"</c:if>> 4인분</option>
			                <option value="5인분이상" <c:if test ="${recipe.person eq '5인분이상'}">selected="selected"</c:if>> 5인분이상</option>
			            </select>
			            </div>
			            <div class="col">
			            <span class="pad_l_30"> </span>
			            <select class="form-select" id="time" control-id="ControlID-11" name="time">
			              <option value="" >시간</option>
			              <option value="5분" <c:if test ="${recipe.time eq '5분'}">selected="selected"</c:if>> 5분</option>
			              <option value="10분" <c:if test ="${recipe.time eq '10분'}">selected="selected"</c:if>> 10분</option>
			              <option value="15분" <c:if test ="${recipe.time eq '15분'}">selected="selected"</c:if>> 15분</option>
			              <option value="20분" <c:if test ="${recipe.time eq '20분'}">selected="selected"</c:if>> 20분</option>
			              <option value="25분" <c:if test ="${recipe.time eq '25분'}">selected="selected"</c:if>> 25분</option>
			              <option value="30분" <c:if test ="${recipe.time eq '30분'}">selected="selected"</c:if>> 30분</option>
			              <option value="35분" <c:if test ="${recipe.time eq '35분'}">selected="selected"</c:if>> 35분</option>
			              <option value="40분" <c:if test ="${recipe.time eq '40분'}">selected="selected"</c:if>> 40분</option>
			              <option value="50분" <c:if test ="${recipe.time eq '50분'}">selected="selected"</c:if>> 50분</option>
			              <option value="60분" <c:if test ="${recipe.time eq '60분'}">selected="selected"</c:if>> 60분</option>
			              <option value="90분" <c:if test ="${recipe.time eq '90분'}">selected="selected"</c:if>> 90분</option>
			              <option value="120분" <c:if test ="${recipe.time eq '120분'}">selected="selected"</c:if>> 120분</option>
			              <option value="140분" <c:if test ="${recipe.time eq '140분'}">selected="selected"</c:if>> 140분</option>
			              <option value="180분" <c:if test ="${recipe.time eq '175분' || recipe.time eq '180분'}">selected="selected"</c:if>> 180분</option>
			            </select>
			            </div>
			            <div class="col">
			            <span class="pad_l_30"> </span>
			            <select class="form-select" id="difficulty" control-id="ControlID-11" name="difficulty">
			              <option value="" >난이도</option>
			              <option value="초보환영" <c:if test ="${recipe.difficulty eq '초보환영'}">selected="selected"</c:if>> 초보환영</option>
			              <option value="보통" <c:if test ="${recipe.difficulty eq '보통'}">selected="selected"</c:if>> 보통</option>
			              <option value="어려움" <c:if test ="${recipe.difficulty eq '어려움'}">selected="selected"</c:if>> 어려움</option>
			            </select>
			            </div>
			            </div>
					</div>

					<div class="form-group">
						<label style="margin-bottom:15px">재료</label> 
						
					
						<c:forEach items="${ingre}" var="ing">
						
						<c:if test="${ing.ingreType eq '주재료'}">
						
    						<div class="py-1 row">
    						
    							<div class="col">
    							  <select class="form-select" id="ingredient_type" control-id="ControlID-11" name="ingreType">
				                <option>재료별</option>
				                <option value="주재료" <c:if test ="${ing.ingreType eq '주재료'}">selected="selected"</c:if>> 주재료</option>
				                <option value="부재료" <c:if test ="${ing.ingreType eq '부재료'}">selected="selected"</c:if>> 부재료</option>
				                <option value="양념" <c:if test ="${ing.ingreType eq '양념'}">selected="selected"</c:if>>양념</option>
				              </select>
    							</div>
								<div class="col">
								<input type="text" name="ingreName" id="recipIngredient_name_1_1"
				                class="addIngredient_name" value = '<c:out value="${ing.ingreName }"/>' style="width:295px;  border-radius: 0.375rem" control-id="ControlID-19">
								</div>
								<div class="col">
								<input type="text" name="ingreMeasure" id="recipIngredient_amount_1_1"
				                class="addIngredient_amount"  value = '<c:out value="${ing.ingreMeasure }"/>' style="width:295px;  border-radius: 0.375rem"  control-id="ControlID-20">
								</div>
								
							</div>
							<input type='hidden' name='ino' value="${ing.ino }"/>
						</c:if>
					
				
						</c:forEach>
						<br>
						
						<c:forEach items="${ingre}" var="ing">
						
						<c:if test="${ing.ingreType eq '부재료'}">
						
    						<div class="py-1 row">
    						
    							<div class="col">
    							  <select class="form-select" id="ingredient_type" control-id="ControlID-11" name="ingreType">
				                <option>재료별</option>
				                <option value="주재료" <c:if test ="${ing.ingreType eq '주재료'}">selected="selected"</c:if>> 주재료</option>
				                <option value="부재료" <c:if test ="${ing.ingreType eq '부재료'}">selected="selected"</c:if>> 부재료</option>
				                <option value="양념" <c:if test ="${ing.ingreType eq '양념'}">selected="selected"</c:if>>양념</option>
				              </select>
    							</div>
							<div class="col">
								<input type="text" name="ingreName" id="recipIngredient_name_1_1"
				                class="addIngredient_name" value = '<c:out value="${ing.ingreName }"/>' style="width:295px;  border-radius: 0.375rem" control-id="ControlID-19">
								</div>
								<div class="col">
								<input type="text" name="ingreMeasure" id="recipIngredient_amount_1_1"
				                class="addIngredient_amount"  value = '<c:out value="${ing.ingreMeasure }"/>' style="width:295px; border-radius: 0.375rem"  control-id="ControlID-20">
								</div>
								
							</div>
							<input type='hidden' name='ino' value="${ing.ino }"/>
						</c:if>
					
				
						</c:forEach>
						<br>

						<c:forEach items="${ingre}" var="ing">
						
						<c:if test="${ing.ingreType eq '양념'}">
						
    						<div class="py-1 row">
    						
    							<div class="col">
    							  <select class="form-select" id="ingredient_type" control-id="ControlID-11" name="ingreType">
				                <option>재료별</option>
				                <option value="주재료" <c:if test ="${ing.ingreType eq '주재료'}">selected="selected"</c:if>> 주재료</option>
				                <option value="부재료" <c:if test ="${ing.ingreType eq '부재료'}">selected="selected"</c:if>> 부재료</option>
				                <option value="양념" <c:if test ="${ing.ingreType eq '양념'}">selected="selected"</c:if>>양념</option>
				              </select>
    							</div>
								<div class="col">
								<input type="text" name="ingreName" id="recipIngredient_name_1_1"
				                class="addIngredient_name" value = '<c:out value="${ing.ingreName }"/>' style="width:295px;  border-radius: 0.375rem" control-id="ControlID-19">
								</div>
								<div class="col">
								<input type="text" name="ingreMeasure" id="recipIngredient_amount_1_1"
				                class="addIngredient_amount"  value = '<c:out value="${ing.ingreMeasure }"/>' style="width:295px;  border-radius: 0.375rem"  control-id="ControlID-20">
								</div>
								
							</div>
							<input type='hidden' name='ino' value="${ing.ino }"/>
						</c:if>
					
				
						</c:forEach>
						<br>
					</div>
					
					
					<div class="form-group">
						<label>요리순서</label>
						 <c:forEach items="${step}" var="st">
							<c:choose>
      							<c:when test="${st.stepImage == ' ' || st.stepImage == '0'}"> 
      							<div class="py-3 row">
      							<div class="col"><img src="/resources/assets/nonOrangelogo.png" width=85% height=250px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step<c:out value="${st.stepNo}" /></div>
								<%-- <input type="text" name="stepDescription" id="stepDescription" value='<c:out value="${st.stepDescription }"/>'  class="form-control" style="width:600px; margin-top:13px; display:inline-block;" control-id="ControlID-30"> --%>              
								
								<textarea name="stepDescription" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;"><c:out value="${st.stepDescription }"/></textarea>
								<c:choose>
      							<c:when test="${st.tip == ' ' || st.stepImage == '0'}"> 
								<div style="font-size:13px"></div>
								<input type='hidden' name='stepTip' value="${st.tip }"/>
								</c:when>
								<c:otherwise>
								<div class="fw-bolder" style="font-size:13px">❈ tip <br> 
								<textarea name="stepTip" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;"><c:out value="${st.tip }"/></textarea>
              					</div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:when> 

      							<c:otherwise>
      							<div class="py-3 row"> 
								<div class="col"><img src='<c:out value="${st.stepImage }"/>' readonly="readonly" width=85% height=250px  alt="..."></div>
								<div class="col">
								<div class="fw-bolder">Step<c:out value="${st.stepNo}" /></div>
								
								<textarea name="stepDescription" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;"><c:out value="${st.stepDescription }"/></textarea>            
									<c:choose>
      							<c:when test="${st.tip == ' ' || st.stepImage == '0'}"> 
								<div style="font-size:13px"></div>
								<input type='hidden' name='stepTip' value="${st.tip }"/>
								</c:when>
								<c:otherwise>
								<div class="fw-bolder" style="font-size:13px">❈ tip <br> 
								<textarea name="stepTip" id="recipeDescription" class="form-control step_cont" style="height:100px; width:600px; resize:none;"><c:out value="${st.tip }"/></textarea>
              					</div>
								</c:otherwise> 

							</c:choose>  
								</div>
								</div>
      							</c:otherwise> 

							</c:choose> 
						
               				<input type='hidden' name='sno' value="${st.sno }"/>
                     </c:forEach> 
					</div>

					<div style="text-align: center; border-bottom:20px">
					<button id="modi_button" type="submit" data-oper='modifyw' class="btn btn-info" style="width:150px; height:50px; font-size:25px;color: #fff; background-color: #007bff; border-color: #007bff;" >수정</button>
					<button type="submit" data-oper='remove' class="btn btn-danger" style="width:150px; height:50px; font-size:25px;">삭제</button>
					<!-- <button type="submit" data-oper='list' class="btn btn-info" style="width:150px; height:50px; background-color: #e95420; font-size:25px;">목록</button>-->
					</div>
				</form>


			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
 <!-- Confirm Modal-->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="addModalDialog">
			<div class="modal-content" id="addModalContent">
				<div class="modal-header">
					<h4 class="modal-title" id="confirmModalLabel">confirm</h4>
				</div>
				<div class="modal-body">
					확인 또는 취소를 눌러주세요
				</div>
				<div class="modal-footer">
					<button id='modalConfirmBtn' type="button" class="btn btn-primary" style= "background-color:#e95420; border:none">확인</button>					
					<button id='modalCancelBtn' type="button" class="btn btn-default" style="border:1px solid lightgray">취소</button>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	$(document).ready(function() {
		var confirmModal = $("#confirmModal");
		var alertModal = $("#alertModal");

			
			var modalCancelBtn = $("#modalCancelBtn");
			modalCancelBtn.on("click", function(e){
				confirmModal.modal("hide");
			});
		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				$(".modal-title").html("레시피 삭제") 
	   		    $(".modal-body").html("레시피를 삭제하시겠습니까?")
				confirmModal.modal("show");
				
				$("#modalConfirmBtn").on("click", function(e){
					
					formObj.attr("action", "/recipe/remove");
					formObj.submit();
					});
			
			} else if (operation === 'list') {
				//move to list
				self.location  = "/recipe/get";
				return;

			} else if (operation === 'modifyw'){
				$(".modal-title").html("레시피 수정") 
	   		    $(".modal-body").html("레시피를 수정하시겠습니까?")
				confirmModal.modal("show");
				
				$("#modalConfirmBtn").on("click", function(e){
					
					formObj.attr("action", "/recipe/modify");
					formObj.submit();
					});
				
			}

			//formObj.submit();
		});

	});
</script>

</body>
</html>