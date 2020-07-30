package board.model;

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

import domain.Board;
import domain.BoardQ;
import domain.Member;
import board.vo.*;
public class BoardDAO {
	private DataSource ds;
	
	BoardDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP ��ü(jdbc/myoracle)�� ã�� ����");
		}
	}
	
	ArrayList<Board> list(){
		ArrayList<Board> list = new ArrayList<Board>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = BoardSQL.LIST;
		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {

				long b_seq = rs.getLong(1);
				String b_subject = rs.getString(2);
				String b_content = rs.getString(3);
				Date b_date = rs.getDate(4);
				int b_count  = rs.getInt(5);
				Board b = new Board(b_seq, b_subject, b_content, b_date, b_count);
				list.add(b);
			}
			System.out.println("size:"+ list.size());
			return list;
		}catch(SQLException se) {
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	//�߰�
	ArrayList<Board> list(int currentPage, int pageSize){
		ArrayList<Board> list = new ArrayList<Board>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = BoardSQL.PAGE;
		
		int startRow = (currentPage-1)*pageSize;
		int endRow = currentPage*pageSize; 
		try {					
			con = ds.getConnection();						
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);						
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				long b_seq = rs.getLong("B_SEQ");
				String b_subject = rs.getString("B_SUBJECT");
				String b_content = rs.getString("B_CONTENT");			
				Date b_date = rs.getDate("B_DATE");
				int b_count = rs.getInt("B_COUNT");
				Board b = new Board(b_seq, b_subject, b_content, b_date, b_count);
				list.add(b);
			}
			return list;
		}catch(SQLException se) {
			System.out.println("SQLException : "+se);
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	long getTotalCount() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = BoardSQL.SELECT_COUNT;
		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				long count = rs.getLong(1);
				return count;
			}else {
				return -1L;
			}
		}catch(SQLException se) {
			return -1L;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	ArrayList<Board> content(long seq){
		 ArrayList<Board> content = new ArrayList<Board>();
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
		    String sql = "select * from BOARD where B_SEQ ="+seq+" order by B_SEQ desc";
		    
		    try{
				con = ds.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					seq = rs.getLong("B_SEQ");	
					String b_subject = rs.getString("B_SUBJECT");
					String b_content = rs.getString("B_CONTENT");
					Date b_udate = rs.getDate("B_DATE");
					int b_count = rs.getInt("B_COUNT");
					content.add(new Board(seq, b_subject, b_content, b_udate, b_count));
				}
				return content;
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
	
	Board getBoard(long b_seq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = BoardSQL.CONTENT;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, b_seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//long b_seq = rs.getLong(1);
				String b_subject = rs.getString(2);
				String b_content = rs.getString(3);
				Date b_date = rs.getDate(4);
				int b_count = rs.getInt(5);
				System.out.println(b_subject);
				System.out.println(b_content);
				System.out.println(b_date);
				System.out.println(b_count);
				return new Board(b_seq, b_subject, b_content, b_date, b_count);
			}else {
				return null;
			}
		}catch(SQLException se) {
			System.out.println("se : "+ se);
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	boolean update(Board board){
		System.out.println("asd:"+ board.getB_content());
		System.out.println("asd:"+ board.getB_subject());
		System.out.println("asd:"+ board.getB_seq());
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = BoardSQL.UPDATE;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getB_subject());
			pstmt.setString(2, board.getB_content());
			pstmt.setLong(3, board.getB_seq());
			System.out.println("123");
			int i = pstmt.executeUpdate();
			System.out.println("321");
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
	void del(long b_seq){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = BoardSQL.DEL;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, b_seq);
			pstmt.executeUpdate();
		}catch(SQLException se) {
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}

	 void upcount(long b_seq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = BoardSQL.UPCOUNT;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, b_seq);
			pstmt.executeUpdate();
		}catch(SQLException se) {
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
		
	}

	 boolean writeOk(Board board) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = BoardSQL.INSERT;
			System.out.println("board sub: "+board.getB_subject());
			System.out.println("board con: "+board.getB_content());
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, board.getB_subject());
				pstmt.setString(2, board.getB_content());
				int i = pstmt.executeUpdate();
				if(i>0) return true;
				else return false;
			}catch(SQLException se) {
				System.out.println("writeOk : "+se);
				return false;
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(SQLException se) {}
			}
		
	}
}

