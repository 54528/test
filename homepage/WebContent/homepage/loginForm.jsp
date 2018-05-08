<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %> 

<%

/*----쿠키설정 내용시작----------------------------*/
String hid = "";         //ID저장 여부 변수
String hid_val = "";     //ID값

Cookie[] cookies = request.getCookies();
Cookie cookie = null;

if(cookies!=null){
	for(int i=0; i<cookies.length; i++){
		cookie = cookies[i];
	
	if(cookie.getName().equals("hid")){
		hid = cookie.getValue();
	}else if(cookie.getName().equals("hid_val")){
		hid_val = cookie.getValue();
    }
  }
}
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
table{
  margin:auto;
}
div{
  text-align:center;
}
</style> 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>
<!-- *********************************************** -->
 
<DIV class="title">아이디와 비밀번호를 입력해주세요</DIV>
 
<FORM name='frm' method='POST' action='./loginProc.jsp'>
  <TABLE class='table'>
    <TR>
      <TH>아이디</TH>
      <TD>
      <input type="text" name="id" value="<%=hid_val %>" required>
      <%
      if(hid.equals("Y")){    //만약에 저장된ID(Y)라면
      %>
        <input type="checkbox" name="hid" value='Y' checked='checked'> ID저장	
      <%
      }else{%>
        <input type="checkbox" name="hid" value='Y'> ID저장
      <%    
      }
      %>
      </TD>
    </TR>
    
    <tr>
    <th>비밀번호</th>
    <td>
       <input type = "password" name="passwd" size="20" required></td>
    </tr>   
    
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='로그인'>
    <input type='button' value='아이디 찾기'>
    <input type="button" value="비밀번호 찾기">
    <br>
    <br>
    <input type="button" onclick="history.back()" value="뒤로가기">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<%-- <jsp:include page="/menu/bottom.jsp" flush="false"/> --%>
</body>
<!-- *********************************************** -->
</html> 
