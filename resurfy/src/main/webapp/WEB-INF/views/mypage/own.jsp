<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">마이 페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">작성 글 모아보기</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/cart">장바구니</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/own">가진 재료</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
				<div class="container-fluid">
					<br><br>
					<h1>가진 재료</h1>
					<br><br>
					<div class="container">
						<div class="row mb-3 text-center" id="chkAll" style="display:none;">
					      <div class="col-md-1 themed-grid-col">
					      	<input type="checkbox" id="cbx_chkAll">전체 선택
					      </div>
					    </div>
						<div class="row row-cols-1 row-cols-md-3 g-3 text-center">
						<c:forEach items="${list}" var="own">
							<div class="col themed-grid-col">
								<input type="checkbox" style="display:none;" name="chk" data-ownno="${own.ownNo}">${own.ingreName}
							</div>
						</c:forEach>
						</div>
						
				<input type="button" value="편집" class="editBtn">
				<input type="button" value="검색" class="searchBtn">	
				<input type="button" style="display:none;"  value="선택삭제" class="deleteBtn">
				<input type="button" style="display:none;"  value="취소" class="cancleBtn">
				
				<!-- start Paging -->
				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1 }">Previous</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
				<!-- end paging -->
                </div>
                <form id='actionForm' action="/mypage/own" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				</form>
            </div>
        </div>
	</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/mypageScripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click",	function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cbx_chkAll").click(function() {
			if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked) $("#cbx_chkAll").prop("checked", false);
			else $("#cbx_chkAll").prop("checked", true); 
		});
		
		$(".deleteBtn").click(function(){
			var checkArr = new Array();
			   
		   $("input[name=chk]:checked").each(function(){
		    checkArr.push($(this).attr("data-ownno"));
		   });
		   
		   if(checkArr.length == 0){
			   alert("선택된 재료가 없습니다.");
		   }else{
			  var confirm_val = confirm("정말 삭제하시겠습니까?");
			  
			  if(confirm_val) {
				   console.log(checkArr);
				   $.ajax({
					    url : "/mypage/deleteOwn",
					    method : "post",
					    data : { chbox : checkArr },
					    success : function(){
					    	console.log("삭제 성공");
					    	location.href = "/mypage/own";
					    }
					});
			  } 
		   }
		});	//end click
		
		$(".searchBtn").click(function(){
			alert("기능 준비중 입니다.");
		});	//end click
		
		$(".editBtn").click(function(){
			if($("input[name=chk]").css("display")=="none"){
				$("input[name=chk]").toggle();
				$(".deleteBtn").toggle();
				$(".cancleBtn").toggle();
				$("#chkAll").toggle();				
				$(".editBtn").toggle();
				$(".searchBtn").toggle();
			}
		});	//end click
		
		$(".cancleBtn").click(function(){
			$(".editBtn").toggle();
			$(".searchBtn").toggle();
			$("input[name=chk]").toggle();
			$(".deleteBtn").toggle();
			$(".cancleBtn").toggle();
			$("#chkAll").toggle();	
		});	//end click
	});
</script>
<%@include file="../includes/footer.jsp"%>
