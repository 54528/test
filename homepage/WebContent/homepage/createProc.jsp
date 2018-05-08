<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %> 
<jsp:useBean id="dao" class="homepage.HomepageDAO"/>
<jsp:useBean id="dto" class="homepage.HomepageDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
    UploadSave upload = (UploadSave)request.getAttribute("upload");

    dto.setId(UploadSave.encode(upload.getParameter("id")));
    dto.setMname(UploadSave.encode(upload.getParameter("mname")));
    dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
    dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
    dto.setZipcode(upload.getParameter("zipcode"));
    dto.setPasswd(upload.getParameter("passwd"));
    dto.setJob(upload.getParameter("job"));
    dto.setEmail(upload.getParameter("email"));
    dto.setTel(upload.getParameter("tel"));
    
    FileItem fileItem = upload.getFileItem("fname");
    String fname = "member.jpg";
    int size = (int)fileItem.getSize();
    
    if(size>0){
    	fname = UploadSave.saveFile(fileItem, upDir);
    }

    dto.setFname(fname);
    boolean flag = dao.create(dto);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function hlist(){
	var url = "./list.jsp";
	location.href = url;	
}

function hlogin(){
	var url = "./loginForm.jsp";
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
 
<DIV class="title">회원가입 처리</DIV>

<div class="content">
<%
   if(flag){
	   out.print("회원가입을 완료하였습니다.");
	   out.print("<button type='button' onclick ='hlogin()' >로그인</button>");
   }else{
	   out.print("회원가입에 실패했습니다.");
   }
%>
</div> 

<DIV class='bottom'>

  <input type='button' value='홈' onclick='hlist()'>
</DIV>

 
 
<!-- *********************************************** -->
<%-- <jsp:include page="/menu/bottom.jsp" flush="false"/> --%>
</body>
<!-- *********************************************** -->
</html> 
