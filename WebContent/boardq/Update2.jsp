<%@page contentType="text/html;charset=utf-8"%>

<%-- 
<%
	boolean flag = (Boolean)request.getAttribute("flag");
%>
--%>

	<script language='javascript'>
	if(${flags}){ //자바스크립트의 if
		alert("정상적으로 수정하였습니다");
	}else{
		alert("알 수 없는 오류로 수정을 실패하였습니다.");
	}
		location.href="boardq.do?m=list&cp=1&ps=3";
	</script>