<%@page contentType="text/html;charset=utf-8"
import="java.util.*, domain.BoardQ"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../etc/frame-ver2.jsp"/>


<!DOCTYPE html>
<html>
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
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">



<style>

body {

  padding-top: 70px;

  padding-bottom: 30px;

}
.board_title {

	font-weight : 900;

	font-size : 30pt;
	
	color : #ffba59;

	margin : 10pt;

}

.board_info_box {

	color : #6B6B6B;

	margin : 10pt;

}

.board_author {

	font-size : 15pt;

	margin-right : 10pt;


}

.board_date {

	font-size : 15pt;


}

.board_content {

	color : #444343;

	font-size : 12pt;

	margin : 10pt;

}

.board_tag {

	font-size : 11pt;

	margin : 10pt;

	padding-bottom : 10pt;

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
           
            
            
<!-- 수정 시작 -->

<!-- jQuery -->

<script>

	$(document).on('click', '#btnList', function(){

		location.href = "boardq.do?m=list&cp=1&ps=3";

	});

</script>





<%	

    ArrayList<BoardQ> contents = (ArrayList<BoardQ>)request.getAttribute("contents");
    if(contents !=null && contents.size()!=0){
        for(BoardQ boardq : contents){
%>
			<article>

		<div class="container" role="main">


			<div class="bg-white rounded shadow-sm">

				<div class="board_title"><c:out value="<%=boardq.getSubject()%>"/></div>
				<div class="col-md-13"><hr /></div>

				<div class="board_info_box">

					<span class="board_author"><c:out value="<%=boardq.getWriter()%>"/>, </span><span class="board_date"><c:out value="<%=boardq.getDate()%>"/></span>

				</div>

				<div class="board_content"><%=boardq.getContent()%></div>

			</div>

			

			<div style="margin-top : 20px" align='right'>
				<c:if test="${!empty sessionScope.Admin}">
				<a href='boardq.do?m=update&seq=<%=boardq.getSeq()%>'><input type="button" class="btn pull-left" id="btnUpdate" value="수정"></a>

				<a href='boardq.do?m=delete&seq=<%=boardq.getSeq()%>'><input type="button" class="btn pull-right" id="btnDelete" value="삭제"></a>
				</c:if>
				<button type="button" class="btn pull-center" id="btnList">목록</button>

			</div>

		</div>
<%
		}
	}else{
%>
			<tr>
				<td align='center' colspan="4" >데이터가 없음</td>
			</tr>
<%
	}
%>
		

	</article>


    
</div>

</div>
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