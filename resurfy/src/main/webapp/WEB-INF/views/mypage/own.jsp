<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        
		<link href="../resources/css/pagingButton.css" rel="stylesheet">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/mypageStyles.css" rel="stylesheet" />
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
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage/own">가진 재료</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
				<div class="container-fluid">
					<div class="col-lg-12"><br><br>
						<h1 class="page-header">가진 재료</h1>
					<br><br></div>
					<div class="container">
						<div class="row mb-3 text-center" id="chkAll" style="display:none;">
					      <div class="col-md-2 themed-grid-col">
					      	<input type="checkbox" class="form-check-input flex-shrink-0" id="cbx_chkAll" style="margin-right:30px;">전체 선택
					      </div>
					    </div>
						<div class="row row-cols-1 row-cols-md-3 g-3 text-center">
						<c:forEach items="${list}" var="own">
							<div class="col themed-grid-col" id="ownGroup">
								<input type="checkbox" class="form-check-input flex-shrink-0" style="display:none; margin-right:30px;" name="chk" data-ownno="${own.ownNo}">${own.ingreName}
							</div>
						</c:forEach>
						</div>
				<div style="margin-top: 1rem !important;">		
					<input type="button" value="편집" id="editBtn" class="btn mypageBtn pull-left">
					<input type="button" value="검색" id="searchBtn" class="btn mypageBtn pull-left">	
					<input type="button" style="display:none;"  value="선택삭제" id="deleteBtn" class="btn mypageBtn pull-left">
					<input type="button" style="display:none;"  value="취소" id="cancleBtn" class="btn mypageBtn pull-left">
				</div>
				
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
                <br><br>
				<div id="addNew" style="display:none; margin-top: 1rem !important;">
			      <h3>새로운 재료 추가</h3><br>
			      <div class="dropdown-menu d-block position-static pt-0 mx-0 rounded-3 shadow overflow-hidden w-280px" data-bs-theme="light">
				    <form class="p-2 mb-2 bg-body-tertiary border-bottom">
				      <input type="search" class="form-control" autocomplete="false" placeholder="Type to filter..." id="autoComplete">
				    </form>
				  </div>				  
				  <div style="margin-top: 1rem !important;">		
					<input type="button" value="추가" id="addOwnBtn" class="btn mypageBtn pull-right">
				  </div>				  
				</div>

                </div>	<!-- end .container -->
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		
		$("#searchBtn").click(function(){
			alert("기능 준비중 입니다.");
		});	//end click
		
		$("#editBtn").click(function(){
			if($("input[name=chk]").css("display")=="none"){
				$("input[name=chk]").toggle();
				$("#deleteBtn").toggle();
				$("#cancleBtn").toggle();
				$("#chkAll").toggle();				
				$("#editBtn").toggle();
				$("#searchBtn").toggle();
				$("#addNew").toggle();
			}
		});	//end click
		
		$("#cancleBtn").click(function(){
			$("#editBtn").toggle();
			$("#searchBtn").toggle();
			$("input[name=chk]").toggle();
			$("#deleteBtn").toggle();
			$("#cancleBtn").toggle();
			$("#chkAll").toggle();	
			$("#addNew").toggle();
		});	//end click
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
});
</script>
    </body>
</html>

