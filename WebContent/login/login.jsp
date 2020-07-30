<%@page contentType="text/html;charset=utf-8"%>
<jsp:include page="../etc/frame-ver2.jsp"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>BinTea &mdash; BinTea is New Wave</title>
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
			pass = checkByteLen(idval, 50);
			if(!pass){
				alert("ID가 너무 깁니다.");
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
				alert("비밀번호가 너무 깁니다.");
				f.pwd.focus();
				return false;
			}
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
	</script>
	<!-- 추가한 부분 (로그인 확인 js)-->

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" onload="document.f.id.focus()">

  <div class="site-wrap">


    <div class="site-section bg-light">
      <div class="container">
        <div class="row" >
			<div class="row mb-5">
          <div class="col-md-12">
            <div class="bg-light rounded p-3">
              <p class="mb-0">아이디가 없으세요? <a href="../member/member.do?m=form" class="d-inline-block"><b>여기</b></a>를 눌러 BinTea와 함께하세요!</p>
            </div>
          </div>
       		 </div>
          <div class="col-lg-12">
            <div class="section-title mb-5">
              <h2>Login</h2>
            </div>
            <form name="f" action="login.do?m=check" method="post">
              
                  <div class="row">
                      <div class="col-md-6 form-group">
                          <label for="id">ID</label>
                         
                          <input class="form-control form-control-lg" name="id" align="center" size="20" align="center" onkeydown="enterCheck(this)">
                      </div>

                  </div>
                  <div class="row">
                      <div class="col-md-6 form-group">
                          <label for="pwd">Password</label>
   
                      	<input class="form-control form-control-lg" name="pwd" size="20" align="center" type="password" onkeydown="enterCheck(this)">
                      </div>
                     
                  </div>


                  <div class="row">
                      <div class="col-12">
                          <input type="button" value="Login" class="btn btn-primary py-3 px-5" onkeydown="check()" onclick="check()">
                      </div>
                  </div>
              
              
            </form>
            <br/> <br/>
  			<p class="mb-0">
              <a href="../member/member.do?m=findID"><b>ID 찾기</b></a>
			</p>
            
    		<p class="mb-0">
              <a href="../member/member.do?m=findPWD"><b>비밀번호 찾기</b></a>
            </p>
            
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