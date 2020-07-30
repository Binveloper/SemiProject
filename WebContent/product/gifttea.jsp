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
	ArrayList<Product> listGift = (ArrayList<Product>)request.getAttribute("listGift");
	if(listGift !=null && listGift.size()!=0){
	    for(Product product : listGift){
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
            <img src="../images/TEAGIFTSET1.png" alt="Image">
            <p>&ldquo;선물용으로 딱인것 같아요!! 안에 것도 각각 비닐포자 유대있어서 좋았어요!!&rdquo;</p>
            <p class="small text-primary">&mdash; 김○○</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEAGIFTSET3.png" alt="Image">
            <p>&ldquo;선물용으로 구입했는데 구성도 좋고 포장박스 너무 예뻐서 선물받는 분이 좋아하실꺼같아요 ㅎㅎ&rdquo;</p>
            <p class="small text-primary">&mdash; 한○○</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEAGIFTSET7.png" alt="Image">
            <p>&ldquo;포장이 깔끔하고 샘플로 준 차 먹다가 너무 맛있어요!!!&rdquo;</p>
            <p class="small text-primary">&mdash; 시루맘☆</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEAGIFTSET4.png" alt="Image">
            <p>&ldquo;다양한 차를 접할수 있어서 선물용으로 정말 좋은거같습니다!!!&rdquo;</p>
            <p class="small text-primary">&mdash; 예빈엄마:hearts:</p>
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