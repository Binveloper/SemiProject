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
	ArrayList<Product> listTW = (ArrayList<Product>)request.getAttribute("listTW");
	if(listTW !=null && listTW.size()!=0){
	    for(Product product : listTW){
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
            <img src="../images/TEAWARE8.png" alt="Image">
            <p>&ldquo;한옥 '처마'의 곡선에서 모티브를 얻어 제작한 토림도예이다보니 부드러운 곡선을 갖고 있어요... 처마의 곡선은 직선에서 살짝 휘어진 정도여서 어떤 공간에 두어도 분위기를 해치지 않고 잘 어울리는거같아서 너무좋네요!! 강추입니다&rdquo;</p>
            <p class="small text-primary">&mdash;서○○</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEAWARE2.png" alt="Image">
            <p>&ldquo;역시 믿고 사먹는 BINTEASHOP 이네요 ^^ 찰영할때 종종 먹는데 그 맛을 잊을수가 없어 계속 찾게 되네요 &rdquo;</p>
            <p class="small text-primary">&mdash; 준성맘:hearts:</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEAWARE6.png" alt="Image">
            <p>&ldquo;한번 떨어트렸는데도 멀쩡해서 더욱 마음에 들었어요 깔별로 모으고 싶어서 그린도 구입했어요 화이트에 손이 더 가네요&rdquo;</p>
            <p class="small text-primary">&mdash; 조○○</p>
          </blockquote>
          <blockquote class="testimony">
            <img src="../images/TEAWARE5.png" alt="Image">
            <p>&ldquo;사랑스러운 파스텔 컬러와 유려한 라인이 매력적인 티팟으로 내부에 차 거름망이 있어 편리하게 사용할 수 있어서 너무 좋았오요!&rdquo;</p>
            <p class="small text-primary">&mdash; 방○○</p>
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