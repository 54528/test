<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %> 
<jsp:useBean id="dao" class="homepage.HomepageDAO"/>
<jsp:useBean id="dto" class="homepage.HomepageDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%
    String id = request.getParameter("id");   //list.jsp 관리자를 통해서 들어온것(관리자)

    if(id==null) id = (String)session.getAttribute("id"); //메뉴를 통해서 들어온것(일반)
    dto = dao.read(id);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mdelete(){
	var url = "./deleteForm.jsp";
	url += "?id=<%=id%>";
	location.href = url;
}
function mupdate(){
	var url = "./updateForm.jsp";
	url += "?id=<%=id%>";
	location.href = url;
}
function passwdCheck(){
	var url = "./passwdCheck.jsp"
	url += "?id=<%=id%>";
	url += "&passwd=<%=dto.getPasswd()%>";
	location.href = url;
}
function mlist(){
	var url = "./list.jsp"
	location.href=url;
}
function updateFile(){
	var url = "./updateFileForm.jsp"
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	
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
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"><%=dto.getMname() %>의 회원정보</DIV>
 
<table>
<tr>
    <td colspan='2'>
      <img src="./storage/<%=dto.getFname() %>">
    </td>
</tr>

<tr>
    <th>아이디</th>
    <td>
      <%=dto.getId() %>
    </td>
</tr>

<tr>
    <th>성명</th>
    <td>
      <%=dto.getMname() %>
    </td>
</tr>
    
<tr>
    <th>전화번호</th>
    <td>
      <%=dto.getTel() %>
    </td>
</tr>  

<tr>
    <th>이메일</th>
    <td>
      <%=dto.getEmail() %>
    </td>
</tr>  

<tr>
    <th>주소</th>
    <td>
      <%=Utility.checkNull(dto.getAddress1()) %>
      <%=Utility.checkNull(dto.getAddress2()) %>
    </td>
</tr>

</table>
  
<DIV class='bottom'>
    <input type='button' value='정보수정' onclick="mupdate()">
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='패스워드 변경' onclick="passwdCheck()">
    <br><br>
    <input type='button' value='회원탈퇴' onclick="mdelete()">
    <input type='button' value="목록" onclick="mlist()">
    <input type='button' value='다운로드'  
           onclick="location.href='<%=root %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'"> 
</DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
