<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi4.jsp" %>
<jsp:useBean id ="dao" class="homepage.HomepageDAO"/>
<jsp:useBean id ="dto" class="homepage.HomepageDTO"/>

<%
     //검색관련 
     String col = Utility.checkNull(request.getParameter("col"));
	 String word = Utility.checkNull(request.getParameter("word"));	
     
	 if(col.equals("total")) word="";
     
     //페이징관련
     int nowPage = 1;
     int recordPerPage = 3;
     if(request.getParameter("nowPage")!=null){
    	 nowPage = Integer.parseInt(request.getParameter("nowPage"));
     }
     //db에서 가져올 순번
     
     int sno = ((nowPage -1) * recordPerPage) + 1;
     int eno = nowPage * recordPerPage;
     
     //dao메소드 호출
     Map map = new HashMap();
     map.put("col",col);
     map.put("word",word);
     map.put("sno",sno);
     map.put("eno",eno);
     
     List<HomepageDTO> list = dao.list(map);
     
     int totalRecord = dao.total(map);
   
     //페이징메소드 호출
     
     String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function f1(){
	var url ="../Main.jsp";
	location.href = url;	
}
function read(id){
	var url = "./read.jsp";	
	url += "?id="+id;
	
	location.href=url;
}

</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
.search{
   width: 80%;
   text-align: center;
   margin : 5px auto;
}
table{
  width:50%;
  margin:auto;
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>
<div class="search">
<form method="post" action="./list.jsp">
<select name="col">
   <option value="mname"
   <%if(col.equals("mname")) out.print("selected"); %>
   >성명</option>
   <option value="id">아이디</option>
   <option value="email">이메일</option>
   <option value="total">전체출력</option>	
</select>
<input type = "search" name="word" required value='<%=word %>'>
<button>검색</button>
<button type="button" onclick="location.href='./createForm.jsp'">회원가입</button>
 
</form>
</div>

<% for(int i=0; i<list.size(); i++){ 
   
   dto = list.get(i);

%>
<br>
<table>
<tr>
   <td rowspan="5" width="30%"><img src ="./storage/<%=dto.getFname()%>" width="250px" height="250px" align="middle"></td>
   <th width="20%">아이디</th>
   <td width="50%"><a href="javascript:read('<%=dto.getId() %>')"><%=dto.getId() %></a></td>
</tr>

<tr>
   <th>성명</th>
   <td><%=dto.getMname() %></td>
</tr>  

<tr>
   <th>전화번호</th>
   <td><%=dto.getTel() %></td>
</tr>   

<tr>
   <th>이메일</th>
   <td><%=dto.getEmail()%></td>
</tr> 
  
<tr>
   <th>주소</th>
   <td><%=Utility.checkNull(dto.getAddress1()) %> 
   <br><%=Utility.checkNull(dto.getAddress2()) %></td>
</tr>   

</table>  
<%} %>
<DIV class='bottom'>
   
   <%=paging %>
<br><button type='button' onclick='f1()'>메인으로</button>
</DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
