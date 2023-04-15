<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link href="../resources/css/get.css" rel="stylesheet">


<!-- Header-->
<%-- <header class="recommend_recipe">
	<div id="carouselExampleAutoplaying" class="carousel slide"
		data-bs-ride="carousel">
		<div class="monthly_recipe">이달의 레시피</div>
		<div class="carousel-inner">
			<c:forEach items="${get}" var="recipe">
				<div class="carousel-item <c:if test="${status.index eq 0}">active</c:if>">
					<img src="${recipe.image}" class="d-block w-100" alt="${recipe.bno}">
					<div class="carousel-caption d-none d-md-block">
						<h5>${recipe.recipeName}</h5>
						<p>${recipe.foodType}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</header>
<br>
 --%>
<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class='row'>
			<div class="col-lg-12">
				<form id='searchForm' action="/recipe/get" method='get'>
					<select name='type'>
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
						<option value="R"
							<c:out value="${pageMaker.cri.type eq 'R'?'selected':''}"/>>음식</option>
						<option value="F"
							<c:out value="${pageMaker.cri.type eq 'F'?'selected':''}"/>>제목</option>
						<option value="FR"
							<c:out value="${pageMaker.cri.type eq 'RF'?'selected':''}"/>>음식
							or 제목</option>
					</select> <input type='text' name='keyword'
						value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
						type='hidden' name='pageNum'
						value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
						type='hidden' name='amount'
						value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class='btn btn-default'>Search</button>
				</form>
			</div>
		</div>
	<c:forEach items="${get}" var="recipe">
	<div class = "card-container">
		<div class = "card">
			<div class = "card-img">
				<img class="card-img-top" src="${recipe.image}" alt="..." />
			</div>
			<div class = "card-head">
				<c:out value="${recipe.recipeName}" />
			</div>
			<div class = "card-main">
				<div>
					<c:out value="${recipe.difficulty}" />
				</div>
				<div>
					<c:out value="${recipe.foodType}" />
				</div>
				<div>
					<c:out value="${recipe.person}" />
				</div>
				<div>
					<c:out value="${recipe.time}" />
				</div>
			</div>
			<div class = "card-footer">
				<a class="btn btn-outline-dark mt-auto"
				href="/recipe/detail?bno=<c:out value="${recipe.bno}" />">View
				options</a>
			</div>
		</div>
	</div>
</c:forEach>
</section>
		<div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage + 1}">Next</a></li>
				</c:if>
			</ul>
		</div>
		<form id='actionForm' action="/recipe/get" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

			<input type='hidden' name='type'
				value='<c:out value="${ pageMaker.cri.type }"/>'> <input
				type='hidden' name='keyword'
				value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>
	</div>

<!--  end Pagination -->



<script type="text/javascript">
	$(document)
			.ready(
			function() {
			var result = '<c:out value="${result}"/>';
			checkModal(result);
			history.replaceState({}, null, null);
			function checkModal(result) {
				if (result === '' || history.state) {
					return;
				}
				if (parseInt(result) > 0) {
					$(".modal-body").html(
							"게시글 " + parseInt(result)
							+ " 번이 등록되었습니다.");
				}
							$("#myModal").modal("show");
						}
						$("#regBtn").on("click", function() {
							self.location = "/recipe/registerRecipe";
						});
						var actionForm = $("#actionForm");
						$(".paginate_button a").on(
								"click",
								function(e) {
								e.preventDefault();
									console.log('click');
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						$(".move")
								.on("click",
								function(e) {
								e.preventDefault();
								actionForm
								.append("<input type='hidden' name='bno' value='"
								+ $(this).attr("href")+ "'>");
								actionForm.attr("action","/recipe/detail");
								actionForm.submit();
								});
						var searchForm = $("#searchForm");
						$("#searchForm button").on(
								"click",
								function(e) {
									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}
									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();
									searchForm.submit();
								});
					});
</script>

<%-- <%@include file="../includes/footer.jsp"%> --%>
