<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link rel="stylesheet" type="text/css" href="../css/signin_form.css">
</head>
<script type="text/javascript">
	function allCheck(){
		var all = document.getElementById("check_2");
		var ch = document.getElementsByClassName("check_1");
		for(var i=0;i<ch.length;i++){
			if(ch[i])
			ch[i].checked=all.checked;
		}
	}
	function agree(){
		var ch = document.getElementsByClassName("check_1");
		var result = 0;
		for(var i=0;i<ch.length;i++){
			if(ch[i].checked){
				result++;
			}
		}
		if(result!=2){
			alert("약관에 모두 동의해야 회원가입이 가능합니다.");
		}else{
			location.href="<%=application.getContextPath() %>/auth/signin.jsp";
		}
	}
	
	function disagree(){
		location.href="<%=application.getContextPath() %>/auth/login.jsp";
	}

</script>

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
			
			<div id="agree_title">
				<p>약관동의</p>
			</div>
			<div class="agree_box">
				<div id="title"><p>홈페이지 이용약관</p></div>
				<div id="text_box">
					<textarea draggable="false" readonly="readonly">
제1조 (목적)
1. 이 약관은 전기통신 사업법 및 동 법 시행령에 의하여 현대자동차(주) (이하 "회사" 라 합니다.)가 제공하는 인터넷 홈페이지 서비스 (이하 "서비스" 라 합니다.)의 이용조건 및 절차에 관한 사항, 회사와 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다.
제2조 (약관의 효력과 개정)
1. 이 약관은 전기통신사업법 제 31 조, 동 법 시행규칙 제 21조의 2에 따라 공시절차를 거친 후 홈페이지를 통하여 이를 공지하거나 전자우편 기타의 방법으로 이용자에게 통지함으로써 효력을 발생합니다.
2. 회사는 본 약관을 사전 고지 없이 개정할 수 있으며, 개정된 약관은 제9조에 정한 방법으로 공지합니다. 회원은 개정된 약관에 동의하지 아니하는 경우 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용의 경우는 약관 개정에 대한 동의로 간주됩니다. 개정된 약관은 공지와 동시에 그 효력이 발생됩니다.
제3조 (약관 이외의 준칙)
1. 이 약관에 명시되어 있지 않은 사항은 전기통신 기본법, 전기통신 사업법, 기타 관련법령의 규정에 따릅니다.
제4조 (용어의 정의)
1. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 회원 : 서비스에 개인정보를 제공하여 회원등록을 한 자로서, 서비스의 정보를 지속적으로 제공받으며, 이용할 수 있는 자를 말합니다.
2. 이용자 : 본 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
3. 전자우편 (E-mail) : 인터넷을 통한 우편을 말하며, 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 이메일 조합을 말합니다.
4. 비밀번호 : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합을 말합니다.
5. 해지 : 회사 또는 회원이 서비스 이용 이후 그 이용계약을 종료 시키는 의사표시를 말합니다.
6. 홈페이지 : 회사가 이용자에게 서비스를 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 이용자가 열람 및 이용할 수 있도록 설정한 가상의 서비스 공간을 말합니다.
제5조 (서비스의 제공 및 변경)
1. 회사가 제공하는 서비스는 다음과 같습니다.
회사에 대한 홍보 내용
회사가 판매하는 제품 안내
기타 회사가 제공하는 각종 정보
고객 상담 서비스
회원 이용 서비스
2. 회사는 필요한 경우 서비스의 내용을 추가 또는 변경하여 제공할 수 있습니다.
제6조 (서비스의 중단)
1. 회사는 컴퓨터 등 정보통신설비의 보수점검/교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
2. 제 1항에 의한 서비스 중단의 경우에는 제 9조에 정한 방법으로 이용자에게 통지합니다.
3. 회사는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상하지 아니합니다. 단, 회사에 고의 또는 중과실이 있는 경우에는 그러하지 아니합니다.
제7조 (회원가입)
1. 이용자는 회사가 정한 가입양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
2. 회사는 제 1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
등록 내용에 허위, 기재누락, 오기가 있는 경우
가입신청자가 이 약관 제 8조 3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우(단, 제 8조 3항에 의한 회원자격 상실 후 3년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우는 예외로 합니다.
기타 회원으로 회사 소정의 이용신청요건을 충족하지 못하는 경우
3. 회원가입계약의 성립시기는 회사의 승낙이 이용자에게 도달한 시점으로 합니다.
4. 회원은 제 10조 1항에 의한 등록사항에 변경이 있는 경우 회원정보변경 항목을 통해 직접 변경사항을 수정, 등록하여야 합니다.
제8조 (회원탈퇴 및 자격 상실 등)
1. 회원은 언제든지 회원의 탈퇴를 홈페이지에 요청할 수 있으며, 홈페이지는 즉시 이에 응합니다.
2. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원자격을 제한 및 정지시킬 수 있습니다.
가입 신청 시에 허위 내용을 등록한 경우
타인의 서비스 이용을 방해하거나 그 정보를 도용하는 등 서비스 운영질서를 위협하는 경우
서비스를 이용하여 법령과 이 약관이 금지하거나, 공서양속에 반하는 행위를 하는 경우
제 13조 에 명기된 회원의 의무사항을 준수하지 못할 경우
3. 회사가 회원자격을 제한/정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회사는 회원자격을 상실 시킬 수 있습니다.
4. 회사가 회원자격을 상실 시키는 경우 회원에게 이를 통지하고 탈퇴를 처리합니다. 이 경우 회원에게 이를 통지하고, 탈퇴 전에 소명할 기회를 부여합니다.
제 9조 (이용자에 대한 통지)
1. 회사가 이용자에 대한 통지를 하는 경우, 이용자가 서비스에 제출한 전자우편 주소로 할 수 있습니다.
2. 회사가 불특정 다수 이용자에 대한 통지의 경우 1주일 이상 서비스 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.
제 10조 (개인 정보 보호)
1. 회사는 이용자 정보 수집 시 회사측이 필요한 최소한의 정보를 수집합니다.
다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.
e-mail(ID로 사용), 이름, 전화번호(휴대전화), 생년월일, 성별, 주소, 서비스이용기록, 접속로그, 쿠키, 접속IP정보
2. 회사가 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
3. 제공된 개인정보는 당해 이용자의 동의 없이 제 3자에게 제공할 수 없으며, 이에 대한 모든 책임은 회사가 집니다. 다만 다음의 경우에는 예외로 합니다.
배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우
통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
관계법령에 의하여 국가기관으로부터 요구 받은 경우
범죄에 대한 수사상의 목적이 있거나, 정보통신 윤리위원회의 요청이 있는 경우
기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
4. 이용자는 언제든지 회사가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 할 수 있습니다.
5. 회사로부터 개인정보를 제공받은 제 3자는 개인정보를 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
제 11조 (회사의 의무)
1. 회사는 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야만 합니다.
2. 회사는 서비스에 관련된 설비를 항상 운용할 수 있는 상태로 유지/보수하고, 장애가 발생하는 경우 지체 없이 이를 수리/복구할 수 있도록 최선의 노력을 다하여야 합니다.
3. 회사는 이용자가 안전하게 서비스를 이용할 수 있도록 이용자의 개인정보보호를 위한 보안시스템을 갖추어야 합니다.
4. 회사는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
제 12조 (회원의 ID 및 비밀번호에 대한 의무)
1. 회원에게 부여된 이메일 아이디(ID)와 비밀번호의 관리책임은 회원에게 있으며 관리 소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
2. 회원이 자신의 이메일 ID 및 비밀번호를 도난 당하거나 제 3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.
제 13조 (회원의 의무)
1. 회원은 관계법령, 본 약관의 규정, 이용안내 및 주의사항 등 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안됩니다.
2. 회원은 회사의 사전승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.
3. 회원은 서비스를 이용하여 얻은 정보를 회사의 사전승낙 없이 복사, 복제, 변경, 번역, 출판/방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
4. 회원은 자기 신상정보의 변경사항 발생시 즉각 변경하여야 합니다.
회원정보를 수정하지 않아 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
5. 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하지 않아야 하며, 다음 행위를 함으로 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
다른 회원의 이메일 아이디(ID)를 부정하게 사용하는 행위
다른 회원의 E-mail 주소를 취득하여 스팸메일을 발송하는 행위
범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
선량한 풍속, 기타 사회질서를 해하는 행위
회사 및 타인의 명예를 훼손하거나 모욕하는 행위
회사 및 타인의 지적재산권 등의 권리를 침해하는 행위
해킹행위 또는 컴퓨터 바이러스의 유포행위
타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
회사가 제공하는 서비스의 내용을 변경하는 행위
기타 관계법령에 위배되는 행위
제 14조 (게시물 삭제)
1. 회사는 이용자가 게시하거나 등록하는 서비스내의 게시물이 제 13조의 규정에 위반되거나, 다음 각 호에 해당한다고 판단되는 경우 사전통지 없이 게시물을 삭제할 수 있습니다.
다른 이용자 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용
공공질서 또는 미풍양속에 위반되는 내용
범죄적 행위에 결부된다고 인정되는 내용
제 3자의 저작권 등 기타 권리를 침해하는 내용
서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 내용
근거나 확인절차 없이 회사를 비난하거나 유언비어를 유포한 내용
기타 관계법령에 의거하여 위반된다고 판단되는 내용
2. 회사는 이용자가 게시하거나 등록하는 서비스내의 게시물이 제 13조의 규정에 위반되거나 동 조 제1항 각 호에 해당한다고 판단되는 정보를 링크하고 있을 경우 사전통지 없이 게시물을 삭제할 수 있습니다.
제 15조 (게시물에 대한 권리 / 의무)
1. 게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 이용자에게 있습니다.
제 16조 (연결 "홈페이지"와 피연결 "홈페이지"간의 관계)
1. 상위 "홈페이지"와 하위 "홈페이지"가 하이퍼 링크(예:하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨) 방식 등으로 연결된 경우, 전자를 연결 "홈페이지"라고 하고 후자를 피연결 "홈페이지(웹사이트)"라고 합니다.
2. 연결 "홈페이지"는 피연결 "홈페이지"가 독자적으로 제공하는 재화•용역에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않습니다.
제 17조 (저작권의 귀속 및 이용제한)
1. 회사가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 회사에 귀속합니다.
2. 이용자는 서비스를 이용함으로써 얻은 정보를 회사의 사전승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다.
제 18조 (양도금지)
1. 회원이 서비스의 이용권한, 기타 이용 계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.
제 19조 (손해배상)
1. 회사는 무료로 제공되는 서비스와 관련하여 이용자에게 어떠한 손해가 발생하더라도 동 손해가 회사의 중대한 과실에 의한 경우를 제외하고 이에 대하여 책임을 부여하지 아니합니다.
제 20조 (면책 / 배상)
1. 회사는 이용자가 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 이용자는 자신의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 서비스 이용과 관련하여 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있습니다.
2. 회사는 제 13조의 규정에 위반하여 이용자간 또는 이용자와 제 3자간에 서비스를 매개로 한 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 이용자가 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.
3. 이용자가 제 13조, 기타 이 약관의 규정을 위반함으로 인하여 회사가 이용자 또는 제 3자에 대하여 책임을 부담하게 되고, 이로써 회사에게 손해가 발생하게 되는 경우, 이 약관을 위반한 이용자는 회사에게 발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 회사를 면책시켜야 합니다.
제 21조 (분쟁의 해결)
1. 회사와 이용자는 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.
2. 제 1항의 규정에도 불구하고, 동 분쟁으로 인하여 소송이 제기될 경우 동 소송은 서울지방법원을 관할로 합니다.
3. 동 소송에는 대한민국 법을 적용합니다.
제 22조 (기타)
1. 이 약관에 명시되지 아니한 사항의 처리를 위하여 이용자는 현대자동차 고객센터.(전화번호 : 080-600-6000)를 이용합니다.
부칙
1. 이 약관은 2012년 8월 20일부터 시행합니다.</textarea>
				</div>
				<div id="check_box">
					<input type="checkbox" class="check_1">
					<p>홈페이지 이용약관에 동의합니다. (동의하지 않을 경우 가입되지 않습니다)</p>
				</div>
			</div>
			<div id="gap"></div>
			<div class="agree_box">
				<div id="title"><p>개인정보의 수집 및 이용에 대한 동의</p></div>
				<div id="text_box">
					<textarea draggable="false" readonly="readonly">
■ 개인정보의 수집 및 이용목적
고객관리 (필수서비스), 카탈로그 신청 시 배송, 구매상담 신청 시 상담, 시승서비스 예약 시 이용, 이벤트 참여 시 경품/DM 배송, 회원제 서비스의 본인 확인, 서비스에 대한 만족도 조사
■ 개인정보의 수집 항목 및 수집 방법
- 수집항목
채널별 구분	필수 수집 항목	추가 수집 항목
홈페이지 회원	e-mail(ID로 사용), 이름, 휴대전화 번호, 본인인증값, 성별, 생년월일, 내/외국인 구별, 서비스 이용기록, 접속로그, 쿠키, 접속 IP 정보	주소, 차대번호, 등록번호
이벤트 및 추가적인 개인정보를 수집시, 수집항목에 대해 필수/선택에 대해 구분하며, 해당페이지 및 서면 등에서 개인정보의 수집 목적 보유 기간 등을 고객에게 고지하고 추가적인 동의를 받겠습니다.
- 개인정보 수집방법
홈페이지(www.hyundai.com) 회원가입 및 서비스 이용, 서면, 전자우편, 전화, 이벤트 응모 등
※ 위 개인정보는 수집 당시 개인정보의 내용은 물론 사후 변경된 개인정보의 내용을 보유하는 경우도 포함합니다.
■ 개인정보의 보유 및 이용기간
1. 회사는 고객님의 개인정보를 수집한 때로부터 개인정보의 수집 및 이용에 관한 동의 목적을 달성할 때까지 기간 동안에 한하여 고객님의 개인정보를 보유 및 이용하며, 개인정보 수집 및 이용목적이 달성된 경우에는 해당 정보를 지체 없이 파기합니다.
2. 단, 상법 등 관련법령의 규정에 의하여 보존할 의무가 있는 경우 회사는 고객님의 개인정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 다음과 같습니다.
회사의 상업장부와 영업에 관한 중요서류 및 전표 등에 관련된 정보
보존이유 : 상법
보존기간 : 10년 - 중요서류 / 5년 - 전표
모든 거래에 관한 장부 및 증빙서류와 관련된 정보
보존이유 : 국세기본법, 법인세법
보존기간 : 5년
계약 또는 청약철회 등에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록
보존이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존기간 : 5년
소비자의 불만 또는 분쟁처리에 관한 기록
보존이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존기간 : 3년
장부와 교부한 세금계산서 또는 영수증
보존이유 : 부가가치세법
보존기간 : 5년</textarea>
				</div>
				<div id="check_box">
					<input type="checkbox" class="check_1">
					<p>개인정보의 수집 · 이용에 동의합니다. (동의하지 않을 경우 가입되지 않습니다)</p>
				</div>
				<div id="check_box">
					<input type="checkbox" id="check_2" onclick="allCheck()">
					<p>모두 동의합니다</p>
				</div>
			</div>
			<div id="button_area">
				<div id="button_box_area">
					<button id="agree" onclick="agree()" style="cursor: pointer;">동의</button>
					<button id="disagree" onclick="disagree()" style="cursor: pointer;">동의하지 않습니다</button>
				</div>
			</div>

		</section>
	</section>
<!-- section 종료 -->	

<%@ include file="../templete/footer.jsp"%>

</body>
</html>