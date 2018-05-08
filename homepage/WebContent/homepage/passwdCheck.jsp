<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %> 
<%
    
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    
%>
    
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f){
	if(f.passwd.value==""){
		alert("패스워드를 입력하세요");
        f.passwd.focus();
        return false;
	}
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>
<!-- *********************************************** -->
 
<DIV class="title">본인 확인</DIV>

<div class="content">
<FORM name='frm' 
method='POST' 
action='./passwdUpdateForm.jsp'
onsubmit = "return incheck(this)"
>
<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
기존의 비밀번호를 입력해 주십시오<br><br>
  <TABLE>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='확인' onclick="passwdUpdateForm()" >
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </div>
 
<!-- *********************************************** -->
<%-- <jsp:include page="/menu/bottom.jsp" flush="false"/> --%>
</body>
<!-- *********************************************** -->
</html> 
