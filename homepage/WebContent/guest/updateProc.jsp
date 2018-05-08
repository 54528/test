<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi2.jsp" %> 
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:useBean id="dto" class="guest.GuestDTO"/>
<jsp:setProperty name="dto" property="*"/> 
<%
     String col = request.getParameter("col");   
     String word = request.getParameter("word");
     boolean flag = dao.update(dto);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function glist(){
	var url = "./list.jsp";
	url+="?num=<%=dto.getNum()%>";
	url+="&col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	location.href = url;
	
}


</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
div{
  font-align:center;
  align:center;
  
}
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">방명록 수정</DIV>
<div class="content"></div>
<%
   if(flag){
	   out.print("방명록 수정이 완료되었습니다.");
   }else{
	   out.print("방명록 수정에 실패했습니다.");
   }
%>

  
  <DIV class='bottom'>
    <input type='button' value='방명록 목록으로' onclick="glist()">
  </DIV>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
