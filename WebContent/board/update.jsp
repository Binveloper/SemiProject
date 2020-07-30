<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="domain.Admin"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>



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

<body>

	<article>

		<div class="container" role="main">

			<h2>BINTEASHOP 공지사항</h2>

			<form name="form" id="form" role="form" method="post" action="board.do?m=updateOk&seq=${board.b_seq}">

				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="title" id="title" value="${board.b_subject}" required>

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

					<input readOnly type="text" class="form-control" name="reg_id" id="reg_id" value="관리자">

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="content" id="content" required>${board.b_content}</textarea>

				</div>

				

				<div class="mb-3">

					<label for="tag">작성날짜</label>

					<input readOnly type="text" class="form-control" name="tag" id="tag" value="${board.b_date}">

				</div>

			<div >
				<c:if test="${!empty sessionScope.Admin}">
				<input type="submit" class="btn btn-sm btn-primary" value ="저장">
				
				
				</c:if>
				<a href="board.do" class="btn btn-sm btn-primary id="btnList">목록</button></a>
			
				
			</div>

			</form>

			

		</div>

	</article>

</body>

</html>
