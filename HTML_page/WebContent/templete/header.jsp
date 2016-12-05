<%@page import="com.jose.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO headmDto = (MemberDTO) session.getAttribute("member"); 
%>
<!DOCTYPE html>

<!-- header 시작 -->
	<header>
		<div class="container">
			<div id="logo_div"><a href="<%=application.getContextPath() %>/index.jsp"><img src="<%=application.getContextPath() %>/images/ioniq__logo.png"></a></div>
			<nav id="main_nav">
				<ul>
					<li class="main_list"><a href="<%=application.getContextPath() %>/hybrid/hybrid.jsp">IONIQ hybrid</a></li>
					<li class="main_list"><a href="<%=application.getContextPath() %>/electronic/electronic.jsp">IONIQ electric</a></li>
					<li class="main_list"><a href="<%=application.getContextPath() %>/board/notice.jsp">NOTICE</a></li>
				</ul>
			</nav>
			<nav id="sub_nav">
				<ul>
					<%if(headmDto==null){ %>
					<li class="sub_list"><a href="<%=application.getContextPath() %>/auth/login.jsp">LOG IN</a></li>
					<li class="sub_list"><a href="<%=application.getContextPath() %>/auth/signin_form.jsp">SIGN UP</a></li>
					<%}else {%>
					<li class="sub_list"><a href="<%=application.getContextPath() %>/member/memberInfo.jsp"><%=headmDto.getId() %></a><a>님 로그인 중</a></li>
					<li class="sub_list"><a href="<%=application.getContextPath() %>/auth/logout.jsp">LOG OUT</a></li>
					<%} %>
					<li class="sub_list"><a href="<%=application.getContextPath() %>/board/support.jsp">SUPPORT</a></li>
				</ul>
			</nav>
		</div>
	</header>
<!-- header 종료 -->
