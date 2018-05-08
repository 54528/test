<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO"/> 
<jsp:setProperty name="dto" property="*"/>



<% 
    boolean flag= dao.create(dto);
   //content = content.replace("\r\n", "<br>");
   
   
   
   
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
font-family: serif;
font-size: 24px;
}
div{
text-align:center;
margin-top:100px;
}

</style>
</head>
<body>
<div>
<%
if(flag){
	out.print("메모를 등록했습니다.");
}else{
	out.print("메모등록이 실패했습니다.");
}
%>
<br>
<button type="button" onclick="location.href='./memoCreate.jsp'">계속등록</button>
<button type="button" onclick="location.href='./list.jsp'">목록</button>


</div>

</body>
</html>
