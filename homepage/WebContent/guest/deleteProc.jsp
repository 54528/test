<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi2.jsp" %> 
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:useBean id="dto" class="guest.GuestDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    String fname=request.getParameter("fname");

    
    boolean flag = dao.delete(num);
    
    if(flag){
    	if(fname!=null && !fname.equals("member.jpg"))
    	UploadSave.deleteFile(upDir, fname);
    	
    	session.invalidate();
    }

%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function glist(){
	var url = "./list.jsp";
	url += "?num=<%=num%>";
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
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">방명록 삭제</DIV>

<div class="content">
<%
   if(flag){
	   out.print("방명록 삭제 완료");
   }else{
	   out.print("방명록 삭제 실패");
   }
%>
</div>
<DIV class='bottom'>
    <input type='button' value='방명록 목록으로' onclick="glist()">
</DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
