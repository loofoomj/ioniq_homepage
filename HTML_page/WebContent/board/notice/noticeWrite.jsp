<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO mDto = (MemberDTO) session.getAttribute("member");
	int curPage = Integer.parseInt(request.getParameter("curPage"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/reset.css">
<link rel="stylesheet" type="text/css" href="../../css/header_footer.css">
<link rel="stylesheet" type="text/css" href="../../css/noticeWrite.css">
<script type="text/javascript" src="<%=application.getContextPath() %>/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	window.onload=(function(){
		CKEDITOR.replace( 'contents', {
			uiColor: '#33c3df'
		} );
		
		var btn = document.frm.btn;
		btn.addEventListener("click", function(){
			var ch = document.getElementsByClassName("inp");
			var result = true;
			var edit = CKEDITOR.instances.contents.getData();
			for(var i=0;i<ch.length;i++){
				if(ch[i].value==""){
					result=!result;
					break;
				}
			}
			if(edit==""){
				result=false;
			}
			if(result==true){
				if(confirm("글을 등록 하시겠습니까?")){
					document.frm.submit();	
				}	
			}else {
				alert("빈칸이 있습니다");
			}
		})
		
	});
</script>
</head>
<%if(mDto!=null&&mDto.getKind().equals("admin")){ %>
<body>
<%@ include file="../../templete/header.jsp"%>
<section>
	<div id="main">
		<form name="frm" action="noticeWriteProcess.jsp" method="post">
		<div id="title_write">글쓰기</div>
			<table>
				<tr>
					<td class="d_1">제목</td>
					<td><input class="inp" type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td class="d_1">작성자</td>
					<td><input class="inp" type="text" name="writer" id="writer" value="<%=mDto.getId() %>" readonly="readonly"></td>
				</tr>
			</table>
			<textarea rows="" cols="" name="contents" id="contents"></textarea>
			<input name="btn" id="btn_write" type="button" value="등록" class="btn">
		</form>
		<form action="../notice.jsp?curPage=<%=curPage %>" method="post">
			<input id="btn_list" type="submit" value="목록" class="btn">
		</form>
	</div>
</section>
<footer style="position: fixed;">
<%@ include file="../../templete/footer.jsp"%>
</body>
<%}else{ %>
<script type="text/javascript">
	alert("잘못된 접근입니다");
	history.go(-1);
</script>
<%} %>
</html>