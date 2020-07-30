<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

    
    <div class="header-top">
      <div class="container">
      <div class="field col-md-6 col-md-offset-3">
      		
      	<c:if test="${!empty loginUser}">
      	<span>${loginUser.m_name}님 접속중</span>
      	&nbsp;&nbsp;
      		<a href="../login/login.do?m=out"><button type="button" class="btn btn-light btn-sm">LOGOUT</button></a>
        </c:if>
           
        <c:if test="${empty loginUser}">
           <a href="../login/login.do?m=form"><button type="button" class="btn btn-light btn-sm">LOGIN</button></a>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <a href="../member/member.do?m=form"><button type="button" class="btn btn-light btn-sm">JOIN</button></a>
       	</c:if>
       </div>
 
        <div class="row align-items-center">
          <div class="col-12 text-center">
            <a href="../index.do" class="site-logo">
              <img src="../images/bintealogosss.png" alt="Image" class="img-fluid">
            </a>
          </div>
          
          
          <a href="#" class="mx-auto d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                class="icon-menu h3"></span></a>
                
                
        </div>
      </div>

      
      <div class="site-navbar py-2 js-sticky-header site-navbar-target d-none pl-0 d-lg-block" role="banner">

      <div class="container">
      
        <div class="d-flex align-items-center">
          
          <div class="mx-auto">
            <nav class="site-navigation position-relative text-left" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mx-auto d-none pl-0 d-lg-block border-none">
                <li><a href="../index.do?m=notice" class="nav-link text-left">NOTICE</a></li>
                <li><a href="../index.do?m=tea" class="nav-link text-left">TEA</a></li>
                <li><a href="../index.do?m=teaware" class="nav-link text-left">TEAWARE</a></li>
                <li><a href="../index.do?m=giftset" class="nav-link text-left">GIFTSET</a></li>
                <li><a href="../index.do?m=qna" class="nav-link text-left">Q&A</a></li>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                              
        <c:if test="${!empty sessionScope.loginUser}">                          
                          <a href="../cart/cart.do?m=cart">
      <img src="http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right01_off.png" 
      onmouseover="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right01_on.png'" 
      onmouseout="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right01_off.png'";
      border=0 align=right alt="" style="max-width:100%"/>
    </a>
	
    <a href="../order/order.do?m=search">
      <img src="http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right02_off.png" 
      onmouseover="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right02_on.png'" 
      onmouseout="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right02_off.png'";
      border=0 align=right alt="" style="max-width:100%"/>
    </a>

    <a href="../member/member.do?m=edit">
      <img src="http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right03_off.png" 
      onmouseover="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right03_on.png'" 
      onmouseout="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right03_off.png'";
      border=0 align=right alt="" style="max-width:100%"/>
      </a>
      
      </c:if>
      
        <c:if test="${empty sessionScope.loginUser}">                          
                          <a href="../login/login.do?m=form">
      <img src="http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right01_off.png" 
      onmouseover="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right01_on.png'" 
      onmouseout="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right01_off.png'";
      border=0 align=right alt="" style="max-width:100%" onclick='alert("로그인이 필요한 서비스입니다.")'/>
    </a>
	
    <a href="../login/login.do?m=form">
      <img src="http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right02_off.png" 
      onmouseover="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right02_on.png'" 
      onmouseout="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right02_off.png'";
      border=0 align=right alt="" style="max-width:100%" onclick='alert("로그인이 필요한 서비스입니다.")'/>
    </a>

    <a href="../login/login.do?m=form">
      <img src="http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right03_off.png" 
      onmouseover="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right03_on.png'" 
      onmouseout="this.src='http://www.tavalon.co.kr/design/tavalon/mandoo/lnb_right03_off.png'";
      border=0 align=right alt="" style="max-width:100%" onclick='alert("로그인이 필요한 서비스입니다.")'/>
      </a>
      
      </c:if>
              </ul>                                                                                                                                                                                                                                                                                  
            </nav>

          </div>
         
        </div>
      </div>

    </div>
    
    </div>
    
    
       