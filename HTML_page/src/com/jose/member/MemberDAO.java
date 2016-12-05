package com.jose.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jose.util.DBConnector;

import oracle.jdbc.proxy.annotation.Pre;

public class MemberDAO {
	
	//회원가입
	public int memberJoin(MemberDTO mDto){
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql = "select max(num) from member";
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			rs.next();
			result = rs.getInt(1);
			
			rs.close();
			st.close();
			
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,'member')";
			st = con.prepareStatement(sql);
			st.setInt(1, result+1);
			st.setString(2, mDto.getId());
			st.setString(3, mDto.getPw());
			st.setString(4, mDto.getName());
			st.setString(5, mDto.getGender());
			st.setString(6, mDto.getBirth());
			st.setString(7, mDto.getEmail());
			st.setString(8, mDto.getPhone());
			st.setString(9, mDto.getAdress());
			st.setString(10, mDto.getSubadress());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	//로그인
	public MemberDTO memberLogin(MemberDTO mDto){
		Connection con = DBConnector.getConnect();
		String sql = "select * from member where id=? and password=?";
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, mDto.getId());
			st.setString(2, mDto.getPw());
			rs = st.executeQuery();
			if(rs.next()){
				mDto.setId(rs.getString("id"));
				mDto.setPw(rs.getString("password"));
				mDto.setKind(rs.getString("kind"));
			}else {
				mDto.setKind("");
				mDto=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(rs, st, con);
		return mDto;
	}
	
	//정보보기
	public MemberDTO memberInfo(MemberDTO mDto){
		Connection con = DBConnector.getConnect();
		String sql = "select * from member where id=?";
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, mDto.getId());
			rs = st.executeQuery();
			if(rs.next()){
				mDto.setId(rs.getString("id"));
				mDto.setPw(rs.getString("password"));
				mDto.setName(rs.getString("name"));
				mDto.setGender(rs.getString("gender"));
				mDto.setBirth(rs.getString("birth"));
				mDto.setEmail(rs.getString("email"));
				mDto.setPhone(rs.getString("phone"));
				mDto.setAdress(rs.getString("adress"));
				mDto.setSubadress(rs.getString("subadress"));
				mDto.setKind(rs.getString("kind"));
			}else {
				mDto.setKind("");
				mDto=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(rs, st, con);
		return mDto;
	}
	//회원탈퇴
	public int memberDel(MemberDTO mDto){
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql ="delete member where id=?";
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, mDto.getId());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//회원정보수정
	public int memberMod(MemberDTO mDto){
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql ="update member set password=?, name=?, gender=?, birth=?, email=?, phone=?, adress=?, subadress=? where id=?";
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, mDto.getPw());
			st.setString(2, mDto.getName());
			st.setString(3, mDto.getGender());
			st.setString(4, mDto.getBirth());
			st.setString(5, mDto.getEmail());
			st.setString(6, mDto.getPhone());
			st.setString(7, mDto.getAdress());
			st.setString(8, mDto.getSubadress());
			st.setString(9, mDto.getId());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnector.disConnect(st, con);
		return result;
	}
	
}
