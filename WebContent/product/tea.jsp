<%@page contentType="text/html;charset=utf-8"
import="java.util.*, domain.Product"%>
<jsp:include page="../etc/frame-ver2.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<script>

	$(document).on('click', '#btnSave', function(e){

		e.preventDefault();

		

		$("#input").submit();

	});

	

	$(document).on('click', '#btnList', function(e){

		e.preventDefault();

		

		location.href="boardq.do?m=list&cp=1&ps=3";

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

  <div class="site-wrap">





    <div class="site-section mt-5">
      <div class="container">

        <div class="row mb-5">
          <div class="col-12 section-title text-center mb-5">
            <h2 class="d-block">Our Products</h2>
            <p>다양하고 맛있는 차를 BINTEA와 함께 즐기세요!</p>
          </div>
        </div>

        <div class="row">
          
          
          
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	if(list !=null && list.size()!=0){
	    for(Product product : list){
%>
			<div class="col-lg-4 mb-5 col-md-6">
            <div class="wine_v_1 text-center pb-4">
              <a href="product.do?m=detail&p_code=<%=product.getP_code()%>" class="thumbnail d-block mb-4"><img src="<%=product.getP_img()%>" alt="Image" class="img-fluid"></a>

              <div>
                <h3 class="heading mb-1"><a href="product.do?m=detail&p_code=<%=product.getP_code()%>"><%=product.getP_name()%></a></h3>
                <span class="price"><%=product.getP_price()%>원</span>
              </div>
              

              <div class="wine-actions">
                  
                <h3 class="heading-2"><a href="product.do?m=detail&p_code=<%=product.getP_code()%>"><%=product.getP_name()%></a></h3>
                <span class="price d-block"><%=product.getP_price()%>원</span>
                
                <div class="rating">
                  <span class="icon-star"></span>
                  <span class="icon-star"></span>
                  <span class="icon-star"></span>
                  <span class="icon-star"></span>
                  <span class="icon-star-o"></span>
                </div>
                
                <a href="../cart/cart.do?m=PutIntoCart&p_code=<%=product.getP_code()%>" class="btn add"><span class="icon-shopping-bag mr-3"></span> Add to Cart</a>
              </div>
            </div>
            </div>
<%
		}
	}else{
%>
			<tr>
				<td align='center' colspan="5" >데이터가 없음</td>
			</tr>
<%
	}
%>	
          </div>



          

        </div>
      </div>
    </div>

    <div class="hero-2" style="background-image: url('../images/tea_4.jpg');">
     <div class="container">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">BINTEA</span>
            <h2>PRODUCT <br/> REVIEW</h2>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section bg-light">
      <div class="container">
        <div class="owl-carousel owl-slide-3 owl-slide">
        
          <blockquote class="testimony">
            <img src="../images/TEA5.png" alt="Image">
            <p>&ldquo;앞으로 차는 BINTEASHOP 에서만 살꺼같습니다. 너무 맛있고 한번 사먹고 바로 재구매 했네요... 서비스도 좋고 맛도 좋고! 사장님 인심도 좋고 완전 일석삼조!! 최고입니다^^&rdquo;</p>
            <p class="small text-primary">&mdash; 한○○님</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEA3.png" alt="Image">
            <p>&ldquo;향과 맛이 좋습니다. 진한 향과 맛을 원하신다면 부족할지 모르지만 맑고 깨끗한 허브차를 원하신다면 또 세련된 맛을 원하신다면 BINTEASHOP이 탁월한 선택일 겁니다&rdquo;</p>
            <p class="small text-primary">&mdash; 이○○님</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEA4.png" alt="Image">
            <p>&ldquo;방영진 화이팅!파이팅! 정혜원 화이팅!파이팅!&rdquo;</p>
            <p class="small text-primary">&mdash; 이○○님</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEA1.png" alt="Image">
            <p>&ldquo;BINTEASHOP 당신들은 그저 빛!!!!&rdquo;</p>
            <p class="small text-primary">&mdash;리차드빈</p>
          </blockquote>
        
        </div>
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