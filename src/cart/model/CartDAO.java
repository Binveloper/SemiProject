package cart.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

import domain.Cart;
import domain.Product;

class CartDAO {
	private DataSource ds;
	CartDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}
	}
	
	ArrayList<Cart> getCart(String m_id){
		ArrayList<Cart> cart = new ArrayList<Cart>();
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = CartSQL.SELECT;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, m_id);
	    	rs	= pstmt.executeQuery();
	    	while(rs.next()) {
	    		 //세션에 있는 아이디에서 넘어올 것임.
	    		long p_code = rs.getLong("P_CODE"); //상품페이지에서 넘어올 것임.
	    		long p_amount = rs.getLong("P_AMOUNT");
	    		long p_price = rs.getLong("P_PRICE");
	    		String p_name = rs.getString("P_NAME");
	    		String p_img = rs.getString("P_IMG");

	    		cart.add(new Cart(m_id, p_code, p_amount, p_price, p_name, p_img));
	    	}
	    	return cart;
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
	
	Boolean PutIntoCart(String m_id, Long p_amount, Long p_code){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = CartSQL.INSERT;
	    try {
	    	con = ds.getConnection();
	    	System.out.println(1);
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, m_id);
	    	System.out.println(m_id);
	    	pstmt.setLong(2, p_amount);
	    	System.out.println(p_amount);
	    	pstmt.setLong(3, p_code);
	    	System.out.println(p_code);
	    	int i = pstmt.executeUpdate();
	    	System.out.println(4);
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
	
	boolean update(String m_id, Long p_amount, Long p_code){
		Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = CartSQL.UPDATE;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setLong(1, p_amount);
	    	pstmt.setString(2, m_id);
	    	pstmt.setLong(3, p_code);
	    	
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
	
	boolean cleanCart(String m_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = CartSQL.DELETE;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
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

	boolean cleanProduct(String m_id, Long p_code){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = CartSQL.DELETE2;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setLong(2, p_code);
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
	
}
