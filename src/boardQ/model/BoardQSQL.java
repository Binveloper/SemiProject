package boardQ.model;

public class BoardQSQL {
	static final String LIST = "select * from BOARD2 order by B_SEQ desc";
	static final String DELETE = "delete from BOARD2 where B_SEQ=?";
	static final String WRITE = "insert into BOARD2 values(BOARD2_SEQ.nextval, ?, ?, ?, SYSDATE, 0)";
	static final String UPDATE = "update BOARD2 set b_writer=?, b_subject=?, b_content=?, b_date=SYSDATE where B_SEQ = ?";
	static final String LIST_PAGE = "select * from (select ROWNUM rnum, aa.* from (select * from BOARD2 order by B_SEQ desc) aa) where rnum>? and rnum<=?";
	static final String COUNT= "select COUNT(B_SEQ) from BOARD2";
	static final String UPCOUNT = "update BOARD2 set b_COUNT=b_COUNT+1 where B_SEQ=?";
}
