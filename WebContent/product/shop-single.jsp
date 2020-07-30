<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, domain.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../etc/frame-ver2.jsp"/>
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
  
<%	

    ArrayList<Product> contents = (ArrayList<Product>)request.getAttribute("contents");
    if(contents !=null && contents.size()!=0){
        for(Product product : contents){
%>
    
    <div class="site-section bg-primary py-5 page-title-wrap mt-5">
      <div class="container">

      
        <h1><%=product.getP_name()%></h1>
      </div>
    </div>

    <div class="site-section mt-5">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="owl-carousel hero-slide owl-style">
              <img src="<%=product.getP_img()%>" alt="Image" class="img-fluid">
              <img src="<%=product.getP_img()%>" alt="Image" class="img-fluid">
              <img src="<%=product.getP_img()%>" alt="Image" class="img-fluid">
            </div>
          </div>
          <div class="col-lg-5 ml-auto">
            <h2 class="text-primary"><%=product.getP_name()%></h2>
            <p><%=product.getP_story()%></p>

            <div class="mb-5">

    
            </div>
            <p><a href="../cart/cart.do?m=PutIntoCart&p_code=<%=product.getP_code()%>" class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary">Add To Cart</a></p>


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


          </div>
        </div>
        
      </div>
      
      
      <div>
      <p>
      </p>
      <p>
      </p>
      </div>
      
      
    <!-- 여기서부터 -->      

        <div class="info" align="center">
        <%	

    ArrayList<Product> content = (ArrayList<Product>)request.getAttribute("contents");
    if(content !=null && content.size()!=0){
        for(Product product : content){
%>   

<img src='<%=product.getP_info()%>' style="max-width: 1100px"align="center">

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
<!-- 여기까지 -->
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