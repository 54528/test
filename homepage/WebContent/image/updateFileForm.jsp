<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi5.jsp" %> 
<jsp:useBean id="dto" class="image.ImageDTO"/>
<jsp:useBean id="dao" class="image.ImageDAO"/>


<%
   int ino = (Integer.parseInt(request.getParameter("ino")));

   dto=dao.read(ino);

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
div{
text-align:center;
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV class="title">사진 수정</DIV>

 
<FORM name='frm' 
      method='POST' 
	  action='./updateFileProc.jsp' 
 	  enctype="multipart/form-data"
 	  >
<input type ="hidden" name="ino" value="<%=ino %>">
<input type ="hidden" name="oldfile" value="<%=dto.getFname()%>">

  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="./storage/<%=dto.getFname() %>">
             원본파일명:<%=dto.getFname() %>
      
      </TD>
    </TR>
    
      <TR>
      <TH>변경파일</TH>
      <TD>
      <input type="file" name="fname" accept=".jpg,.gif,.png">
      
      </TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
