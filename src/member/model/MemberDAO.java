package member.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.Member;

public class MemberDAO {

	private DataSource ds;
	MemberDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}
	}
	
	Boolean join(Member m){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = MemberSQL.JOIN;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, m.getM_id());
	    	pstmt.setString(2, m.getM_pwd());
	    	pstmt.setString(3, m.getM_name());
	    	pstmt.setDate(4, m.getM_birth());
	    	pstmt.setString(5, m.getM_phone());
	    	pstmt.setString(6, m.getM_email());
	    	pstmt.setString(7, m.getM_addr());
	    	pstmt.setString(8, m.getM_addr2());
	    	int i = pstmt.executeUpdate();
	    	if(i>0) return true;
			else return false;
	    }catch(SQLException se) {
	    	System.out.println(se);
	    	return false;
	    }finally {
	    	try {
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
	boolean quit(Member m){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = MemberSQL.QUIT;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, m.getM_id());
	    	pstmt.setString(2, m.getM_pwd());
	    	pstmt.setString(3, m.getM_name());
	    	pstmt.setDate(4, m.getM_birth());
	    	pstmt.setString(5, m.getM_phone());
	    	pstmt.setString(6, m.getM_email());
	    	pstmt.setString(7, m.getM_addr());
	    	pstmt.setString(8, m.getM_addr2());
	    	int i = pstmt.executeUpdate();
	    	if(i>0) return true;
			else return false;
	    }catch(SQLException se) {
	    	System.out.println(se);
	    	return false;
	    }finally {
	    	try {
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
	
	boolean clean(Member m){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = MemberSQL.CLEAN;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getM_id());
			int i = pstmt.executeUpdate();
	    	if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			return false;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	Member getMember(String id){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = MemberSQL.CHECK;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, id);
	    	rs	= pstmt.executeQuery();
	    	if(rs.next()) {
	    		String m_id = rs.getString("M_ID");
	    		String m_pwd = rs.getString("M_PWD");
	    		String m_name = rs.getString("M_NAME");
	    		Date m_birth = rs.getDate("M_BIRTH");
	    		String m_phone = rs.getString("M_PHONE");
	    		String m_email = rs.getString("M_EMAIL");
	    		String m_addr = rs.getString("M_ADDR");
	    		String m_addr2 = rs.getString("M_ADDR2");
	    		Date m_joindate = rs.getDate("M_JOINDATE");

	    		return new Member(m_id, m_pwd, m_name, m_birth, m_phone, m_email, m_addr, m_addr2, m_joindate);
	    	}else {
	    		return null;
	    	}
	    }catch(SQLException se) {
	    	System.out.println(se);
	    	return null;
	    }finally {
	    	try {
	    		if(rs != null) rs.close();
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
	
	Boolean edit(Member m){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = MemberSQL.EDIT;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, m.getM_name());
	    	pstmt.setDate(2, m.getM_birth());
	    	pstmt.setString(3, m.getM_phone());
	    	pstmt.setString(4, m.getM_email());
	    	pstmt.setString(5, m.getM_addr());
	    	pstmt.setString(6, m.getM_addr2());
	    	pstmt.setString(7, m.getM_id());

	    	int i = pstmt.executeUpdate();
	    	if(i>0) return true;
			else return false;
	    }catch(SQLException se) {
	    	System.out.println(se);
	    	return false;
	    }finally {
	    	try {
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
	
	String findID(String name, Date birth){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = MemberSQL.FINDID;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, name);
	    	pstmt.setDate(2, birth);
	    	rs	= pstmt.executeQuery();
	    	if(rs.next()) {
	    		String m_id = rs.getString("M_ID");
	    		return m_id;
	    	}else {
	    		return null;
	    	}
	    }catch(SQLException se) {
	    	System.out.println(se);
	    	return null;
	    }finally {
	    	try {
	    		if(rs != null) rs.close();
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
	
	String findPWD(String id, String email){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = MemberSQL.FINDPWD;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, id);
	    	pstmt.setString(2, email);
	    	rs	= pstmt.executeQuery();
	    	if(rs.next()) {
	    		String m_pwd = rs.getString("M_PWD");
	    		return m_pwd;
	    	}else {
	    		return null;
	    	}
	    }catch(SQLException se) {
	    	System.out.println(se);
	    	return null;
	    }finally {
	    	try {
	    		if(rs != null) rs.close();
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
}
