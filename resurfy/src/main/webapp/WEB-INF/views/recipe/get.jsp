<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<!-- Header-->
<header class="bg-dark py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-center text-white">
			<div class="lead fw-normal text-white-50 mb-0">관리자 추천 레시피</div>
			<br> <br>
			<div id="carouselExampleSlidesOnly" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="#"> <img
							src="http://file.okdab.com/UserFiles/searching/recipe/000200.jpg"
							class="d-block rounded mx-auto" alt="나물비빔밥" style="width: Xrem;">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<br>
<!-- <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked="">
  <label class="btn btn-outline-primary" for="btnradio1">최신메뉴</label>
  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked="">
  <label class="btn btn-outline-primary" for="btnradio2">추천메뉴</label>
   <form class="d-flex">
        <input class="form-control me-sm-2" type="search" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">search</button>
   </form> -->
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
				<option value="RF"
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
</div>
<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<div class="col mb-5">
				<c:forEach items="${get}" var="recipe">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="${recipe.image}" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									<c:out value="${recipe.recipename}" />
								</h5>
								<!-- 난이도-->
								<h5>
									<c:out value="${recipe.difficulty}" />
								</h5>
								<h5>
									<c:out value="${recipe.foodtype}" />
								</h5>
								<h5>
									<c:out value="${recipe.person}" />
								</h5>
								<c:out value="${recipe.time}" />
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="/recipe/detail?bno=<c:out value="${recipe.bno}" />">View
									options</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
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
</div>
</section>

<!--  end Pagination -->

<form id='actionForm' action="/recipe/get" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

	<input type='hidden' name='type'
		value='<c:out value="${ pageMaker.cri.type }"/>'> <input
		type='hidden' name='keyword'
		value='<c:out value="${ pageMaker.cri.keyword }"/>'>
</form>

<!-- Modal  추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

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

<%@include file="../includes/footer.jsp"%>
