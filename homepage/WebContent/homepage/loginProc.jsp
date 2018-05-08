<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %> 
<jsp:useBean id="dao" class="homepage.HomepageDAO"/>
<jsp:useBean id="dto" class="homepage.HomepageDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   
   Map<String,String> map = new HashMap<>();
   map.put("id", id);
   map.put("passwd", passwd);

   boolean flag = dao.loginCheck(map);
   
   String grade = null;

   if(flag){
	   grade=dao.getGrade(id);
	   session.setAttribute("id", id);
	   session.setAttribute("grade", grade);
	   
	   Cookie cookie = null;
	   String hid = request.getParameter("hid");
	   
	   if(hid!=null){
		   cookie = new Cookie("hid","Y");
		   cookie.setMaxAge(120);
		   response.addCookie(cookie);
		   
		   cookie = new Cookie("hid_val", id);
		   cookie.setMaxAge(120);
		   response.addCookie(cookie);
	   }else{
		   cookie = new Cookie("hid", "");
		   cookie.setMaxAge(0);
		   response.addCookie(cookie);
		   
		   cookie = new Cookie("hid_val", "");
		   cookie.setMaxAge(0);
		   response.addCookie(cookie);
	   }
   }
   
  
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
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>
<!-- *********************************************** -->
 
<DIV class="title">로그인 처리</DIV>

<div class="content">

</div>
 
<% if(flag){ out.print("로그인 되었습니다.");%> 
  <DIV class='bottom'>
  <input type='button' value='홈' onclick="location.href='../Main.jsp'">
<%}else{ out.print("아이디 또는 비밀번호가 틀렸습니다<br>");
	   	 out.print("회원이 아니실경우 회원가입을 하십시오"); %>
  <input type="button" value="다시시도" onclick="history.back()">
  </div>
<%} %> 
<!-- *********************************************** -->
<%-- <jsp:include page="/menu/bottom.jsp" flush="false"/> --%>
</body>
<!-- *********************************************** -->
</html> 
