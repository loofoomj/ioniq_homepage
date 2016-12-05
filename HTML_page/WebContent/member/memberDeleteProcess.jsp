<%@page import="com.jose.member.MemberDTO"%>
<%@page import="com.jose.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	MemberDTO mDto = (MemberDTO) session.getAttribute("member"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(mDto!=null) {%>
<%
	MemberDAO mDao = new MemberDAO();
	int result = mDao.memberDel(mDto);
%>
<script type="text/javascript">
<%	if(result>0){
		session.invalidate(); %>
		alert("회원 탈퇴 완료");
	<%}else{%>
		alert("회원 탈퇴 실패");
	<%}%>
	location.href="<%=application.getContextPath()%>/index.jsp";
</script>
	

<%}else {%>
<script type="text/javascript">
	alert("잘못된 접근 입니다");
	history.go(-1);
</script>
<%} %>
</body>
</html>