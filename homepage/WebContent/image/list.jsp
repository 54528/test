<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi5.jsp" %> 
<jsp:useBean id="dto" class="image.ImageDTO"/>
<jsp:useBean id="dao" class="image.ImageDAO"/>

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
     
     List<ImageDTO> list = dao.list(map);
     
     int totalRecord = dao.total(map);
   
     //페이징메소드 호출
     
     String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title>
<script type="text/javascript">
function f1(){
	var url = "../Main.jsp";
	location.href=url;
}
function fileDown(filename){
	var url = "<%=root%>/download";
	url += "?filename="+filename;
	url += "&dir=/image/storage";
	location.href = url;
}
function read(ino){
	var url = "./read.jsp";	
	url += "?ino="+ino;
	url += "&col=<%=col%>";         
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
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
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<header class="w3-container w3-red w3-center" style="padding:128px 16px">
<body>

<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">이미지게시판</DIV>

<div class="search">
<form method="post" action="./list.jsp">

<select name="col">
   <option value="mname"
   <%if(col.equals("mname")) out.print("selected"); %>
   >이름</option>
   <option value="total">전체검색</option>	
</select>

<input type = "search" name="word" required value='<%=word %>'>

<button>검색</button>
<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
</form>
</div>

<table class="table table-hover">

<tr>
<th>번호</th>
<th>이름</th>
<th>제목</th>
<th>내용</th>
<th>작성날짜</th>
<th>이미지</th>
</tr>

<% for(int i=0; i<list.size(); i++){ 
   
   dto = list.get(i);

%>

<tr>
   <td><%=dto.getIno()%></td>
   <td><%=dto.getMname()%></td>
   <td><a href="javascript:read('<%=dto.getIno()%>')"><%=dto.getTitle()%></a></td>
   <td><%=dto.getContent()%></td>
   <td><%=dto.getWdate()%></td>
   	<td><% if(dto.getFname()==null){
		out.print(Utility.checkNull(dto.getFname()));
	 	}else{%>
	 <a href="javascript:fileDown('<%=dto.getFname() %>')"><img src="./storage/<%=dto.getFname() %>" width="30%"></a>	
	 	<% }%>
	 	</td>
<tr>

  
<%} %>
</table>	
<DIV class='bottom'>
   <%=paging %>
   <br>
<button type='button' onclick='f1()'>메인으로</button>
</DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
