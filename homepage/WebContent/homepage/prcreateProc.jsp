<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %>
<jsp:useBean id="dao" class="homepage.HomepageDAO"/>
<jsp:useBean id="dto" class="homepage.HomepageDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
    UploadSave upload = new UploadSave(request,-1,-1,tempDir); 
    String id = upload.getParameter("id");
    String email = upload.getParameter("email");
    
    String str = "";
    
    if(dao.duplicateId(id)){
    	str = "중복된 아이디 입니다. 아이디를 확인해주세요";	
    }else if(dao.duplicateEmail(email)){
    	str = "중복된 이메일 입니다. 이메일을 확인해주세요";
    }else{
    	request.setAttribute("upload", upload);    	
%>
        <jsp:forward page = "/homepage/createProc.jsp"/>
<%   
    return;
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
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>
<!-- *********************************************** -->
 
<DIV class="title">아이디 및 이메일 중복확인</DIV>
<div class="content">
<%=str %>
</div> 

<DIV class='bottom'>
   <input type='button' value='다시시도' onclick="history.back()">
 
</DIV>
 
 
<!-- *********************************************** -->
<%-- <jsp:include page="/menu/bottom.jsp" flush="false"/> --%>
</body>
<!-- *********************************************** -->
</html> 
