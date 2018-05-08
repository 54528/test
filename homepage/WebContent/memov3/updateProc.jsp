<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty name="dto" property="*"/>
<% 
  
       boolean flag = dao.update(dto);
      
    		  
       
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
div{
     text-align:center;
     margin-top:100px;
}

*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">
function mlist(){
	var url ="list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;	
}

</script>	
</head> 
<body> 
<div>
<%
if(flag){
	out.print("메모를 수정했습니다.");
}else{
	out.print("메모수정을 실패했습니다.");
}
%> 
<br>
<button type ="button" onclick="mlist()">목록</button>
</div>
</body> 
</html> 
