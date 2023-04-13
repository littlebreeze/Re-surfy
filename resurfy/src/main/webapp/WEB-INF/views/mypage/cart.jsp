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
                    <h1>장바구니</h1>
                    <br><br>
                    <div class="container">
                    	<div class="row mb-3 text-center">
					      <div class="col-md-1 themed-grid-col">
					      	<input type="checkbox" id="cbx_chkAll">전체 선택
					      </div>
					    </div>
					<c:forEach items="${list}" var="cart">
					    <div class="row mb-3 text-center">
					      <div class="col-md-1 themed-grid-col">
					      	<input type="checkbox" name="chk" data-cno="${cart.cno}" data-ingre="${cart.iname}">${cart.cno}
					      </div>
					      <div class="col-md-7 themed-grid-col">${cart.pname}</div>
					      <div class="col-md-2 themed-grid-col">${cart.price}</div>
					      <div class="col-md-2 themed-grid-col">
					      	<input class="col-md-2" type="number" value="${cart.count}" min="0">
					      </div>
					    </div>
					</c:forEach>
					
					<input type="button" value="선택삭제" class="deleteBtn">
					<input type="button" value="구매하기" class="buyBtn">
					
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
					 
				
                </div>
                <form id='actionForm' action="/mypage/cart" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				</form>
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
		    checkArr.push($(this).attr("data-cno"));
		   });
		   console.log(checkArr);
		   if(checkArr.length == 0){
			   alert("선택된 제품이 없습니다.");
		   }else{
			  var confirm_val = confirm("정말 삭제하시겠습니까?");
			  
			  if(confirm_val) {
				   console.log(checkArr);
				   $.ajax({
					    url : "/mypage/deleteCart",
					    method : "post",
					    data : { chbox : checkArr },
					    success : function(){
					    	console.log("삭제 성공");
					    	location.href = "/mypage/cart";
					    }
					});
			  } 
		   }
		});	//end click
		
		$(".buyBtn").click(function(){
			var ingreArr = new Array();
			var cnoArr = new Array();
			   
		   $("input[name=chk]:checked").each(function(){
		    ingreArr.push($(this).attr("data-ingre"));
		    cnoArr.push($(this).attr("data-cno"));
		   });
		   
		   if(ingreArr.length == 0){
			   alert("선택된 제품이 없습니다.");
		   }else{
			  var confirm_val = confirm("구매하시겠습니까?");
			  
			  if(confirm_val) {
				   console.log(ingreArr);
				   $.ajax({
					    url : "/mypage/addOwn",
					    method : "post",
					    data : { ingreArr : ingreArr,
					    		 chbox : cnoArr},
					    success : function(){
					    	console.log("구매 성공");
					    	location.href = "/mypage/own";
					    }
					});
			  } 
		   }
		});	//end click
	});
</script>
<%@include file="../includes/footer.jsp"%>