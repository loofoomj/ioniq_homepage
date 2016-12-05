package com.jose.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnector {
	
	//연결하기
	public static Connection getConnect(){
		Connection con = null;
		//1. 4가지 정보 담기
		String user="jose";
		String password="jose";
		String url="jdbc:oracle:thin:@192.168.16.1:1521:xe";
		String driver="oracle.jdbc.driver.OracleDriver";
		//2. 드라이버를 메모리에 로딩
		try {
			Class.forName(driver);
			//3. connection
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	//연결끊기-1
	public static void disConnect(PreparedStatement st, Connection con){
		try {
			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//연결끊기-2
	public static void disConnect(ResultSet rs, PreparedStatement st, Connection con){
		try {
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
