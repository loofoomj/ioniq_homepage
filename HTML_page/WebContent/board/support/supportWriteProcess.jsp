<%@page import="com.jose.support.SupportDAO"%>
<%@page import="com.jose.support.SupportDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String kind = request.getParameter("kind");
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
	SupportDTO sDto = new SupportDTO();
	sDto.setTitle(request.getParameter("title"));
	sDto.setWriter(request.getParameter("writer"));
	sDto.setContents(request.getParameter("contents"));
	sDto.setNum(Integer.parseInt(request.getParameter("num")));
	
	if(sDto.getWriter()!=null){
		SupportDAO sDao = new SupportDAO();
		if(kind.equals("write")){
			result = sDao.freeWrite(sDto);	
		}else if(kind.equals("reple")) {
			result = sDao.freeReply(sDto);
		}
		
	}%>
<script type="text/javascript">
	var result=<%=result%>
    	if(result>0){
    		alert("글 등록 완료");
    	}else {
    		alert("등록 실패");
    	}
    	location.href="<%=application.getContextPath()%>/board/support.jsp?curPage=1";
</script>
</body>
</html>