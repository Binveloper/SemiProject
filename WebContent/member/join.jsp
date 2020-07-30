<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../etc/frame-ver2.jsp" />
<!DOCTYPE html>
<html lang="en">

<head>
<title>BinTea &mdash; Enjoy Your Tea</title>
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
<script language="javascript"> 
	function check(){
		var idval = f.id.value;
		idval = trim(idval);
		if(idval.length == 0){
			alert("ID를 입력하세요.");

			f.id.value = "";
			f.id.focus();
			return false;
		}else{
			pass = checkByteLen(idval, 20);
			if(!pass){
				alert("ID가 너무 깁니다. (영어 소문자/숫자 10자이내)");
				f.id.focus();
				return false;
			}
		}
		
		var pwdval = f.pwd.value;
		pwdval = trim(pwdval);
		if(pwdval.length == 0){
			alert("비밀번호를 입력하세요.");
			f.pwd.value = "";
			f.pwd.focus();
			return false;
		}else{
			pass = checkByteLen(pwdval, 30);
			if(!pass){
				alert("비밀번호가 너무 깁니다. (영어 소문자/숫자 15자이내)");
				f.pwd.focus();
				return false;
			}
		}
		
		var pwdcheck = f.pwdcheck.value;
		pwdcheck = trim(pwdcheck);
		if(pwdcheck.length == 0){
			alert("비밀번호 확인란을 입력하세요.");
			f.pwdcheck.value = "";
			f.pwdcheck.focus();
			return false;
		}
		
		if(pwdcheck!=pwdval){
			alert("비밀번호 입력이 일치하지 않습니다.");
			return false;
		}
		
		var nameval = f.name.value;
		nameval = trim(nameval);
		if(nameval.length == 0){
			alert("이름을 입력하세요.");

			f.name.value = "";
			f.name.focus();
			return false;
		}else{
			pass = checkByteLen(nameval, 20);
			if(!pass){
				alert("이름이 너무 깁니다. (5자이내)");
				f.name.focus();
				return false;
			}
		}
		
		var birthval = f.birth.value;
		birthval = trim(birthval);
		if(birthval.length == 0){
			alert("생년월일을 입력하세요.");

			f.birth.value = "";
			f.birth.focus();
			return false;
		}else{
			pass = checkByteLen(birthval, 10);
			if(!pass){
				alert("생년월일이 너무 깁니다. (6자이내)");
				f.birth.focus();
				return false;
			}
		}
		
		var postalcodeval = f.postalcode.value;
		postalcodeval = trim(postalcodeval);
		if(postalcodeval.length == 0){
			alert("우편번호를 입력하세요.");

			f.postalcode.value = "";
			f.postalcode.focus();
			return false;
		}
		
		var addrval = f.addr.value;
		addrval = trim(addrval);
		if(addrval.length == 0){
			alert("주소를 입력하세요.");

			f.addr.value = "";
			f.addr.focus();
			return false;
		}
		
		
		
		

		f.submit();
	}

	function checkByteLen(str, size){
	    var byteLen = getByteLen(str);
		if(byteLen <= size){
			return true;
		}else{
			return false;
		}
	}
	function getByteLen(str){
	   return str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
	}

	function enterCheck(elm){
		if(event.keyCode == 13){
			if(elm == f.id){
				f.pwd.focus();
			}else{
				check();
			}
		}
	}
	
	function idCheck(){ //새창 만들기 
		window.open("idCheckForm.jsp", "idwin", "width=300, height=190");
		
		var f=document.getElementById("id");
		f.readOnly = false;
	}

	</script>
<!-- 추가한 부분 (로그인 확인 js)-->
<!-- 카카오맵 도로명주소 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	function readOnly() {
	   var f=document.getElementById("addr2");
	   f.readOnly = false;
	}

    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr2").value = extraAddr;
                
                } else {
                    document.getElementById("addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postalcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                readOnly();
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
<!-- 화이팅 -->

</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<div class="site-wrap">


		<div class="site-section bg-light">
			<div class="container">

				<div class="row">
					<div class="col-md-6 mb-5 mb-md-0">
						<h2 class="h3 mb-3 text-black font-heading-serif">JOIN</h2>
						<div class="p-3 p-lg-5 ">

							<form name="f" action="member.do?m=join" method="post">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="id" class="text-black">아이디<span
											class="text-danger">*</span></label> <input readOnly
											class="form-control" id="id" name="id"
											placeholder="영어 소문자/숫자 10자이내">

									</div>
								</div>
								<div class="form-group">
									<input type="button" value="ID 중복확인" onclick="idCheck()">
								</div>
								<div class="form-group row">
									<div class="col-md-12">
										<label for="pwd" class="text-black">비밀번호 <span
											class="text-danger">*</span></label> <input class="form-control"
											id="pwd" name="pwd" type="password"
											placeholder="영어,숫자,특수문자(<, >, (, ), #, ', /, | 제외) 10자이내">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-12">
										<label for="pwdcheck" class="text-black">비밀번호 확인 <span
											class="text-danger">*</span></label> <input class="form-control"
											id="pwdcheck" name="pwdcheck" type="password">
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_state_country" class="text-black">이름 <span
											class="text-danger">*</span></label> <input class="form-control"
											id="name" name="name">
									</div>
									<div class="col-md-6">
										<label for="c_postal_zip" class="text-black">생년월일 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="birth" name="birth"
											placeholder="ex) 1990-03-13" data-provide="datepicker"
											data-date-format="yyyy-mm-dd">
									</div>
								</div>

								<div class="form-group row mb-5">
									<div class="col-md-6">
										<label for="c_email_address" class="text-black">이메일</label> <input
											type="text" class="form-control" name="email"
											placeholder="ex) mail@email.com">
									</div>
									<div class="col-md-6">
										<label for="c_phone" class="text-black">전화번호 </label> <input
											type="text" class="form-control" name="phone"
											placeholder="ex) 010-1234-5678">
									</div>
								</div>


								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_address" class="text-black">주소 <span
											class="text-danger">*</span></label>

										<div class="form-group">
											<input type="text" class="form-control" id="postalcode"
												name="postalcode" placeholder="우편번호" onclick="Postcode()">
										</div>

										<input readOnly type="text" class="form-control" id="addr"
											name="addr" placeholder="도로명주소">
									</div>
								</div>

								<div class="form-group">
									<input readOnly type="text" class="form-control" id="addr2"
										name="addr2" placeholder="상세주소">
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<input type="button" value="Join"
											class="btn btn-primary py-3 px-5" onkeydown="check()"
											onclick="check()">
									</div>
								</div>

							</form>
						</div>



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