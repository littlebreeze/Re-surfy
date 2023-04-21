<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="../resources/css/mypageGrid.css" rel="stylesheet">
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">마이 페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/list">작성 글 모아보기</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/cart">장바구니</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" style="font-weight:bold; font-size:1.2rem;" href="/mypage/own">가진 재료</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
				<div class="container-fluid">
					<div class="col-lg-12">
						<button class="btn mypageBtn" id="sidebarToggle">></button>
						<h2 class="page-header">가진 재료</h2>
					<br></div>
					<div class="container">
						<div class="row mb-3 text-center" id="chkAll" style="display:none;">
					      <div class="col-md-2 themed-grid-col">
					      	<input type="checkbox" class="form-check-input flex-shrink-0" id="cbx_chkAll" style="margin-right:30px;">전체 선택
					      </div>
					    </div>
					    <form id='searchForm' action="/recipe/get" method='get'>
					    <c:if test="${empty list}">
							<div class="col" style="margin-bottom:30px;">
								<div class="p-5 text-center">
									<img src="/resources/assets/bluelogo.png" alt="Generic placeholder image" class="img-fluid" style="width: 160px; margin-bottom:20px;">
								    <h1 class="mb-3">재료를 추가해보세요!</h1>
								    <h4 class="mb-3">더 다양한 검색이 가능합니다</h4>
								  </div>
							</div>
						</c:if>
						<div class="row row-cols-1 row-cols-md-3 g-3 text-center">
							<c:forEach items="${list}" var="own">
								<div class="col themed-grid-col" id="ownGroup">
									<input type="checkbox" class="form-check-input flex-shrink-0" style="display:none; margin-right:30px;" name="chk" data-ownno="${own.ownNo}" data-name="${own.ingreName}" value="${own.ingreName}">${own.ingreName}
								</div>
							</c:forEach>
						</div>
						<input type="hidden" name='type' value="O"/>
						</form>
				<div style="margin-top: 1rem !important;">		
					<input type="button" value="편집 및 검색" id="editBtn" class="btn mypageBtn pull-left">
					<input type="button" value="추가" id="addNewBtn" class="btn mypageBtn pull-left">
					<input type="button" style="display:none;" value="검색" id="searchBtn" class="btn mypageBtn pull-left">	
					<input type="button" style="display:none;"  value="선택삭제" id="deleteBtn" class="btn mypageBtn pull-left">
					<input type="button" style="display:none;"  value="취소" id="cancleBtn" class="btn mypageBtn pull-left">
				</div>
                </div>	<!-- end .container -->
            </div>
        </div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">새로운 재료 추가</h4>
				</div>
				<div class="modal-body">
					<form class="p-2 mb-2 bg-body-tertiary border-bottom" id="addOwnForm" action="/mypage/addOwn" method="post">
				      <input type="search" class="form-control"placeholder="Type to filter..." id="autoComplete" name="addIngreName">
				    </form>
				</div>
				<div class="modal-footer">
					<button id='addOwnBtn' type="button" class="btn btn-primary">Register</button>					
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
		</div>
	</div>
	</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/mypageScripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
		
		$("#deleteBtn").click(function(){
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
		
		$("#editBtn").click(function(){
			if($("input[name=chk]").css("display")=="none"){
				$("input[name=chk]").toggle();
				$("#deleteBtn").toggle();
				$("#cancleBtn").toggle();
				$("#chkAll").toggle();				
				$("#editBtn").toggle();
				$("#searchBtn").toggle();
				$("#addNewBtn").toggle();
			}
		});	//end click
		
		$("#cancleBtn").click(function(){
			$("#editBtn").toggle();
			$("#searchBtn").toggle();
			$("input[name=chk]").toggle();
			$("#deleteBtn").toggle();
			$("#cancleBtn").toggle();
			$("#chkAll").toggle();	
			$("#addNewBtn").toggle();
		});	//end click
		
		var addOwnForm = $("#addOwnForm");
		$("#addOwnBtn").on("click",	function(e) {
			e.preventDefault();
			console.log($("input[type='search']").val());
			if($("input[type='search']").val()=="")
				alert("값을 입력하세요");
			else{
				var sameChk = true;
				 $("input[type=checkbox]").each(function(){
					 if($(this).attr("data-name")==$("input[type='search']").val()){
						 alert("이미 있는 재료 입니다.");
						 sameChk=false;
					 }
				});
				 if(sameChk)
					 addOwnForm.submit();
			}
				
		});	//end click
		
		var searchForm = $("#searchForm")
		$("#searchBtn").click(function(){
			var cnt=0;
			   
			   $("input[name=chk]:checked").each(function(){
				   cnt=cnt+1;
			    	console.log("값은 "+ $(this).val());
			   });
			   
			   if(cnt == 0){
				   alert("선택된 재료가 없습니다.");
			   }else{
				   searchForm.submit();
			   }
		});	//end click
		
		if(('<c:out value="${member.id}"/>')=='') {
		    console.log("로그인 안됨");
		    searchForm.find("input[name='type']").remove();
		    searchForm.attr("action","/member/login.do");
		    searchForm.submit();
	  }
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#autoComplete').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "/mypage/autocomplete"   
		         , type : "POST"
		         , dataType: "JSON"
		         , data : {value: request.term}	// 검색 키워드
		         , success : function(data){ 	// 성공
		             response(
		                 $.map(data.resultList, function(item) {
		                     return {
		                    	     label : item.INGRENAME    	// 목록에 표시되는 값
		                           , value : item.INGRENAME 		// 선택 시 input창에 표시되는 값
		                           , idx : item.rn // index
		                     };
		                 })
		             );    //response
		         }
		         ,error : function(){ //실패
		             alert("오류가 발생했습니다.");
		         }
		     });
		}
		,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
		}
		,minLength: 1// 최소 글자수
		,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
		,delay: 100	//autocomplete 딜레이 시간(ms)
		,select : function(evt, ui) { 
	      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
				console.log(ui.item.label);
				console.log(ui.item.idx);
		 }
	});
	
	$(".modal").on("shown.bs.modal", function() {
		  $("#autoComplete").autocomplete("option", "appendTo", ".modal")
	})
});
</script>
<script>
	$(document).ready(function() {
		
		var modal = $(".modal");
		
		$("#addNewBtn").on("click", function(e) {
			$(".modal").modal("show");
		});
		
		var modalCloseBtn = $("#modalCloseBtn");
		modalCloseBtn.on("click", function(e){
				modal.modal("hide");
		});
		var CloseBtn = $(".close");
		CloseBtn.on("click", function(e){
				modal.modal("hide");
		});
		
	});
</script>
    </body>
</html>
<%@include file="../includes/footer.jsp"%>
