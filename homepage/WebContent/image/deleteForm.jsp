<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi5.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/> 
<jsp:useBean id="dto" class="image.ImageDTO"/>
<%  
    int ino = Integer.parseInt(request.getParameter("ino"));
    
 
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
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">게시글 삭제</DIV>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type='hidden' name='ino' value="<%=ino %>">

<div class="content">
삭제를 하시면 더 이상 글을 볼 수 없습니다.<br>
그래도 삭제를 원하시면 아래 삭제버튼을 클릭하세요
</div>
  <DIV class='bottom'>
    <input type='submit' value='삭제'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
