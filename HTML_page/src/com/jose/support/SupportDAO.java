package com.jose.support;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jose.util.DBConnector;
import com.jose.util.FreeboardDAO;
import com.jose.util.FreeboardDTO;
import com.jose.util.PageMaker;

public class SupportDAO implements FreeboardDAO{

	//댓글
	@Override
	public int freeReply(FreeboardDTO f) {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql = "update support set step=step+1 where ref=? and step>?";
		FreeboardDTO parent = this.freeView(f.getNum());
		System.out.println(parent.getRef());
		System.out.println(parent.getStep());
		System.out.println(parent.getDepth());
		
		PreparedStatement st = null;
		try {
			con.setAutoCommit(false);
			st = con.prepareStatement(sql);
			st.setInt(1, parent.getRef());
			st.setInt(2, parent.getStep());
			result = st.executeUpdate();
			st.close();
			sql = "insert into support values("
					+ "sup_seq.nextval,?,?,?,sysdate,0,?,?,?,'reple')";
			st = con.prepareStatement(sql);
			st.setString(1, f.getWriter());
			st.setString(2, f.getTitle());
			st.setString(3, f.getContents());
			st.setInt(4, parent.getRef());
			st.setInt(5, parent.getStep()+1);
			st.setInt(6, parent.getDepth()+1);
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
			e.printStackTrace();
		}
		DBConnector.disConnect(st, con);
		return result;
	}
	//뷰
	@Override
	public SupportDTO freeView(int num) {
		Connection con = DBConnector.getConnect();
		String sql ="select * from support where num=?";
		PreparedStatement st = null;
		ResultSet rs = null;
		SupportDTO sDto = new SupportDTO();
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, num);
			rs = st.executeQuery();
			if(rs.next()){
				sDto.setNum(rs.getInt("num"));
				sDto.setTitle(rs.getString("title"));
				sDto.setWriter(rs.getString("writer"));
				sDto.setContents(rs.getString("contents"));
				sDto.setReg_date(rs.getDate("reg_date"));
				sDto.setCounts(rs.getInt("counts"));
				sDto.setRef(rs.getInt("ref"));
				sDto.setDepth(rs.getInt("depth"));
				sDto.setStep(rs.getInt("step"));
				sDto.setKind(rs.getString("kind"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		DBConnector.disConnect(rs, st, con);
		return sDto;
	}
	//글쓰기
	@Override
	public int freeWrite(FreeboardDTO f) {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql = "insert into support values("
				+ "sup_seq.nextval,?,?,?,sysdate,0,sup_seq.currval,0,0,'write')";
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, f.getWriter());
			st.setString(2, f.getTitle());
			st.setString(3, f.getContents());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(st, con);
		return result;
	}
	//리스트
	@Override
	public List<FreeboardDTO> freeList(PageMaker pm) {
		Connection con = DBConnector.getConnect();
		String sql ="select * from "
				+ "(select rownum R, F.* from "
				+ "(select * from support order by ref desc, step asc) F) "
				+ "where R between ? and ?";
		PreparedStatement st = null;
		ResultSet rs = null;
		List<FreeboardDTO> ar = new ArrayList<>();
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, pm.getRowStart());
			st.setInt(2, pm.getRowLast());
			rs = st.executeQuery();
			while(rs.next()){
				SupportDTO sDto = new SupportDTO();
				sDto.setNum(rs.getInt("num"));
				sDto.setWriter(rs.getString("writer"));
				sDto.setTitle(rs.getString("title"));
				sDto.setContents(rs.getString("contents"));
				sDto.setReg_date(rs.getDate("reg_date"));
				sDto.setCounts(rs.getInt("counts"));
				sDto.setDepth(rs.getInt("depth"));
				sDto.setKind(rs.getString("kind"));
				ar.add(sDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.getConnect();
		return ar;
	}
	//수정
	@Override
	public FreeboardDTO freeboardMod(int num) {
		Connection con = DBConnector.getConnect();
		String sql = "select * from support where num=?";
		PreparedStatement st = null;
		ResultSet rs = null;
		SupportDTO sDto = new SupportDTO();
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, num);
			rs = st.executeQuery();
			if(rs.next()){
				sDto.setNum(rs.getInt("num"));
				sDto.setTitle(rs.getString("title"));
				sDto.setWriter(rs.getString("writer"));
				sDto.setContents(rs.getString("contents"));
				sDto.setKind(rs.getString("kind"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(rs, st, con);
		return sDto;
	}
	//수정프로세스
	@Override
	public int freeboardModProcess(FreeboardDTO f) {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql = "update support set title=?, contents=?, writer=? where num=?";
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, f.getTitle());
			st.setString(2, f.getContents());
			st.setString(3, f.getWriter());
			st.setInt(4, f.getNum());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(st, con);
		return result;
	}
	//삭제
	@Override
	public int freeboardDelete(int num) {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql = "delete support where num=?";
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
	public String freeboardKind() {
		String kind = "support";
		return kind;
	}
	
	
	
	
	
}
