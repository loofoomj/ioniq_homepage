<%@page import="com.jose.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO mDto = (MemberDTO) session.getAttribute("member");
	MemberDAO mDao = new MemberDAO();
	MemberDTO m = mDao.memberInfo(mDto);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link rel="stylesheet" type="text/css" href="../css/memberMod.css">
<script type="text/javascript">
	window.onload=(function(){
		
		var btn = document.frm.btn;
		btn.addEventListener("click", function(){
			var ch = document.getElementsByClassName("inp");
			var result = true;
			for(var i=0;i<ch.length;i++){
				if(ch[i].value==""){
					result=!result;
					break;
				}
			}
			var pw = document.getElementById("pw").value;
			var pwch = document.getElementById("pw_check").value;
			if(pw==pwch){
				if(result==true){
					document.frm.submit();	
				}else {
					alert("빈칸이 있습니다");
				}
			}else {
				alert("패스워드 확인 불일치");
			}
		})
		
	});
	function cancl(){
		history.go(-1);
	}
</script>
</head>
<body>
<%if(mDto!=null){ %>
<%@ include file="../templete/header.jsp"%>
	<%if(mDto.getId().equals(m.getId()) || m.getId().equals("admin")) {%>
<!-- section 시작 -->
	<section>
		<section id="login_section">
			<div id="login_title">
				<div id="login_logo">
					<img src="<%=application.getContextPath() %>/images/ioniq__logo.png">
				</div>
				<div id="login_text">
					<p>회원정보수정</p>
				</div>
			</div>
			
			<form name="frm" action="<%=application.getContextPath() %>/member/memberModProcess.jsp" method="post">
				<div id="auth_form">
					<div id="box_1">
						<div>
							<p>아이디</p>
							<input type="text" name="id" class="inp" value=<%=m.getId() %> readonly="readonly">
						</div>
						<div>
							<p>비밀번호</p>
							<input type="password" name="pw" id="pw" class="inp" value=<%=m.getPw() %>>
						</div>
						<div>
							<p>비밀번호 확인</p>
							<input type="password" id="pw_check" class="inp" value=<%=m.getPw() %>>
						</div>
					</div>
					<div id="box_2">
						<div>
							<p>이름</p>
							<input type="text" name="name" class="inp" value=<%=m.getName()%>>
						</div>
						<div>
							<p>성별</p>
								<div id="gender_box">
								<input class="gender" type="radio" name="gender" value="man" checked>남자
								<input class="gender" type="radio" name="gender" value="woman">여자
							</div>
						</div>
						<div id="date_box">
							<p>생년월일</p>
							<input type="date" name="birth" class="inp" value=<%=m.getBirth() %>>
						</div>
						<div>
							<p>이메일</p>
							<input type="text" name="email" class="inp" value=<%=m.getEmail()%>>
						</div>
					</div>
					<div id="box_3">
						<div>
							<p>휴대전화번호</p>
							<input class="box_3_1" type="text" name="phone" class="inp" value=<%=m.getPhone()%>>
						</div>
						<div id="address">
							<p>주소</p>
							<input class="box_3_2" type="text" name="adress" class="inp" value=<%=m.getAdress()%>><!-- readonly="readonly" -->
							<button>검색</button>
						</div>
						<div>
							<p>상세주소</p>
							<input class="box_3_1" type="text" name="subadress" class="inp" value=<%=m.getSubadress()%>>
						</div>
					</div>
	
					<div id="box_check">
						<div id="join1" class="join">
							<input type="button" value="회원정보수정" style="cursor: pointer;" name="btn" class="btn">
						</div>
						<div id="join2" class="join">
							<input type="button" value="취소" style="cursor: pointer;" name="btn2" class="btn" onclick="cancl()">
						</div>
					</div>
				</div>
			</form>
		</section>
	</section>
<!-- section 종료 -->	

<%@ include file="../templete/footer.jsp"%>
	<%}else {%>
	<script type="text/javascript">
		alert("잘못된 접근입니다");
		history.go(-1);
	</script>
	<%} %>
<%}else {%>
<script type="text/javascript">
	alert("잘못된 접근입니다");
	history.go(-1);
</script>
<%} %>
</body>
</html>