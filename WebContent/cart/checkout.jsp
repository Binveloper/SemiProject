<%@page contentType="text/html;charset=utf-8"
import="java.util.*, domain.Member, domain.Cart"%>
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
		console.log(q);
		q++;
		console.log(q);
		document.getElementById("quantity"+i).innerTEXT = q;

		var price = document.getElementById("price"+i).innerHTML;
		result = price*q;
		document.getElementById("result"+i).innerText = result;
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
	}
	
	function getResult(){
		var price = document.getElementById("price").innerHTML;
		console.log(price);
		
		var q = document.getElementById("quantity").value;
		console.log(q);
				
		result = q*price;
		console.log(result);
		
		document.getElementById("result").innerText = result;
		//return result;
	}     
                    
</script>       
     
<% 
	Member member = (Member)session.getAttribute("loginUser");

%>

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">


    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-12">
            <div class="bg-light rounded p-3">
              <p class="mb-0">Returning customer? <a href="#" class="d-inline-block">Click here</a> to login</p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-5 mb-md-0">
            <h2 class="h3 mb-3 text-black font-heading-serif">Billing Details</h2>
            <div class="p-3 p-lg-5 border">

              <div class="form-group row">
                <div class="col-md-12">
                  <label for="clientName" class="text-black">Name </label>
                  <input type="text" class="form-control" id="clientName" name="clientName" value="<%=member.getM_name()%>">
                </div>
              </div>
    
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="clientAddress" class="text-black">Address <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="clientAddress" name="clientAddress" value="<%=member.getM_addr()%>">
                </div>
              </div>
    
              <div class="form-group">
                <input type="text" class="form-control" id="clientAddress2" name="clientAddress2" value="<%=member.getM_addr2()%>">
              </div>

    
              <div class="form-group row mb-5">
                <div class="col-md-6">
                  <label for="clientEmail" class="text-black">Email Address <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="clientEmail" name="clientEmail"
                  value="<%=member.getM_email()%>">
                </div>
                <div class="col-md-6">
                  <label for="clientPhone" class="text-black">Phone <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="clientPhone" name="clientPhone" value="<%=member.getM_phone()%>">
                </div>
              </div>
    

              <div class="form-group">
                <label for="c_ship_different_address" class="text-black" data-toggle="collapse"
                  href="#ship_different_address" role="button" aria-expanded="false"
                  aria-controls="ship_different_address"><input type="checkbox" value="1" id="c_ship_different_address">
                  다른 주소로 배송하길 원하시나요?</label>
                <div class="collapse" id="ship_different_address">
                  <div class="py-2">
    
					<div class="form-group row">
                <div class="col-md-12">
                  <label for="clientName" class="text-black">Name </label>
                  <input type="text" class="form-control" id="clientName" name="clientName">
                </div>
              </div>
    
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="clientAddress" class="text-black">Address <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="clientAddress" name="clientAddress" placeholder="Street address">
                </div>
              </div>
    
              <div class="form-group">
                <input type="text" class="form-control" id="clientAddress2" name="clientAddress2" placeholder="Apartment, suite, unit etc. (optional)">
              </div>

    
              <div class="form-group row mb-5">
                <div class="col-md-6">
                  <label for="clientEmail" class="text-black">Email Address <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="clientEmail" name="clientEmail">
                </div>
                <div class="col-md-6">
                  <label for="clientPhone" class="text-black">Phone <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="clientPhone" name="clientPhone" placeholder="Phone Number">
                </div>
              </div>
    
                  </div>
    
                </div>
              </div>
    
              <div class="form-group">
                <label for="orderNotes" class="text-black">Order Notes</label>
                <textarea name="orderNotes" id="orderNotes" cols="30" rows="5" class="form-control"
                  placeholder="Write your notes here..."></textarea>
              </div>
    
            </div>
          </div>
          <div class="col-md-6">
    
            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black font-heading-serif">Coupon Code</h2>
                <div class="p-3 p-lg-5 border">
    
                  <label for="c_code" class="text-black mb-3">Enter your coupon code if you have one</label>
                  <div class="input-group w-75">
                    <input type="text" class="form-control" id="c_code" placeholder="Coupon Code" aria-label="Coupon Code"
                      aria-describedby="button-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary btn-sm rounded px-4" type="button" id="button-addon2">Apply</button>
                    </div>
                  </div>
    
                </div>
              </div>
            </div>
    
            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black font-heading-serif">Your Order</h2>
                <div class="p-3 p-lg-5 border">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                      <th>Product</th>
                      <th>Total</th>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Bioderma <strong class="mx-2">x</strong> 1</td>
                        <td>$55.00</td>
                      </tr>
                      <tr>
                        <td>Ibuprofeen <strong class="mx-2">x</strong> 1</td>
                        <td>$45.00</td>
                      </tr>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                        <td class="text-black">$350.00</td>
                      </tr>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                        <td class="text-black font-weight-bold"><strong>$350.00</strong></td>
                      </tr>
                    </tbody>
                  </table>
    
                  <div class="border mb-3 p-3 rounded">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsebank" role="button"
                        aria-expanded="false" aria-controls="collapsebank">무통장 입금 확인사항</a></h3>
    
                    <div class="collapse" id="collapsebank">
                      <div class="py-2 pl-0">
                        <p class="mb-0"> 신한은행 110-349-337997 (예금주 : 한다솜) 으로 입금바랍니다. 
                        	주문일 다음날 자정까지 유효합니다.</p>
                      </div>
                    </div>
                  </div>
    
                  <div class="border mb-3 p-3 rounded">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsecheque" role="button"
                        aria-expanded="false" aria-controls="collapsecheque">신용카드 결제</a></h3>
    
                    <div class="collapse" id="collapsecheque">
                      <div class="py-2 pl-0">
                        <p class="mb-0">준비 중. (관리자에게 연락 바랍니다. 010-5109-4910)</p>
                      </div>
                    </div>
                  </div>
    
                  <div class="border mb-5 p-3">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsepaypal" role="button"
                        aria-expanded="false" aria-controls="collapsepaypal">외상</a></h3>
    
                    <div class="collapse" id="collapsepaypal">
                      <div class="py-2 pl-0">
                        <p class="mb-0">외상은 없습니다.ㅋ</p>
                      </div>
                    </div>
                  </div>
    
                  <div class="form-group">
                    <button class="btn btn-primary btn-lg btn-block" onclick="window.location='thankyou.html'">주문하기</button>
                  </div>
    
                </div>
              </div>
            </div>
    
          </div>
        </div>
        <!-- </form> -->
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