package boardQ.model;

import static boardQ.model.BoardQSQL.*;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import domain.BoardQ;

public class BoardQDAO {
	
	private DataSource ds;
	BoardQDAO(){
		try {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		ds = (DataSource)envContext.lookup("jdbc/myoracle");
		
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체 찾지 못함");
		}
	}
	
	 ArrayList<BoardQ> list(){
			ArrayList<BoardQ> list = new ArrayList<BoardQ>();
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
		    String sql = LIST;

			try{
				con = ds.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					long seq = rs.getLong(1);
					String writer = rs.getString(2);
					String subject = rs.getString(4);
					String content = rs.getString(5);
					Date udate = rs.getDate(6);
					long count = rs.getLong(7);
					list.add(new BoardQ(seq, writer, subject, content, udate, count));
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
	 //추가
	 ArrayList<BoardQ> list(int currentPage, int pageSize){
			ArrayList<BoardQ> list = new ArrayList<BoardQ>();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		    String sql = LIST_PAGE;
		    
		    int startRow = (currentPage-1)*pageSize;
		    int endRow = currentPage*pageSize;
			try{
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()){
					long seq = rs.getLong("B_SEQ");
					String writer = rs.getString("B_WRITER");
					String subject = rs.getString("B_SUBJECT");
					String content = rs.getString("B_CONTENT");
					Date udate = rs.getDate("B_DATE");
					long count = rs.getLong("B_COUNT");
					
					list.add(new BoardQ(seq, writer, subject, content, udate, count));
				
					}
					return list;
				}catch(SQLException se){
					return null;
				}finally{
					try{
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(con != null)  con.close();
					}catch(SQLException se){}
				}  
		}
	 	long getTotalCount() {
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
		    String sql = COUNT;
		    
		    try{
				con = ds.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					long count = rs.getLong(1);
					return count;
				}else {
				return -1L;
				}
			}catch(SQLException se){
				System.out.println(se);
				return -1L;
			}finally{
					try{
						if(rs != null) rs.close();
						if(stmt != null) stmt.close();
						if(con != null)  con.close();
					}catch(SQLException se){}
				}  
	 }
	 ArrayList<BoardQ> contents(long seq){
		 ArrayList<BoardQ> contents = new ArrayList<BoardQ>();
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
		    String sql = "select * from BOARD2 where B_SEQ ="+seq+" order by B_SEQ desc";
		    
		    try{
				con = ds.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					seq = rs.getLong("B_SEQ");
					String writer = rs.getString("B_WRITER");
					String subject = rs.getString("B_SUBJECT");
					String content = rs.getString("B_CONTENT");
					Date udate = rs.getDate("B_DATE");
					long count = rs.getLong("B_COUNT");
					contents.add(new BoardQ(seq, writer, subject, content, udate, count));
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
	 
	 void delete(long seq) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = DELETE;

			try{
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, seq);
				pstmt.executeUpdate();
			}catch(SQLException se){
			}finally{
				try{
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(SQLException se){}
			}
		}
	 
	 boolean write(BoardQ dto) {

		    String sql= WRITE;
			Connection con = null;
			PreparedStatement pstmt = null;

			try{
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				int i = pstmt.executeUpdate();
				if(i>0){
					return true;
				}else{
					return false;
				}
			}catch(SQLException se){
				System.out.println(se);
				return false;
			}finally{
				try{
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(SQLException se){}
			}
		}
	 
	 boolean update2(BoardQ dto) {

		    String sql= UPDATE;
			Connection con = null;
			PreparedStatement pstmt = null;

			try{
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setLong(4, dto.getSeq());
				int i = pstmt.executeUpdate();
				if(i>0){
					return true;
				}else{
					return false;
				}
			}catch(SQLException se){
				System.out.println(se);
				return false;
			}finally{
				try{
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(SQLException se){}
			}
		}
	 
	 /* 추가한 부분 */
	 
	 void countPlus(long seq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = UPCOUNT;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, seq);
			pstmt.executeUpdate();
		}catch(SQLException se){
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	 }
}
