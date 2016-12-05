<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link rel="stylesheet" type="text/css" href="../css/hybrid.css">
</head>
<body>

<%@ include file="../templete/header.jsp"%>
	
<!-- section 시작 -->
	<section id="hybrid_section">
	
	<!-- top section 시작 -->
		<div id="top_background">
			<div id="top_logo_container">
				<div id="top_logo">
					<img src="../images/hybrid/visual_txt_2.png">
				</div>
			</div>
			<img src="../images/hybrid/top_back.jpg">
		</div>
		
		<!-- top section 종료 -->

		<!-- main section 시작 -->
		
		<section id="main_section">
		
		<!-- ioniq 소개 -->
		
			<div class="section_title">
				<div id="ioniq_img">
					<img src="../images/hybrid/title/ioniq.png">
				</div>
			</div>
			<div id="ioniq_img_1">
				<img src="../images/hybrid/common/ioniq_0.jpg">
			</div>
			<div id="ioniq_img_2">
				<img src="../images/hybrid/common/ioniq_1.jpg">
			</div>
			
		<!-- 기술 소개 -->
			
			<div class="section_title">
				<div id="tech_img">
					<img src="../images/hybrid/title/tech.png">
				</div>
			</div>
			<div id="tech_img_1">
				<img src="../images/hybrid/common/tech_0.jpg">
			</div>
			<div id="tech_img_2">
				<img src="../images/hybrid/common/tech_1.jpg">
			</div>
			
			
		<!-- 스타일 소개 -->
			
			<div class="section_title">
				<div id="style_img">
					<img src="../images/hybrid/title/style.png">
				</div>
			</div>
			<div id="style_img_1">
				<img src="../images/hybrid/common/style_0.jpg">
			</div>
			<div id="style_img_2">
				<img src="../images/hybrid/common/style_1.jpg">
			</div>
			
		<!-- 소개 영상 -->
			
			<div class="section_title">
				<div id="introduce_img">
					<img src="../images/hybrid/title/introduce.png">
				</div>
			</div>
			<div id="introduce_video">
				<iframe style="width: 100%; max-width: 880px; height: 480px;" src="https://www.youtube.com/embed/P9q85C32v44" frameborder="0" allowfullscreen>
				</iframe>
			</div>
			
		<!-- 제원 소개 -->
			
			<div class="section_title">
				<div id="spec_img">
					<img src="../images/hybrid/title/spec.png">
				</div>
			</div>
			<div id="spec_img_1">
				<img src="../images/hybrid/common/intro_0.gif">
			</div>
			<div id="spec_table">
				<table>
					<tr id="tr_sub">
						<td>구분</td>
						<td>카파 1.6 GDi</td>
					</tr>
					<tr class="tr_1">
						<td class="td_1">전장 (mm)</td>
						<td class="td_2">4,470</td>
					</tr>					
					<tr class="tr_2">
						<td class="td_1">전폭 (mm)</td>
						<td class="td_2">1,820</td>
					</tr>
					<tr class="tr_1">
						<td class="td_1">전고 (mm)</td>
						<td class="td_2">1,450</td>
					</tr>
					<tr class="tr_2">
						<td class="td_1">축간거리 (mm)</td>
						<td class="td_2">2,700</td>
					</tr>
					<tr class="tr_1">
						<td class="td_1">윤거 전 (mm)</td>
						<td class="td_2">1,563(15")/1,549(17")</td>
					</tr>
					<tr class="tr_2">
						<td class="td_1">윤거 후 (mm)</td>
						<td class="td_2">1,577(15")/1,563(17")</td>
					</tr>
					<tr class="tr_1">
						<td class="td_1">엔진형식</td>
						<td class="td_2">카파 1.6 GDi</td>
					</tr>
					<tr class="tr_2">
						<td class="td_1">배기량 (cc)</td>
						<td class="td_2">1,580</td>
					</tr>
					<tr class="tr_1">
						<td class="td_1">최고출력 (PS/rpm)</td>
						<td class="td_2">105/5,700</td>
					</tr>
					<tr class="tr_2">
						<td class="td_1">최대토크 (kgf·m/rpm)</td>
						<td class="td_2">15.0/4,000</td>
					</tr>
					<tr class="tr_1">
						<td class="td_1">연료탱크용량 (ℓ)</td>
						<td class="td_2">45</td>
					</tr>
					<tr class="tr_2">
						<td class="td_1">모터형식</td>
						<td class="td_2">영구자석형 동기모터(PMSM)</td>
					</tr>
					<tr class="tr_1">
						<td class="td_1">모터 최고출력 (PS/rpm)</td>
						<td class="td_2">43.5(32kW)/1,798~2,500</td>
					</tr>
					<tr class="tr_2">
						<td class="td_1">모터 최대토크 (kg.m/rpm)</td>
						<td class="td_2">17.3(170Nm)/0~1,798</td>
					</tr>
				</table>
			</div>

		
		</section>
	</section>
<!-- section 종료 -->	

<%@ include file="../templete/footer.jsp"%>
</body>
</html>