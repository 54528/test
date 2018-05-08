<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %> 
<jsp:useBean id="dao" class="homepage.HomepageDAO"/>
<jsp:useBean id="dto" class="homepage.HomepageDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    
    boolean flag = dao.mypass(id,passwd);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(){
	var url = "./read.jsp";
	url += "?id=<%=id%>";
	location.href = url;
}

</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
div{
  align:center;
}
title{
  align:center;
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>
<!-- *********************************************** -->
<%if(flag){ %>
<DIV class="title">비밀번호 수정</DIV>
 
<FORM name='frm' 
method='POST' 
action='./passwdUpdateProc.jsp'
enctype="multipart/form-data">
<input type='hidden' name=id value="<%=id %>">
<input type='hidden' name=password value="<%=passwd %>">
  <TABLE>
    <TR>
      <TH>변경할 새  비밀번호를 입력하세요</TH>
      <TD>
      <input type="text" name="repasswd" >
      </TD>
      </tr>
      
      <tr>
      <TH>한번 더 입력해주세요</TH>
      <td>
      <input type="text" name="repasswd" >
      </td>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
<%}else{ %> 
<div class="title">비밀번호가 틀렸습니다.</div>
<div class="bottom">
<input type="button" value="뒤로가기" onclick="history.back()">
<input type="button" value="목록으로" onclick="read()">
</div>
<%}%> 

<!-- *********************************************** -->
<%-- <jsp:include page="/menu/bottom.jsp" flush="false"/> --%>
</body>
<!-- *********************************************** -->
</html> 
