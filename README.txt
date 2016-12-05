
페이지 소스 설명



1. /HTML_page/WebContent/

디렉토리 내부에 jsp 및 css 파일이 있습니다.


index.jsp : main 화면을 구성하는 jsp 로 동영상을 이용해 메인을 만들었습니다.

	    header와 footer는 templete 폴더에 각각 header.jsp / footer.jsp 로 구현하여

	    각 페이지의 아래위에서 불러오는 방식을 사용하고 있습니다.


hybrid, electronic 폴더 : 페이지의 첫번째, 두번째 메뉴인 차량 설명 페이지 입니다.


board 폴더 : 간단한 게시판을 구현하였으며, notice와 support 두종류의 게시판을 제작했습니다

	     각 페이지에서 작성, 수정, 삭제를 구현했으며 회원가입 여부에 따른 접근 제한을 구현했습니다.

	     글 작성 페이지는 ckeditor 를 이용했습니다.

	     데이터베이스는 Oracle 11g Database 상에서 제작되었습니다.


auth 폴더 : 회원가입, 로그인, 로그아웃에 관한 페이지 입니다.


member 폴더 : 회원 정보, 수정, 탈퇴 에 관한 페이지 입니다.


css : 각 페이지에 사용된 css들에 관한 폴더입니다.



2. /HTML_page/src/com/jose/

디렉토리 내부에 java 파일이 있습니다.

DTO 및 DAO 파일이 있으며

Database에 연결하는 연결부 및 쿼리문을 작성하는 java 파일 또한 포함되어 있습니다.


member 폴더 : 회원가입 등에 관련된 java 파일


notice, supoort 폴더 : 게시판에 관련된 java 파일


util : DB에 연결하는 java 파일 등
