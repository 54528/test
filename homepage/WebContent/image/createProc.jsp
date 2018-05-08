<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi5.jsp" %>
<jsp:useBean id="dto" class="image.ImageDTO"/>
<jsp:useBean id="dao" class="image.ImageDAO"/> 
<%
    UploadSave upload = new UploadSave(request,-1,-1,tempDir);

    dto.setMname(UploadSave.encode(upload.getParameter("mname")));
    dto.setTitle(UploadSave.encode(upload.getParameter("title")));
    dto.setContent(UploadSave.encode(upload.getParameter("content")));
    dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
    
  
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
function ilist(){
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
 
<DIV class="title">등록완료</DIV>

<div class="content">
<%
   if(flag){
	   out.print("등록을 완료하였습니다.");
   }else{
	   out.print("등록에 실패했습니다.");
   }
%>
</div> 

<DIV class='bottom'>

  <input type='button' value='홈' onclick='ilist()'>
</DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
