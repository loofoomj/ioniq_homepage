<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">
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
			if(result==true){
				document.frm.submit();	
			}else {
				alert("아이디와 패스워드를 입력해 주세요");				
			}
		})
	});
</script>
</head>
<body>
<%@ include file="../templete/header.jsp"%>
	
<!-- section 시작 -->
	<section>
		<section id="login_section">
				<div id="login_title">
					<div id="login_logo">
						<img src="<%=application.getContextPath() %>/images/ioniq__logo.png">
					</div>
					<div id="login_text">
						<p>로그인 페이지 입니다.</p>
					</div>
				</div>
			<form name="frm" action="<%=application.getContextPath() %>/auth/loginProcess.jsp" method="post">
			<div id="id_pw_input_box">
				<div id="box_detail">
					<div id="confirm">
					<input type="button" name="btn" id="c_button" style="cursor: pointer;" value="로그인">
					</div>
					<div id="id_text"><p>아이디</p></div>
					<div id="id_input"><input type="text" name="id" class="inp"></div>
					
					<div id="pw_text"><p>비밀번호</p></div>
					<div id="pw_input"><input type="password" name="pw" class="inp"></div>
					
				</div>
			</div>
			</form>
			<div id="join_box">
				<div id="join_box_detail">
					<div id="join_text"><p>처음 방문하셨다면 회원가입을 눌러주세요.</p></div>
					<div id="join_input">
					<form action="<%=application.getContextPath() %>/auth/signin_form.jsp">
					<button id="j_button" style="cursor: pointer;">회원가입</button>
					</form>
					</div>
				</div>
			</div>
		</section>
	</section>
<!-- section 종료 -->	

<%@ include file="../templete/footer.jsp"%>
</body>
</html>