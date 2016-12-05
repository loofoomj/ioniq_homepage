package com.jose.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jose.util.BoardDAO;
import com.jose.util.BoardDTO;
import com.jose.util.DBConnector;
import com.jose.util.PageMaker;

import oracle.jdbc.proxy.annotation.Pre;

public class NoticeDAO implements BoardDAO{

	@Override
	//리스트
	public ArrayList<BoardDTO> boardList(PageMaker pm) {
			Connection con = DBConnector.getConnect();
			PreparedStatement st = null;
			ResultSet rs = null;
			ArrayList<BoardDTO> ar = new ArrayList<>();
			String sql="select * from"
					+ " (select rownum R, T.* from"
					+ " (select * from notice order by num desc) T)"
					+ " where R between ? and ?";
			try {
				st = con.prepareStatement(sql);
				st.setInt(1, pm.getRowStart());
				st.setInt(2, pm.getRowLast());
				rs = st.executeQuery();
				while(rs.next()){
					NoticeDTO nDto = new NoticeDTO();
					nDto.setNum(rs.getInt("num"));
					nDto.setTitle(rs.getString("title"));
					nDto.setWriter(rs.getString("writer"));
					nDto.setReg_date(rs.getDate("reg_date"));
					nDto.setCount(rs.getInt("count"));
					ar.add(nDto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			DBConnector.disConnect(rs, st, con);
			return ar;
		}

	@Override
	//글쓰기
	public int boardWrite(BoardDTO bDto) {
		int result=0;
		Connection con = DBConnector.getConnect();
		PreparedStatement st = null;
		String sql ="insert into notice values ("
				+ "not_seq.nextval, ?,?,?,sysdate,0,'notice')";
		try {
			st = con.prepareStatement(sql);
			st.setString(1, bDto.getTitle());
			st.setString(2, bDto.getWriter());
			st.setString(3, bDto.getContent());
			result = st.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			result=0;
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	//글읽기
	public BoardDTO boardView(int num) {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set count=count+1 where num=?";
		PreparedStatement st = null;
		ResultSet rs = null;
		NoticeDTO nDto = new NoticeDTO();
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, num);
			st.executeQuery();
			st.close();
			
			sql = "select * from notice where num=?";
			st = con.prepareStatement(sql);
			st.setInt(1, num);
			rs = st.executeQuery();
			if(rs.next()){
				nDto.setNum(rs.getInt("num"));
				nDto.setTitle(rs.getString("title"));
				nDto.setWriter(rs.getString("writer"));
				nDto.setContent(rs.getString("content"));
				nDto.setReg_date(rs.getDate("reg_date"));
				nDto.setCount(rs.getInt("count"));
			}else {
				nDto=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(rs, st, con);
		return nDto;
	}

	@Override
	//글수정
	public BoardDTO boardMod(int num) {
		Connection con = DBConnector.getConnect();
		String sql = "select * from notice where num=?";
		PreparedStatement st = null;
		ResultSet rs = null;
		NoticeDTO nDto = new NoticeDTO();
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, num);
			rs = st.executeQuery();
			if(rs.next()){
				nDto.setNum(rs.getInt("num"));
				nDto.setTitle(rs.getString("title"));
				nDto.setWriter(rs.getString("writer"));
				nDto.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(rs, st, con);
		return nDto;
	}
	
	@Override
	//글수정프로세스
	public int boardModProcess(BoardDTO bDto) {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?, content=?, writer=? where num=?";
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, bDto.getTitle());
			st.setString(2, bDto.getContent());
			st.setString(3, bDto.getWriter());
			st.setInt(4, bDto.getNum());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	//글삭제
	public int boardDelete(int num) {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql = "delete notice where num=?";
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, num);
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public String boardKind() {
		String kind = "notice";
		return kind;
	}
	
	

}
