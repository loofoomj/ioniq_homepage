<%@page import="com.jose.notice.NoticeDAO"%>
<%@page import="com.jose.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int result = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	NoticeDTO nDto = new NoticeDTO();
	nDto.setTitle(request.getParameter("title"));
	nDto.setWriter(request.getParameter("writer"));
	nDto.setContent(request.getParameter("contents"));
	
	if(nDto.getWriter()!=null){
		NoticeDAO nDao = new NoticeDAO();
		result = nDao.boardWrite(nDto);
	}%>
<script type="text/javascript">
	var result=<%=result%>
    	if(result>0){
    		alert("글 등록 완료");
    	}else {
    		alert("등록 실패");
    	}
    	location.href="<%=application.getContextPath()%>/board/notice.jsp?curPage=1";
</script>
</body>
</html>