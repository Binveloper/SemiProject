package login.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import domain.Member;

class LoginDAO {
	private DataSource ds;
	LoginDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}
	}
	Member getMember(String id){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = LoginSQL.CONTENT;
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
}
