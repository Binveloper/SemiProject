package boardQ.model;

import java.util.ArrayList;

import boardQ.model.BoardQDAO;
import boardQ.model.BoardQService;
import boardQ.vo.ListResult;
import domain.BoardQ;

public class BoardQService {
	private BoardQDAO dao;
	private static final BoardQService instance = new BoardQService();
	

	
	private BoardQService() {
		dao = new BoardQDAO();
	}
	
	public static final BoardQService getInstance() {
		return instance;
	}
	
	public ArrayList<BoardQ> listS() {
		return dao.list();
	}
	
	public ListResult getListResult(int currentPage, int pageSize) {
		ArrayList<BoardQ> list = dao.list(currentPage, pageSize);
		System.out.println(list);
		long totalCount = dao.getTotalCount();
		System.out.println(totalCount);
		ListResult r = new ListResult(currentPage, totalCount, pageSize, list);
		
		return r;
	}
	public ArrayList<BoardQ> contentsS(long seq) {
		return dao.contents(seq);
	}
	
	public void deleteS(long seq) {
		dao.delete(seq);
	}
	
	public boolean writeS(BoardQ dto) {
		return dao.write(dto);
	}
	
	public boolean update2S(BoardQ dto) {
		return dao.update2(dto);
	}
	
	/* 조회수 추가 부분 */
	
	public void countplusS(long seq) {
		dao.countPlus(seq);
	}
}
