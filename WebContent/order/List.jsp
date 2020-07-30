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


</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">
    

    <div class="hero-2" style="background-image: url('../images/tea_2.jpg');">
     <div class="container">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">BINTEA</span>
            <h2>ORDERS</h2>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section bg-light">
      <div class="container">
       
        <div class="row">

          <div class="col-lg-12">
            <div class="section-title mb-5">
              <h2>주문 내역</h2>
            </div>
            </div>
            </div>
            </div>
            
   <article>
<div class="container">

<div class="table-responsive">

<table class="table table-striped">

		<colgroup>

			<col style="width:auto;" />

			<col style="width:auto;" />

			<col style="width:auto;" />

			<col style="width:auto;" />

			<col style="width:auto;" />

		</colgroup>

		<thead>

			<tr align='center'>
				<th>날짜<br/>[주문번호]</th>

				<th>상품 정보</th>

				<th>수량</th>

				<th>결제 금액</th>
				
				<th>주문 상태</th>
			</tr>

		</thead>
		<tbody>

			<c:if test = "${empty UserOrders}">
		<tr>
			<td align='center' colspan="6" >데이터가 없음</td>
		</tr>
	</c:if>
	<c:forEach items="${UserOrders}" var ="order">
            <tr>
            <td align='center'>${order.b_date}<br/>[${order.b_date}${order.o_seq}]</td>
            <td align='center'>${order.p_name} 외 ${order.o_amount-1}개</td>
            <td align='center'>${order.o_amount}</td>
            <td align='center'>${order.o_total}</td>
            <td align='center'>입금 대기중</td>
            </tr>
	</c:forEach>
		</tbody>
	</table>




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