<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link rel="stylesheet" type="text/css" href="../css/signin.css">
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
					<p>회원가입 페이지 입니다.</p>
				</div>
			</div>
			
			<form name="frm" action="<%=application.getContextPath() %>/auth/signinProcess.jsp" method="post">
				<div id="auth_form">
					<div id="box_1">
						<div>
							<p>아이디</p>
							<input type="text" name="id" class="inp">
						</div>
						<div>
							<p>비밀번호</p>
							<input type="password" name="pw" id="pw" class="inp">
						</div>
						<div>
							<p>비밀번호 확인</p>
							<input type="password" id="pw_check" class="inp">
						</div>
					</div>
					<div id="box_2">
						<div>
							<p>이름</p>
							<input type="text" name="name" class="inp">
						</div>
						<div>
							<p>성별</p>
							<div id="gender_box">
								<input class="gender" type="radio" name="gender" value="man">남자
								<input class="gender" type="radio" name="gender" value="woman">여자
							</div>
						</div>
						<div id="date_box">
							<p>생년월일</p>
							<input type="date" name="birth" class="inp">
						</div>
						<div>
							<p>이메일</p>
							<input type="text" name="email" class="inp">
						</div>
					</div>
					<div id="box_3">
						<div>
							<p>휴대전화번호</p>
							<input class="box_3_1" type="text" name="phone" class="inp">
						</div>
						<div id="address">
							<p>주소</p>
							<input class="box_3_2" type="text" name="adress" class="inp"><!-- readonly="readonly" -->
							<button>검색</button>
						</div>
						<div>
							<p>상세주소</p>
							<input class="box_3_1" type="text" name="subadress" class="inp">
						</div>
					</div>
	
					<div id="box_check">
						<div>
							<input type="button" value="회원가입" id="join" style="cursor: pointer;" name="btn">
						</div>
					</div>
				</div>
			</form>
		</section>
	</section>
<!-- section 종료 -->	

<%@ include file="../templete/footer.jsp"%>

</body>
</html>