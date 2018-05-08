<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi5.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/> 
<%
    UploadSave upload = new UploadSave(request,-1,-1,tempDir);
   
    int ino = (Integer.parseInt(upload.getParameter("ino")));
    String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
    FileItem fileItem = upload.getFileItem("fname");
    
    int size = (int)fileItem.getSize();
    String fname=null;
    if(size>0){
    	if(oldfile!=null && !oldfile.equals("member.jpg"))
    	UploadSave.deleteFile(upDir, oldfile);
    	   
    	fname = UploadSave.saveFile(fileItem, upDir);
    }
    Map map = new HashMap();
    map.put("ino", ino);
    map.put("fname", fname);
    boolean flag = dao.updateFile(map);
    
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(){
	var url = './read.jsp';
	url +="?ino=<%=ino%>";
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
 
<DIV class="title">사진변경</DIV>
 
<div class="content">
<%
  if(flag){
	  out.print("사진을 변경했습니다.");
  }else{
	  out.print("사진변경을 실패했습니다.");
  }
%>

</div>
<div class="bottom">
<input type="button" value="나의정보" onclick="read()">
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
