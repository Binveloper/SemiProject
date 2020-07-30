<%@page contentType="text/html;charset=utf-8"
import="java.util.*, domain.Cart"%>
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

<!-- 계산 식 -->
                   
<script>
    window.onload = function() {
   		//getResult();
    }       
    
	
	
	function add(i){
		var q = document.getElementById("quantity"+i).value;
		//console.log(q);
		q++;
		//console.log(q);
		document.getElementById("quantity"+i).innerTEXT = q;

		var price = document.getElementById("price"+i).innerHTML;
		result = price*q;
		document.getElementById("result"+i).innerText = result;
		return result;
	}
	
	function minus(i){
		var q = document.getElementById("quantity"+i).value;
		console.log(q);
		q--;
		console.log(q);
		document.getElementById("quantity"+i).innerTEXT = q;
		
		var price = document.getElementById("price"+i).innerHTML;
		result = price*q;
		document.getElementById("result"+i).innerText = result;
		return result;
	}
	
	function getTotal(i){
		var total = minus(i);
		document.getElementById("total").innerText = total;
	}     
                    
</script>       
     


</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">



          
   <div class="site-section  pb-0">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-7 section-title text-center mb-5">
            <h2 class="d-block">Cart</h2>
          </div>
        </div>
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Product</th>
                    <th class="product-price">Price</th>
                    <th class="product-quantity">Quantity</th>
                    <th class="product-total">Total</th>
                    <th class="product-remove">Remove</th>
                  </tr>
                </thead>
                <tbody>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cart");
	long total = 0;
	if(cartList !=null && cartList.size()!=0){
		int i=0;
		
	    for(Cart cart : cartList){
%>      

                  <tr align="center">
                    <td class="product-thumbnail">
                      <img src="<%=cart.getP_img()%>" alt="Image" class="img-fluid">
                    </td>
                    <td class="product-name">
                      <h2 class="h5 cart-product-title text-black"><%=cart.getP_name()%></h2>
                    </td>
                    <td><span id="price<%=i%>"><%=cart.getP_price()%></span><span>원</span></td>
                    <td>
                      <div class="input-group mb-4" style="max-width: 120px;">
                        <div class="input-group-prepend">
                          <button class="btn btn-outline-primary js-btn-minus" type="button" onclick="minus(<%=i%>); getTotal(<%=i%>)">&minus;</button>
                        </div>
                        <input type="text" id="quantity<%=i%>"class="form-control text-center border mr-0" value="<%=cart.getP_amount() %>" placeholder=""
                          aria-label="Example text with button addon" aria-describedby="button-addon1">
                        <div class="input-group-append">
                          <button class="btn btn-outline-primary js-btn-plus" type="button" onclick="add(<%=i%>); getTotal(<%=i%>)">&plus;</button>
                        </div>
                      </div>
                    </td>

                    <td><span id="result<%=i%>"><%=cart.getP_price()*cart.getP_amount() %></span></td>
                    <td><a href="cart.do?m=cleanProduct&code=<%=cart.getP_code()%>" class="btn btn-primary height-auto btn-sm">X</a></td>
                  </tr>
                  <span onload=""></span>
<%
		i++;
		total+=cart.getP_price()*cart.getP_amount();
		}
	}else{
%>
			<tr>
				<td align='center' colspan="6" >장바구니가 비어있습니다.</td>
			</tr>
 <%
	
	}
%>	  
                </tbody>
              </table>
            </div>
          </form>
        </div>
    
      </div>
    </div>

    <div class="site-section pt-5 bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
                <button class="btn btn-primary btn-md btn-block">장바구니 새로고침</button>
              </div>
              <div class="col-md-6">
                <button class="btn btn-outline-primary btn-md btn-block">계속 쇼핑하기</button>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">쿠폰</label>
                <p>쿠폰이 있으시면, 쿠폰 코드를 입력해주세요.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
              </div>
              <div class="col-md-4">
                <button class="btn btn-primary btn-md px-4">쿠폰 적용</button>
              </div>
            </div>
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">장바구니 합계</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">할인 금액</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">0</strong>
                  </div>
                </div>
                  
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">합계</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black"><span id="total"></span></strong>
                  </div>
                </div>
   
                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-primary btn-lg btn-block" onclick="window.location='../order/order.do?m=checkout'">구매하러 가기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
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