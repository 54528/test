<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi2.jsp" %> 
<jsp:useBean id="dao" class="guest.GuestDAO"/>


<%
   int num = Integer.parseInt(request.getParameter("num"));
   GuestDTO dto=dao.read(num);

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
 
<DIV class="title">방명록 수정</DIV>
 
<FORM name='frm' 
method='POST' 
action='./updateProc.jsp'
>
<input type = "hidden" name="num" value="<%=dto.getNum()%>">
<input type = "hidden" name="col" value="<%=request.getParameter("col") %>">
<input type = "hidden" name="word" value="<%=request.getParameter("word") %>">

  <TABLE>
    <TR>
      <TD colspan="5">
      <img src="./storage/<%=dto.getFname() %>">
      </TD>
    </TR>
    
    <TR>
      <TH>닉네임</TH>
      <TD><input type="text" name="id" value="<%=dto.getId() %>"></TD>
      <td>변경할 아이디를 적어주세요^^</td>
    </TR>
    
      <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle() %>"></TD>
      <td>변경할 제목을 적어주세요^^</td>
    </TR>
    
      <TR>
      <TH>내용</TH>
      <TD><textarea name="content"><%=dto.getContent() %></textarea></TD>
      <td>변경할 내용을 적어주세요^^</td>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='방명록 수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
