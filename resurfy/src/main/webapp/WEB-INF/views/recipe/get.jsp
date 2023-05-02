<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../recipe/bestRecipe.jsp"%>
<link href="/resources/css/get.css" rel="stylesheet">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<br>
<c:if test="${pageMaker.cri.type == 'O' }">
	<div class="container">
		<br>
		<div class="row row-cols-1 row-cols-md-4 g-3 text-center">
			<c:if test="${empty list}">
				<div>가진 재료 없음</div>
			</c:if>
			<c:forEach items="${list}" var="own">
				<div class="col themed-grid-col" id="ownGroup">
					<input type="checkbox" class="form-check-input flex-shrink-0"
						style="margin-right: 30px;" name="chk" value="${own.ingreName}"
						<c:out value="${pageMaker.cri.chk.contains(own.ingreName)?'checked':''}"/>>${own.ingreName}
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- end .container -->
</c:if>

<!-- Section-->
<div class="py-3">
	<div class="container px-4 px-lg-5 mt-3">
		<c:if test="${pageMaker.cri.type != 'O' }">
			<div class='row'>
				<div class="col-lg-12">
					<form id='searchForm' action="/recipe/get" method='get'>
						<select name='type'>
							<option value="R"
								<c:out value="${pageMaker.cri.type eq 'R'?'selected':''}"/>>음식
								이름</option>
							<option value="F"
								<c:out value="${pageMaker.cri.type eq 'F'?'selected':''}"/>>음식
								종류</option>
							<option value="D"
								<c:out value="${pageMaker.cri.type eq 'D'?'selected':''}"/>>난이도
							</option>
							<option value="DFR"
								<c:out value="${pageMaker.cri.type eq 'DRF'?'selected':''}"/>>
								이름or종류or난이도</option>
						</select> <input type='text' name='keyword'
							value='<c:out value="${pageMaker.cri.keyword}" />'
							placeholder="예)[음식이름]-김치찌개 [음식종류]-한식" /> <input type='hidden'
							name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
						<input type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
						<button class="btn btn-primary btn-lg">
							<img src="/resources/assets/search.png" width="20" height="auto">
						</button>
					</form>
				</div>
			</div>
			<br>
			<div>
				<button type="button" class="btn btn-light" 
				data-bs-toggle="tooltip"
						data-bs-placement="bottom"
						data-bs-original-title="내림차순" style="color: #fff;">
					<a href="?orderBy=visitcnt">#조회 수</a>
				</button>
				<button type="button" class="btn btn-light" 
				data-bs-toggle="tooltip"
						data-bs-placement="bottom"
						data-bs-original-title="내림차순" style="color: #fff;">
					<a href="?orderBy=replycnt">#댓글 수</a>
				</button>
			</div>
			</ul>
		</c:if>
		<c:choose>
			<c:when test="${param.orderBy eq 'visitcnt'}">
				<div class="card-container">
					<c:forEach items="${sortByVisit}" var="recipe">
						<div class="card" style="border: 0px;">
							<a href="/recipe/detail?bno=<c:out value="${recipe.bno}" />">
								<div class="card-img" data-bs-toggle="tooltip"
						data-bs-placement="top"
						data-bs-original-title = "조회수 : ${recipe.visitcnt} | 댓글수 : ${recipe.replycnt}" >
									<img class="card-img-top" src="${recipe.image}" alt="..." />
								</div>
							</a>
							<div class="card-head" style="border-bottom: 1px solid #F0DDD8;
							margin-top : 10px; height: 50px;">
								<b style="font-size: 25px;"> <c:out
										value="${recipe.recipeName}" /></b>
							</div>
							<div class="card-main" style="border-bottom: 1px solid #F0DDD8;
							margin-top : 10px;">
								<div>
									난이도 :
									<c:out value="${recipe.difficulty}" />
								</div>
								<div>
									종류 :
									<c:out value="${recipe.foodType}" />
								</div>
								<div>
									기준인분 :
									<c:out value="${recipe.person}" />
								</div>
								<div>
									조리시간 :
									<c:out value="${recipe.time}" />
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:when test="${param.orderBy eq 'replycnt'}">
				<div class="card-container">
					<c:forEach items="${sortByReply}" var="recipe">
						<div class="card" style="border: 0px;">
							<a href="/recipe/detail?bno=<c:out value="${recipe.bno}" />">
								<div class="card-img" data-bs-toggle="tooltip"
						data-bs-placement="top"
						data-bs-original-title = "조회수 : ${recipe.visitcnt} | 댓글수 : ${recipe.replycnt}" >
									<img class="card-img-top" src="${recipe.image}" alt="..." />
								</div>
							</a>
							<div class="card-head" style="border-bottom: 1px solid #F0DDD8;
							margin-top : 10px; height: 50px;">
								<b style="font-size: 25px;"> <c:out
										value="${recipe.recipeName}" /></b>
							</div>
							<div class="card-main" style="border-bottom: 1px solid #F0DDD8;
							margin-top : 10px;">
								<div>
									난이도 :
									<c:out value="${recipe.difficulty}" />
								</div>
								<div>
									종류 :
									<c:out value="${recipe.foodType}" />
								</div>
								<div>
									기준인분 :
									<c:out value="${recipe.person}" />
								</div>
								<div>
									조리시간 :
									<c:out value="${recipe.time}" />
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<div class="card-container">
					<c:forEach items="${get}" var="recipe">
						<div class="card" style="border: 0px;">
							<a href="/recipe/detail?bno=<c:out value="${recipe.bno}" />">
								<div class="card-img" data-bs-toggle="tooltip"
						data-bs-placement="top"
						data-bs-original-title = "조회수 : ${recipe.visitcnt} | 댓글수 : ${recipe.replycnt}" >
									<img class="card-img-top" src="${recipe.image}" alt="..." />
								</div>
							</a>
							<div class="card-head" style="border-bottom: 1px solid #F0DDD8;
							margin-top : 10px; height: 50px;">
								<b style="font-size: 25px;"> <c:out
										value="${recipe.recipeName}" /></b>
							</div>
							<div class="card-main" style="border-bottom: 1px solid #F0DDD8;
							margin-top : 10px;">
								<div>
									난이도 :
									<c:out value="${recipe.difficulty}" />
								</div>
								<div>
									종류 :
									<c:out value="${recipe.foodType}" />
								</div>
								<div>
									기준인분 :
									<c:out value="${recipe.person}" />
								</div>
								<div>
									조리시간 :
									<c:out value="${recipe.time}" />
								</div>

							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>

		<!-- start Paging -->
		<div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1 }">Previous</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1}">Next</a></li>
				</c:if>
			</ul>
		</div>
		<!-- end paging -->
	</div>
	<form id='actionForm' action="/recipe/get" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

		<input type='hidden' name='type'
			value='<c:out value="${ pageMaker.cri.type }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		<c:forEach items="${pageMaker.cri.chk}" var="chk">
			<input type='hidden' name='chk' value='<c:out value="${chk}"/>'>
		</c:forEach>
	</form>

</div>


<script type="text/javascript">
	$(document)
			.ready(
					function() {

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
									}
									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();
									searchForm.submit();
								});

						//체크 박스 선택하면 재검색
						$("input[name=chk]")
								.click(
										function() {
											actionForm
													.find("input[name='chk']")
													.remove();
											$("input[name=chk]:checked")
													.each(
															function() {
																actionForm
																		.append("<input type='hidden' name='chk' value='"
																				+ $(
																						this)
																						.val()
																				+ "'>");
															});

											if (!actionForm.find(
													"input[name='chk']").val()) {
												alert("재료를 한가지 이상 선택하세요!");
												actionForm.find(
														"input[name='type']")
														.remove();
											}
											actionForm.submit();
										});

					});
</script>

	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script>
			// 툴팁 초기화
			var tooltipTriggerList = [].slice.call(document
					.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList
					.map(function(tooltipTriggerEl) {
						return new bootstrap.Tooltip(tooltipTriggerEl)
					})
		</script>

<%@include file="../includes/footer.jsp"%>