package board.model;

import java.util.ArrayList;
import java.util.List;

import board.vo.ListResult;
import domain.Board;

import domain.Member;

public class BoardService {
	private BoardDAO dao;
	private static final BoardService instance = new BoardService();
	private BoardService() {
		dao = new BoardDAO();
	}
	public static BoardService getInstance() {
		return instance;
	}
	public ListResult getListResult(int currentPage, int pageSize) {
		System.out.println("");
		ArrayList<Board> list = dao.list(currentPage, pageSize);
		long totalCount = dao.getTotalCount();
		return new ListResult(currentPage, totalCount, pageSize, list);
	}
	public ArrayList<Board> listS(){
		return dao.list();
	}
	public ArrayList<Board> contentS(long seq){
		return dao.content(seq);
	}
	public Board getBoardS(long seq) {
		return dao.getBoard(seq);
	}
	public boolean updateS(Board board){
		return dao.update(board);
	}
	public void delS(long seq){
		dao.del(seq);
	}
	public void upcountS(long seq) {
		dao.upcount(seq);	
	}
	public boolean writeOk(Board board) {
		return dao.writeOk(board);
	}
}
