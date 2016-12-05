<%@page import="com.jose.member.MemberDAO"%>
<%@page import="com.jose.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	MemberDTO mDto = new MemberDTO();
	mDto.setId(request.getParameter("id"));
	mDto.setPw(request.getParameter("pw"));
	MemberDAO mDao = new MemberDAO();
	mDto = mDao.memberLogin(mDto);
	int result = 0;
	if(mDto!=null){
		result = 1;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var result=<%=result %>
	var name='';
	<%if(result>0){
		session.setAttribute("member", mDto);%>
		location.href="<%=application.getContextPath() %>/index.jsp";
	<%}else{%>
		alert("아이디 또는 비밀번호를 확인해 주세요");
		<%mDto=null;%>
		history.go(-1);
	<%}%>
	
</script>
</body>
</html>