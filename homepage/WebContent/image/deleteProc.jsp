<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi5.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/> 
<%
    int ino = Integer.parseInt(request.getParameter("ino"));
    String fname = dao.getFname(ino);
    
    boolean flag= dao.delete(ino);
    
    if(flag){
    	if(fname!=null && !fname.equals("default.jpg"))
    	UploadSave.deleteFile(upDir,fname);
    }

%> 
	
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function ilist(){
	var url = "./list.jsp";
	url += "?ino=<%=ino%>";
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
 
<DIV class="title">삭제 확인</DIV>
 
<div class="content">
<%
    if(flag){
    	out.print("삭제되었습니다.");
    }else{
    	out.print("삭제가 실패되었습니다.");
    }
%>
</div>
 
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="ilist()">
  </DIV>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
