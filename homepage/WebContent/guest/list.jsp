<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi2.jsp" %>
<jsp:useBean id="dao" class="guest.GuestDAO"/>


<%
    //검색관련
    String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
    if(col.equals("total")) word="";
	
    //페이징 관련
    int nowPage=1;
    int recordPerPage=5;
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
    
     List<GuestDTO> list = dao.list(map);
    
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
	var url = "../Main.jsp";
	location.href = url;
}
function gupdate(num){
	var url ="updateForm.jsp";
	url +="?num="+num;
	url +="&col=<%=col%>";
	url +="&word=<%=word%>";
	location.href = url;	
}
function gdelete(num){
	var url = "./deleteForm.jsp";
	url +="?num="+num;
	url +="&col=<%=col%>";
	url +="&word=<%=word%>";
	location.href = url;	
}
function mlist(){
    var url = "../member/list.jsp";
    location.href = url;	
}
</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
.search{
  width: 90%;
  text-align: center;
  margin: 5px auto;
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
 
<DIV class="title">방명록</DIV>
 <div class='search'>
  <form method="post" action='./list.jsp'>
  
   <select name ="col">
   <option value="id"
   <%if(col.equals("id")) out.print("selected"); %>
   >닉네임</option>
   <option value="total">내용전체</option>
   </select>  
   
   
   
   <input type='search' name='word' required value='<%=word %>'>
   <button>검색</button>
   <input type='button' value='방명록 남기기' onclick="location.href='./createForm.jsp'">
   <br><br>

<% for(int i=0; i<list.size(); i++){ 
   GuestDTO dto =list.get(i); 

%>   

  <form method="post" action="">
  <TABLE>
    <TR>
      <TD rowspan="6" width="30%">
      <img src ="./storage/<%=dto.getFname() %>" width="200px" height="200px" align="middle">
      </TD>
      
      <th width="20%">닉네임</th>
      <td>
      <%=dto.getId() %>
      </td>
  
    </TR>
    
    <tr>
      <th>제목</th>
      <td><%=dto.getTitle() %></td>
    </tr>
    
    <tr>
      <th>내용</th>
    <td><%=dto.getContent() %></td>
<!--     //<td><textarea rows="10" cols="35" name="content" size="20"></textarea></td> -->
    </tr>
    
    <tr>
      <th>작성날짜</th>
      <td><%=dto.getGdate() %></td>
    </tr>
    
    <tr>
    <th>수정 or 삭제</th>
    <td>
    <a href="javascript:gupdate('<%=dto.getNum()%>')">수정</a>
    /<a href="javascript:gdelete('<%=dto.getNum()%>')">삭제</a>
    </td>
    </tr>
  </TABLE>
    
   </form>
  <%}  %>
  <DIV class='bottom'>
  <%=paging %>
  </DIV>
     
 
   
           <input type='button' value='메인으로가기' onclick="f1()">
   </form>
   </div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
