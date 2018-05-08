<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi2.jsp" %> 
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:useBean id="dto" class="guest.GuestDTO"/>
<jsp:setProperty name="dto" property="*"/> 
 
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

<DIV class="container">방명록 남기기
 
<FORM name='frm' 
method='POST' 
action='./createProc.jsp'
enctype="multipart/form-data"
>

  <TABLE class="table table-bordered">
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fname" accept=".jpg,.png,.gif"></TD>
      <td> 사진은jpg, png, gif파일만 올리세요^^ </td>
    </TR>
    
    <TR>
      <TH>닉네임</TH>
      <TD><input type="text" name="id" size="20"></TD>
      <td>아이디를 적어주세요^^</td>
    </TR>
    
      <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="40"></TD>
      <td>제목을 적어주세요^^</td>
    </TR>
    
      <TR>
      <TH>내용</TH>
      <TD><input type="text" name="content" size="3000"></TD>
      <td>내용을 적어주세요^^</td>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
</DIV> 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
