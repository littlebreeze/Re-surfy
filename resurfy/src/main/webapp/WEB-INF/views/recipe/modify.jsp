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
       
<!--        Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header" align="center" style="margin: 0 auto; color: #33afe9">레시피 수정페이지</h3>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row" style=" width: 50%; margin: 0 auto; text-align:left">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading" align="center" style="margin: 0 auto; color: #33afe9">레세피 수정</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/board/modify" method="post">

					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'> 
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>


						<div class="form-group" style=" width: 50%; margin: 0 auto; text-align:center">
						<img src='<c:out value="${recipe.image }"/>' readonly="readonly" 
							width=200px height=200px  alt="...">
							
						</div>

						<div class="form-group">
						<label>Bno</label> <input class="form-control" name='bno'
							value='<c:out value="${recipe.bno }"/>' readonly="readonly">
						</div>

					<div class="form-group">
						<label>레시피 제목</label> <input class="form-control" name='title'
							value='<c:out value="${recipe.recipeName }"/>'>
					</div>

					<div class="form-group">
						<label>요리 소개</label>
						<textarea class="form-control" rows="3" name='content'><c:out
								value="${recipe.recipeDescription}" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
							value='<c:out value="${recipe.id}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>RegDate</label> <input class="form-control" name='regDate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${recipe.recipeDate}" />'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>Update Date</label> <input class="form-control"
							name='updateDate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${recipe.recipeUpdateDate}" />'
							readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>카테고리</label> 
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

					<div class="form-group">
						<label>재료</label> 
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
					</div>
					
					<div class="form-group">
						<label>요리순서</label>
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
					</div>


					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>


			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				var deleteYN = confirm("삭제하시겠습니까?");
                if(deleteYN == true){

				formObj.attr("action", "/recipe/remove");
                }
			} else if (operation === 'list') {
				//move to list
				self.location  = "/recipe/get";
				return;

			}

			formObj.submit();
		});

	});
</script>


<%@include file="../includes/footer.jsp"%>

</body>
</html>