package product.model;

import static product.model.ProductSQL.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.Product;

public class ProductDAO {
	
	private DataSource ds;
	ProductDAO(){
		try {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		ds = (DataSource)envContext.lookup("jdbc/myoracle");
		
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체 찾�? 못함");
		}
	}
	
	ArrayList<Product> list(){
		ArrayList<Product> list = new ArrayList<Product>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
	    String sql = PRODUCT_LIST;

		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				long p_code = rs.getLong("P_CODE");
				String p_type = rs.getString("P_TYPE");
				String p_name = rs.getString("P_NAME");
				long p_price = rs.getLong("P_PRICE");
				long p_amount = rs.getLong("P_AMOUNT");
				String p_story = rs.getString("P_STORY");
				String p_img = rs.getString("P_IMG");
				String p_info = rs.getString("P_INFO");
				list.add(new Product(p_code, p_type, p_name, p_price, p_amount, p_story, p_img, p_info));
				}
				return list;
			}catch(SQLException se){
				System.out.println(se);
				return null;
			}finally{
				try{
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(con != null)  con.close();
				}catch(SQLException se){}
			}  
	}
	
	ArrayList<Product> contents(long p_code){
		 ArrayList<Product> contents = new ArrayList<Product>();
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
		    String sql = "select * from PRODUCT where P_CODE ="+ p_code;
		    
		    try{
				con = ds.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					p_code = rs.getLong("P_CODE");
					String p_type = rs.getString("P_TYPE");
					String p_name = rs.getString("P_NAME");
					long p_price = rs.getLong("P_PRICE");
					long p_amount = rs.getLong("P_AMOUNT");
					String p_story = rs.getString("P_STORY");
					String p_img = rs.getString("P_IMG");
					String p_info = rs.getString("P_INFO");
					contents.add(new Product(p_code, p_type, p_name, p_price, p_amount, p_story, p_img, p_info));
				}
				return contents;
			}catch(SQLException se){
				System.out.println(se);
				return null;
			}finally{
					try{
						if(rs != null) rs.close();
						if(stmt != null) stmt.close();
						if(con != null)  con.close();
					}catch(SQLException se){}
				}  
	 }
	
	
	ArrayList<Product> listTW(){
		ArrayList<Product> listTW = new ArrayList<Product>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
	    String sql = TEAWARE_LIST;

		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				long p_code = rs.getLong("P_CODE");
				String p_type = rs.getString("P_TYPE");
				String p_name = rs.getString("P_NAME");
				long p_price = rs.getLong("P_PRICE");
				long p_amount = rs.getLong("P_AMOUNT");
				String p_story = rs.getString("P_STORY");
				String p_img = rs.getString("P_IMG");
				String p_info = rs.getString("P_INFO");
				listTW.add(new Product(p_code, p_type, p_name, p_price, p_amount, p_story, p_img, p_info));
				}
				return listTW;
			}catch(SQLException se){
				System.out.println(se);
				return null;
			}finally{
				try{
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(con != null)  con.close();
				}catch(SQLException se){}
			}  
	}
	
	ArrayList<Product> listGift(){
		ArrayList<Product> listGift = new ArrayList<Product>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
	    String sql = GIFTSET_LIST;

		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				long p_code = rs.getLong("P_CODE");
				String p_type = rs.getString("P_TYPE");
				String p_name = rs.getString("P_NAME");
				long p_price = rs.getLong("P_PRICE");
				long p_amount = rs.getLong("P_AMOUNT");
				String p_story = rs.getString("P_STORY");
				String p_img = rs.getString("P_IMG");
				String p_info = rs.getString("P_INFO");
				listGift.add(new Product(p_code, p_type, p_name, p_price, p_amount, p_story, p_img, p_info));
				}
				return listGift;
			}catch(SQLException se){
				System.out.println(se);
				return null;
			}finally{
				try{
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(con != null)  con.close();
				}catch(SQLException se){}
			}  
	}
	
	
}
