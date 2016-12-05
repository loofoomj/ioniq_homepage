<%@page import="com.jose.notice.NoticeDTO"%>
<%@page import="com.jose.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO mDto = (MemberDTO) session.getAttribute("member");
	int num = Integer.parseInt(request.getParameter("num"));
	int curPage = Integer.parseInt(request.getParameter("curPage"));
	NoticeDAO nDao = new NoticeDAO();
	NoticeDTO nDto = (NoticeDTO) nDao.boardView(num);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/reset.css">
<link rel="stylesheet" type="text/css" href="../../css/header_footer.css">
<link rel="stylesheet" type="text/css" href="../../css/noticeView.css">
<script type="text/javascript">

	function goDel(){
		var ch = confirm("글을 삭제하시겠습니까?");
		if(ch){
			location.href = "noticeDelete.jsp?num=<%=num%>";
		}else {
			
		}
	}

</script>
</head>
<body>
<%@ include file="../../templete/header.jsp"%>
<section>
<%if(mDto!=null) {%>
	<% if(nDto!=null) {%>
	<div id="main">
		<table>
			<tr id="tr1">
				<td class="d">제목</td>
				<td>글쓴이</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<tr id="tr2">
				<td class="d"><%=nDto.getTitle() %></td>
				<td><%=nDto.getWriter() %></td>
				<td><%=nDto.getReg_date() %></td>
				<td><%=nDto.getCount() %></td>
			</tr>
			<tr id="tr3">
				<td colspan="4" ><div id="textbox"><%=nDto.getContent() %></div></td>
			</tr>
		</table>
		
		<a href="../notice.jsp?curPage=<%=curPage %>"><input id="btn1" type="button" name="list" value="목록" class="btn"></a>
		<a href="noticeWrite.jsp?curPage=<%=curPage %>"><input id="btn4" type="button" name="write" value="글작성" class="btn"></a>
			<%if(mDto.getId().equals(nDto.getWriter()) || mDto.getId().equals("admin")) {%>
			<a href="noticeMod.jsp?num=<%=nDto.getNum() %>&curPage=<%=curPage %>"><input id="btn2" type="button" name="mod" value="수정" class="btn"></a>
			<input id="btn3" type="button" name="del" value="삭제" onclick="goDel()" class="btn">
			<%} %>
	</div>	
	<%} else {%>
		<script type="text/javascript">
			alert("글이 삭제되었거나 없는 글 입니다.");
			history.go(-1);
		</script>
	<%} %>
	
<%}else {%>
<script type="text/javascript">
	alert("잘못된 접근입니다");
	history.go(-1);
</script>
<%} %>
</section>
<%@ include file="../../templete/footer.jsp"%>
</body>
</html>