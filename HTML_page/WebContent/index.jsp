<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/header_footer.css">
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>
<body>

<%@ include file="templete/header.jsp"%>
	
<!-- section 시작 -->
	<section>
		<div id="video">
		<!-- 추후 문구나 배너등을 추가하는 공간 시작 -->
<!-- 	<div id="text_wrap">
 		<div id="text">
			<p id="text_1">Freedom in Mobility</p><br>
			<p id="text_2">제약과 제한이 없는<br>
				자유로운 이동 생활<br></p>
		</div> 
	</div> -->
			<!-- 추후 문구나 배너등을 추가하는 공간 종료 -->
			<video muted autoplay loop preload="metadata">
				<source src="./videos/intro.mp4">
			</video>
		</div>
	</section>
<!-- section 종료 -->	
<footer style="position: fixed;">
<%@ include file="templete/footer.jsp"%>

</body>
</html>