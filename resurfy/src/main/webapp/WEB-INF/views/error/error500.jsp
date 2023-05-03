<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.container {
  margin: 25px auto;
  /* 자식 요소(.child)를 중앙 정렬하기 */
  display: flex;
  justify-content: center;
}

.child {
    text-align: center;
}

.child > img{
    display: inline-block;
}
</style>
</head>
<body>
<div class="container">
	<div class="child">
		<img src="/resources/assets/lo_go.png" width='500px'>
		<h3>쇼핑 리스트를 불러오는데 시간이 소요되었습니다.</h3><h3>잠시만 기다려주세요!</h3>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	setTimeout('location.reload()',5000); //5초마다 새로고침
});
</script>
</body>
</html>
<%@include file="../includes/footer.jsp"%>