<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %> 
<jsp:useBean id="dao" class="homepage.HomepageDAO"/>
<jsp:useBean id="dto" class="homepage.HomepageDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
    UploadSave upload = new UploadSave(request,-1,-1,tempDir);
    String id = upload.getParameter("id");
    String passwd = UploadSave.encode(upload.getParameter("repasswd"));
    
    Map<String,String> map = new HashMap<String,String>();
    map.put("id",id);
    map.put("passwd",passwd);
    boolean flag = dao.passwdUpdate(map);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(){
	var url = "./read.jsp";
	url += "?id=<%=id%>";
	location.href=url;
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
 
<DIV class="title">비밀번호가 변경되었습니다.</DIV>

<div class="content">
<%
  if(flag){
	  out.print("비밀번호 변경완료!");
  }else{
	  out.print("비밀번호 변경실패ㅠㅠ");
  }

%>

</div>
<DIV class='bottom'>
   <input type='button' value='나의정보' onclick="read()">
</DIV>

 
 
<!-- *********************************************** -->
<%-- <jsp:include page="/menu/bottom.jsp" flush="false"/> --%>
</body>
<!-- *********************************************** -->
</html> 
