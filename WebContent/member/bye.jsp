<%@page contentType="text/html;charset=utf-8"%>
<jsp:include page="../etc/frame-ver2.jsp" />
<!DOCTYPE html>
<html lang="en">

<head>
<title>BinTea &mdash; BinTea is New Wave</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Montserrat:400,700|Roboto&display=swap"
	rel="stylesheet">

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
<link href="../css/jquery.mb.YTPlayer.min.css" media="all"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="../css/style.css">

<!-- 위에까지는 템플릿 -->
<script src="../js/trim.js"></script>

<script>
function bye(){
	alert(아쉽게도 ${loginUser.m_name}님은 저희와 함께 가지 못하게 되었습니다.. 수고링~);
}
</script>

</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<div class="site-wrap">


		<div class="site-section bg-light">
			<div class="container">
				<div class="row">

					<div class="col-lg-12">
						<div class="section-title mb-5">
							<h2>회원 탈퇴</h2>
						</div>
						<form name="f" action="member.do?m=leave" method="post">

							<div class="row">
								<div class="col-md-6 form-group">
									<label for="id">정말로 탈퇴하시겠습니까?</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <input
										type="radio" value="Y" /> 예 <input type="radio" value="N" />
									아니오
								</div>

							</div>
							<div class="row">
								<div class="col-md-6 form-group">
									<label for="pwd">탈퇴 이유</label> </br> <select name="reason">
										<option value="===========선택===========">===========선택===========</option>
										<option value="개인정보 보호 및 관리 차원에서">개인정보 보호 및 관리 차원에서</option>
										<option value="재가입을 위해서">재가입을 위해서</option>
										<option value="이벤트 목적으로 한시 사용함">이벤트 목적으로 한시 사용함</option>
										<option value="서비스 기능 불편">서비스 기능 불편</option>
										<option value="사이트 이용에 불편함을 겪어서">사이트 이용에 불편함을 겪어서</option>
									</select>
								</div>

							</div>


							<div class="row">
								<div class="col-12">
									<input type="submit" value="Leave :("
										class="btn btn-primary py-3 px-5" onclick="bye()">
								</div>
							</div>

						</form>
					</div>

				</div>


			</div>
		</div>



		<jsp:include page="../etc/footer.jsp" />


	</div>
	<!-- .site-wrap -->


	<!-- loader -->
	<div id="loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#ff5e15" /></svg>
	</div>

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