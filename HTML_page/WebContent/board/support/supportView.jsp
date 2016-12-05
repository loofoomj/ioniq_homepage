<%@page import="com.jose.support.SupportDTO"%>
<%@page import="com.jose.support.SupportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO mDto = (MemberDTO) session.getAttribute("member");
	int num = Integer.parseInt(request.getParameter("num"));
	int curPage = Integer.parseInt(request.getParameter("curPage"));
	SupportDAO sDao = new SupportDAO();
	SupportDTO sDto = sDao.freeView(num);
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
			location.href = "supportDelete.jsp?num=<%=num%>";
		}else {
			
		}
	}

</script>
</head>
<body>
<%@ include file="../../templete/header.jsp"%>
<section>
<%if(mDto!=null) {%>
	<% if(sDto!=null) {%>
	<div id="main">
		<table>
			<tr id="tr1">
				<td class="d">제목</td>
				<td>글쓴이</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<tr id="tr2">
				<td class="d"><%=sDto.getTitle() %></td>
				<td><%=sDto.getWriter() %></td>
				<td><%=sDto.getReg_date() %></td>
				<td><%=sDto.getCounts() %></td>
			</tr>
			<tr id="tr3">
				<td colspan="4" ><div id="textbox"><%=sDto.getContents() %></div></td>
			</tr>
		</table>
		
		<a href="../support.jsp?curPage=<%=curPage %>"><input id="btn1" type="button" name="list" value="목록" class="btn"></a>
		<a href="supportWrite.jsp?curPage=<%=curPage %>&kind=write&num=<%=num %>"><input id="btn4" type="button" name="write" value="글작성" class="btn"></a>
		<a href="supportWrite.jsp?curPage=<%=curPage %>&kind=reple&num=<%=num %>"><input id="btn4" type="button" name="write" value="댓글" class="btn"></a>
			<%if(mDto.getId().equals(sDto.getWriter()) || mDto.getId().equals("admin")) {%>
			<a href="supportMod.jsp?num=<%=sDto.getNum() %>&curPage=<%=curPage %>"><input id="btn2" type="button" name="mod" value="수정" class="btn"></a>
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