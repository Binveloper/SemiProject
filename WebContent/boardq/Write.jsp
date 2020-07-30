<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%
	boolean flag = (Boolean)request.getAttribute("flag");
%>
--%>

	<script language='javascript'>
	if(${flag}){ //자바스크립트의 if
		alert("Q&A를 정상적으로 입력하였습니다.");
	}else{
		alert("알 수 없는 오류로 글쓰기를 실패하였습니다. 다시 시도해 주세요.");
	}
		location.href="boardq.do?m=list&cp=1&ps=3";
	</script>
	s