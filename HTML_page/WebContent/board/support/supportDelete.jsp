<%@page import="com.jose.support.SupportDAO"%>
<%@page import="com.jose.support.SupportDTO"%>
<%@page import="com.jose.notice.NoticeDTO"%>
<%@page import="com.jose.notice.NoticeDAO"%>
<%@page import="com.jose.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result=0;
	int num = Integer.parseInt(request.getParameter("num"));
	SupportDAO sDao = new SupportDAO();
	MemberDTO mDto = (MemberDTO) session.getAttribute("member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(mDto!=null){
	SupportDTO sDto = (SupportDTO) sDao.freeView(num);
	if(sDto!=null){
		if(mDto.getId().equals(sDto.getWriter()) || (mDto.getId().equals("admin"))) {
			result = sDao.freeboardDelete(num);
		}else {
			result=-1;%>
			<script type="text/javascript">
				alert("잘못된 접근입니다");
				history.go(-1);
			</script>
		<%}
	}else {
		result=-1;%>
		<script type="text/javascript">
			alert("글이 삭제되었거나 없는 글 입니다");
			history.go(-1);
		</script>
	<%}
} %>
<script type="text/javascript">
	var result=<%=result%>
    	if(result>0){
    		alert("글 삭제 완료");
    	}else {
    		alert("삭제 실패");
    	}
    	location.href="<%=application.getContextPath()%>/board/support.jsp?curPage=1";
</script>
</body>
</html>