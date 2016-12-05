<%@page import="com.jose.member.MemberDTO"%>
<%@page import="com.jose.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	MemberDTO mDto = new MemberDTO();
	mDto.setId(request.getParameter("id"));
	mDto.setPw(request.getParameter("pw"));
	mDto.setName(request.getParameter("name"));
	mDto.setGender(request.getParameter("gender"));
	mDto.setBirth(request.getParameter("birth"));
	mDto.setEmail(request.getParameter("email"));
	mDto.setPhone(request.getParameter("phone"));
	mDto.setAdress(request.getParameter("adress"));
	mDto.setSubadress(request.getParameter("subadress"));
	MemberDAO mDao = new MemberDAO();
	int result = mDao.memberJoin(mDto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var result=<%=result%>
	if(result>0){
		alert("회원가입 완료");
	}else {
		alert("회원가입 실패");
	}
	location.href="<%=application.getContextPath() %>/auth/login.jsp";
</script>
</body>
</html>