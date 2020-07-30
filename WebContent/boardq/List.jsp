<%@page contentType="text/html;charset=utf-8"
import="java.util.*, domain.BoardQ, boardQ.vo.ListResult"%>
<jsp:include page="../etc/frame-ver2.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>BINTEA &mdash; Enjoy your Tea</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  
  <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Montserrat:400,700|Roboto&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="../fonts/icomoon/style.css">

  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/jquery-ui.css">
  <link rel="stylesheet" href="../css/owl.carousel.min.css">
  <link rel="stylesheet" href="../css/owl.theme.default.min.css">
  <link rel="stylesheet" href="../css/owl.theme.default.min.css">

  <link rel="stylesheet" href="../css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="../css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="../css/aos.css">
  <link href="../css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">

  <link rel="stylesheet" href="../css/style.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- 위의 자바스크립트는 게시판을 위한 링크 -->
	<style>
	
	body {
	
	padding-top: 70px;
	
	padding-bottom: 30px;
	
	}
	
	.subin{
	color : #444343;
	
	}

</style>


</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">
    

    <div class="hero-2" style="background-image: url('../images/tea_2.jpg');">
     <div class="container">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">BINTEA</span>
            <h2>CUSTOMER SERVICE</h2>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section bg-light">
      <div class="container">
       
        <div class="row">

          <div class="col-lg-12">
            <div class="section-title mb-5">
              <h2>Q&A BOARD</h2>
            </div>
            </div>
            </div>
            </div>
            
   <article>
<div class="container">

<div class="table-responsive">

<table class="table table-striped">

		<colgroup>

			<col style="width:5%;" />

			<col style="width:auto;" />

			<col style="width:15%;" />

			<col style="width:10%;" />

			<col style="width:10%;" />

		</colgroup>

		<thead>

			<tr align='center'>
				<th>NO</th>

				<th>글제목</th>

				<th>작성자</th>

				<th>작성일</th>

				<th>조회수</th>
			</tr>

		</thead>
		<tbody class="subin">

			<c:if test = "${empty listResult.list}">
		<tr>
			<td align='center' colspan="5" >아직 작성된 글이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach items="${listResult.list}" var ="boardq">
            <tr>
            <td align='center'>
            ${boardq.seq}</td>
            <td align='center'><a href='boardq.do?m=content&seq=${boardq.seq}'>${boardq.subject}</a></td>
            <td align='center'>${boardq.writer}</td>
            <td align='center'>${boardq.date}</td>
            <td align='center'>${boardq.count}</td>
            </tr>
            </div>
</c:forEach>
		</tbody>
	</table>
 <c:if test="${!empty sessionScope.loginUser}"> 
			<a href='boardq.do?m=writeH'><input type="button" class="btn btn-primary float-right" id="btnWriteForm" value="글쓰기"></a>
</c:if>

<font color='gray' size='3' face='나눔고딕'>
    <!-- (총페이지수 : ${listResult.totalPageCount}) -->
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<c:forEach begin="1" end="${listResult.totalPageCount}" var="i" >
        <a href='boardq.do?cp=${i}'>
        <c:choose>
        	<c:when test="${i==listResult.currentPage}">
            <strong>${i}</strong>
			</c:when>
			<c:otherwise>
            ${i}
            </c:otherwise>
        </c:choose>
    	</a>

  </c:forEach>
    <!-- ( TOTAL : ${listResult.totalPageCount}) -->
    
  
    
       Page Size 
    <select id="psId" name="ps" onchange="f(this)">
	<c:choose>
		<c:when test="${listResult.pageSize == 3}">
			    <option value="3" selected>3</option>
		       <option value="5">5</option>
		       <option value="10">10</option>
		</c:when>
		<c:when test="${listResult.pageSize == 5}">
			   <option value="3">3</option>
		       <option value="5" selected>5</option>
		       <option value="10">10</option>
		</c:when>	
		<c:otherwise>
				<option value="3">3</option>
		       <option value="5">5</option>
		       <option value="10" selected>10</option>
		</c:otherwise>
	</c:choose>
    </select>
    
    <script language="javascript">
       function f(select){
           //var el = document.getElementById("psId");
           var ps = select.value;
           //alert("ps : " + ps);
           location.href='boardq.do?m=list&ps='+ps;
       }
    </script>
    
</font>
</div>
	</div>
</article>            
            
            </div>
           

            
<!-- 수정 시작 -->








	

    
<jsp:include page="../etc/footer.jsp"/>
  </div>
  <!-- .site-wrap -->


  <!-- loader -->
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#ff5e15"/></svg></div>

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




  <script src="../js/main.js"></script>

</body>

</html>