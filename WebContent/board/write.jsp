<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="domain.Admin"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/jquery-ui.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/jquery.countdown.min.js"></script>
  <script src="../js/bootstrap-datepicker.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.fancybox.min.js"></script>
  <script src="../js/jquery.sticky.js"></script>
  <script src="../js/jquery.mb.YTPlayer.min.js"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">



<title>BINTEASHOP 공지사항</title>



<script>

	$(document).on('click', '#btnSave', function(e){

		e.preventDefault();

		

		$("#form").submit();

	});

	

	$(document).on('click', '#btnList', function(e){

		e.preventDefault();

		

		location.href="${pageContext.request.contextPath}/board/getBoardList";

	});

</script>

<style>

body {

  padding-top: 70px;

  padding-bottom: 30px;

}



</style>

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

	<article>

		<div class="container" role="main">

			<h2>BINTEASHOP 공지사항</h2>

			<form name="form" id="form" role="form" method="post" action="board.do?m=writeOk">

				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="title" id="title"  required>

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

					<input readOnly type="text" class="form-control" name="reg_id" id="reg_id" value="관리자" >

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="content" id="content" required></textarea>

				</div>

				

				<div class="mb-3">

					<label for="tag">작성날짜</label>

					<input readOnly type="text" class="form-control" name="tag" id="tag">

				</div>

			<div >
				<c:if test="${!empty sessionScope.Admin}">
				<!-- 
				<input type="button" class="btn btn-sm btn-primary" value ="저장" onclick="check()">
				 -->
				<input type="submit" class="btn btn-sm btn-primary" value="저장" >
				
				
				</c:if>
				<a href="board.do" class="btn btn-sm btn-primary id="btnList">목록</button></a>
			
				
			</div>

			</form>

			

		</div>

	</article>
	
	<script>
	    function check(){
	    	if(form.title.value == ""){
	    		alert("제목이 비었어요");
	    		form.title.focus();
	    		return false;
	    	}else if(form.content.value == ""){
		    	alert("내용이 비었어요");
		    	form.content.focus();
		    	return false;
	    	}else{
		        form.submit();
	        }
	    }
	</script>

</body>

</html>
