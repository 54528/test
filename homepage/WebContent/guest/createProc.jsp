<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi2.jsp" %>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:useBean id="dto" class="guest.GuestDTO"/>

<%
   UploadSave upload = new UploadSave(request,-1,-1,tempDir);

   dto.setId(UploadSave.encode(upload.getParameter("id")));
   dto.setContent(UploadSave.encode(upload.getParameter("content")));
   dto.setTitle(UploadSave.encode(upload.getParameter("title")));
   
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
function glist(){
	var url = "./list.jsp";
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
 
<DIV class="title">방명록 등록</DIV>

<div class="content">
<%
if(flag){
	out.print("방명록 등록에 성공하였습니다.");
}else{
	out.print("방명록 등록에 실패하였습니다.");
}

%>
</div>

<DIV class='bottom'>
  <input type='button' value='목록으로' onclick="glist()">
  <input type='button' value='뒤로가기' onclick="history.back()">
</DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
