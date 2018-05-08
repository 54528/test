<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi5.jsp" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>회원가입</title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
title{
  text-align:center;
}
div{
  text-align:center;
  margin:auto;
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function inCheck(f){
	if(f.manme.value==""){
		alert("이름를 입력하시오");
		f.mname.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력해 주세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호 확인을 입력해 주세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요");
		f.repasswd.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;
  }
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">이미지 등록하기</DIV>
 
<FORM name='frm' 
method='POST' 
action='./createProc.jsp' 
enctype="multipart/form-data"
onsubmit="return inCheck(this)"
>
  <TABLE>
  
      <TR>
      <TH>이름</TH>
      <TD><input type="text" name="mname" size="15">
      </td>
      <td>아이디를 적어주세요(*필수)</td>
      </TR>
   
     <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd" size="15">
      </td>
      <td>패스워드를 적어주세요(*필수)</td>
    </TR>
    
      <TR>
      <TH>패스워드 확인</TH>
      <TD><input type="password" name="repasswd" size="15">
      </td>
      <td>패스워드를 확인합니다.(*필수)</td>
    </TR>
   
      <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="20">
      </td>
      <td>제목을 적어주세요.(*필수)</td>
    </TR>
    
      <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="30" name="content"></textarea>
      </td>
      <td>내용를 적어주세요</td>
    </TR>
    
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fname" accept=".jpg,.png,.gif"></TD>
      <td>사진은 JPG, PNG, GIF 파일만 올려 주세요</td>   
    </TR>
 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
