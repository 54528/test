<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<% request.setCharacterEncoding("utf-8");

   
   int memono = Integer.parseInt(request.getParameter("memono"));
   boolean flag = dao.checkRefnum(memono);
     
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="stylesheet">
<script type="text/javascript">
function mlist(){
	var url = "./list.jsp";
	location.href = url;
}

</script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>

<%if(flag) {%>
<div class="content">
부모글 이므로 삭제할 수 없습니다.
</div>
<DIV class='bottom'>
    <input type="button" value='뒤로가기' onclick="history.back()">
    <input type="button" value='목록' onclick="mlist()">
</DIV>
<%}else{%>
<div class="title">삭제처리</div>

<form method="post" action="deleteProc.jsp">
<input type="hidden" name="memono" value="<%=memono%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">


<br>
삭제를 하면 복구가 될 수 없습니다.<br>
삭제하려면 삭제버튼을 클릭하세요.<br>
취소는 목록버튼을 누르시오.<br>
<br>
<button>삭제처리</button>
<button type="button" onclick="mlist()">목록</button>
</form>

</div>
<div class="bottom"></div>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html> 

<% }%>