package orders.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.Member;
import domain.Order;



class OrdersDAO {
	
	private DataSource ds;
	
	OrdersDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}
	}



	Boolean order(long p_code, String m_id, long o_amount, long o_total){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = OrdersSQL.ORDER;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setLong(1, p_code);
	    	pstmt.setString(2, m_id);
	    	pstmt.setLong(3, o_amount);
	    	pstmt.setLong(4, o_total);
	    	
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

	ArrayList<Order> getOrder(String m_id){
		ArrayList<Order> list = new ArrayList<Order>();
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = OrdersSQL.ORDER_LIST;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, m_id);
	    	rs	= pstmt.executeQuery();
	    	while(rs.next()) {
	    		long o_seq = rs.getLong(1);
	    		long p_code = rs.getLong(5);
	    		String p_name = rs.getString(6);
	    		//String m_id = rs.getString("M_ID");
	    		long o_amount = rs.getLong(2);
	    		long o_total = rs.getLong(3);
	    		Date b_date = rs.getDate(4);
	    		
	    		list.add(new Order(o_seq, p_code, p_name, m_id, o_amount, o_total, b_date));
	    	}
	    	return list;
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
