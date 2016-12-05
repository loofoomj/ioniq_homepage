<%@page import="com.jose.member.MemberDTO"%>
<%@page import="com.jose.support.SupportDAO"%>
<%@page import="com.jose.support.SupportDTO"%>
<%@page import="com.jose.notice.NoticeDAO"%>
<%@page import="com.jose.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int result = 0;
	int curPage = result;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDTO mDto = (MemberDTO) session.getAttribute("member");
	SupportDTO sDto = new SupportDTO();
	sDto.setNum(Integer.parseInt(request.getParameter("num")));
	sDto.setTitle(request.getParameter("title"));
	sDto.setWriter(request.getParameter("writer"));
	sDto.setContents(request.getParameter("contents"));
	
	if(mDto!=null){
		SupportDAO sDao = new SupportDAO();
		result = sDao.freeboardModProcess(sDto);
		
	}else {%>

<script type="text/javascript">
	alert("잘못된 접근입니다");
	history.go(-1);
</script>
<%} %>
<script type="text/javascript">
	var result=<%=result %>
	if(result>0){
		alert("성공");
	}else{
		alert("실패");
	}
	location.href="../support.jsp?curPage=1";
</script>
</body>
</html>