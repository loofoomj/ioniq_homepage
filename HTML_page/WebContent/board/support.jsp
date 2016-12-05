<%@page import="com.jose.support.SupportDTO"%>
<%@page import="com.jose.support.SupportDAO"%>
<%@page import="com.jose.member.MemberDTO"%>
<%@page import="com.jose.util.FreeboardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jose.util.PageMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int curPage=1;
	int perPage=10;
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));		
	}catch(Exception e){
		curPage=1;
	}
	SupportDAO sDao = new SupportDAO();
	PageMaker pm = new PageMaker(curPage, perPage);
	pm.makePageing(sDao.freeboardKind());
	List<FreeboardDTO> ar = sDao.freeList(pm);
	
	String admin = "";
	MemberDTO mDto = (MemberDTO) session.getAttribute("member");
	if(mDto!=null){
		admin = mDto.getKind();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link rel="stylesheet" type="text/css" href="../css/notice.css">
</head>
<body>
<%@ include file="../templete/header.jsp"%>
<!-- section 시작 -->
	<section>
		<div id="main_section">
			<div id="title">
				<p>고객지원</p>
			</div>
			<div id="list">
				<table>
					<tr class="subject">
						<td class="num">번호</td>
						<td>제목</td>
						<td class="writer">글쓴이</td>
						<td class="date">날짜</td>
						<td class="click">조회</td>
					</tr>
					<% for(int i=0;i<ar.size();i++) { 
							if(i%2==0){%>
								<tr class="even">
							<%}else{%>
								<tr class="odd">
							<%} %>
									<td class="num"><%=ar.get(i).getNum() %></td>
									<td class="title">
									<%for(int j=0;j<ar.get(i).getDepth();j++){%>
										&nbsp;&nbsp;
										<%if(j==ar.get(i).getDepth()-1){%>
											<img src="<%=application.getContextPath()%>/images/icon/reply.png" width="12px" >
										<%} %>
											
									<%}%>
									<a href="support/supportView.jsp?num=<%= ar.get(i).getNum() %>&curPage=<%=curPage %>&kind=<%=sDao.freeView(ar.get(i).getNum()).getKind()%>" style="text-decoration: none;"><%=ar.get(i).getTitle() %></a></td>
									<td class="writer"><%=ar.get(i).getWriter() %></td>
									<td class="date"><%=ar.get(i).getReg_date() %></td>
									<td class="click"><%=ar.get(i).getCounts() %></td>
							</tr>
					<%} %>
				</table>
			</div>
			<%if(mDto!=null){ %>
			<div id="button">
				<a href="<%=application.getContextPath()%>/board/support/supportWrite.jsp?curPage=<%=curPage%>&kind=write"><button id="write_button" style="cursor: pointer;">글쓰기</button></a>
			</div>
			<%} %>
			<div id="pages">
				<div>
					<%if(pm.getCurBlock()>1){ %>
						<a href="support.jsp?curPage=<%=pm.getStart()-1%>">이전</a>
					<%} %>
					<%for(int i=pm.getStart();i<=pm.getLast();i++){ %>
						<a href="support.jsp?curPage=<%=i %>"><%=i %></a>
					<%} %>
					<%if(pm.getCurBlock()<pm.getTotalBlock()){ %>
						<a href="support.jsp?curPage=<%=pm.getLast()+1 %>">다음</a>
					<%} %>
				</div>
			</div>
			<div id="search">
				<div>
					<input type="text">
					<button>찾기</button>
				</div>
			</div>
		</div>
	</section>
<!-- section 종료 -->	

<%@ include file="../templete/footer.jsp"%>

</body>
</html>