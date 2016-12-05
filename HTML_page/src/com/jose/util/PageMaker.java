package com.jose.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PageMaker {
	private int perPage;
	private int curPage;
	private int rowStart;
	private int rowLast;
	private int curBlock;
	private int totalBlock;
	private int start;
	private int last;
	
	
	
	public int getRowStart() {
		return rowStart;
	}

	public int getRowLast() {
		return rowLast;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public int getStart() {
		return start;
	}

	public int getLast() {
		return last;
	}

	public PageMaker(int curPage, int perPage){
		this.curPage = curPage;
		this.perPage = perPage;
		this.makeRowNum();
	}
	
	private void makeRowNum(){
		rowStart = (curPage-1)*perPage+1;
		rowLast = curPage*perPage;
	}
	
	//총 글의 갯수
	public int getPage(String part){
		int result = 0;
		Connection con = DBConnector.getConnect();
		String sql = "select count(num) from "+part;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	
	public void makePageing(String part){
		//1. 총 글의 수
		int totalCount = this.getPage(part);
		
		//2. 총 페이지 수
		int totalPage=0;
		if(totalCount%perPage==0){
			totalPage = totalCount/perPage;
		}else{
			totalPage = totalCount/perPage+1;
		}
		
		//3. 총 블럭 수
		totalBlock=0;
		int perBlock=10;
		if(totalPage%perBlock==0){
			totalBlock = totalPage/perBlock;
		}else{
			totalBlock = totalPage/perBlock+1;
		}
		
		
		//4. curPage 이용 현재 블럭 구하기
		curBlock=0;
		if(curPage%perBlock==0){
			curBlock = curPage/perBlock;
		}else{
			curBlock = curPage/perBlock+1;
		}
		
		//5. 현재 블럭 이용 start, last 구하기
		start = (curBlock-1)*perBlock+1;
		last = curBlock*perBlock;
		
		
		
		if(curBlock==totalBlock){
			last = totalPage;
		}
		
	}

}
