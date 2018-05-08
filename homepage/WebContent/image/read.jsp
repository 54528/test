<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi5.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/>
<% request.setCharacterEncoding("utf-8"); 

   int ino = Integer.parseInt(request.getParameter("ino"));

   ImageDTO dto = dao.read(ino);
   
   String content = dto.getContent();
   content = content.replaceAll("\r\n", "<br>");
   
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

.curImg{
	margin-right:0;
	border-style:solid;
	border-width: 3px;
	border-color: red;
}
.td_padding{
	padding:5px 5px;
}

</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function icreate(){
	var url = "./createForm.jsp";
	location.href=url;
}

function idelete(ino){
	var url = "./deleteForm.jsp";
	url += "?ino=<%=ino%>";
	location.href=url;
}
function iupdate(ino){
	var url ="./updateFileForm.jsp";
	url += "?ino=<%=ino%>";
	location.href = url;
}
function ilist(ino){
	var url = "./list.jsp";
	location.href = url;	
}
function readGo(ino){
	var url = "./read.jsp";
	url = url +"?ino="+ino;
	
	location.href=url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
 
<DIV class="title">조회</DIV>
 
  <TABLE style="width: 50%">
    <TR>
      <TD colspan="2">
      <img src="./storage/<%=dto.getFname() %>" width="100%">
      </TD>
    </TR>
    
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getMname() %></TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><%=content %></TD>
    </TR>
  </TABLE>
  <TABLE style="width: 50%">
  <TR>
  <%
  	List list = dao.imgRead(ino);
    String[] files = (String[])list.get(0);
    int[] noArr = (int[])list.get(1);
    for(int i=0;i<5;i++){
    	if(files[i]==null){  
  %>
  <td class="td_padding"><img src="./storage/default.jpg" width="100%"><td>
  <%
    	}else{
    		if(noArr[i]==ino){
  %> 	
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%		
    		}else{
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  			
  <%
    		}
    	 }   		
      }
  %>
  </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록' onclick="icreate()">
    <input type='button' value='목록' onclick="ilist()">
  	<input type='button' value='수정' onclick="iupdate('<%=dto.getIno()%>')">
  	<input type='button' value='삭제' onclick="idelete('<%=dto.getIno()%>')">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

