<%@ page contentType="text/html; charset=UTF-8"%>
<% String root = request.getContextPath(); %>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
ul#menu li {
	display: inline;
}

ul#menu li a {
	background-color: skyblue;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 4px 4px 0 0;
}

ul#menu li a:hover {
	background-color: orange;
}

.table {
	width: 100%;
}

.table, .td {
	border-style: none;
}
</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
        <img src="<%=root %>/menu/images/main04.jpg" width='100%' height='80%'>
    </td>
  </tr>
  
  <tr>
    <td class="td">
    <ul id="menu">
<%--      <li><a href="<%=root %>/Main.jsp">홈</a></li>     --%>
<%--      <li><a href="<%=root %>/bbs/list.jsp">글목록</a></li> --%>
<%--      <li><a href="<%=root %>/bbs/createForm.jsp">메모등록</a></li> --%>
<%--      <li><a href="<%=root %>/">메뉴1</a></li> --%>
<%--      <li><a href="<%=root %>ㄷ/">메뉴2</a></li>    --%>
<!--      <li><a href="">메뉴3</a></li> -->
<!--      <li><a href="">메뉴4</a></li> -->
    </ul>
    </td> 
  </tr>
 
</table>
</div>
</body>
</html>
<!-- 상단 메뉴 끝 -->