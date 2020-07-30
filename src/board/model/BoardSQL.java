package board.model;

public class BoardSQL {
	final static String LIST = "select * from BOARD order by b_SEQ desc";
	final static String INSERT = "insert into BOARD values(BOARD_SEQ.nextval, ?, ?, SYSDATE, 0)";
	final static String DEL = "delete from BOARD where b_SEQ=?";
	final static String UPDATE = "Update BOARD set b_subject=?, b_content=?, b_date=SYSDATE where b_seq=?";
	//public static String LIST_PAGE = null;
	final static String COUNT = "select B_count from BOARD";
	final static String SELECT_COUNT = "select count(*) from BOARD";
	final static String CONTENT = "select * from BOARD where B_SEQ=?";
	final static String UPCOUNT = "update BOARD set b_COUNT=b_COUNT+1 where B_SEQ=?";
	final static String PAGE = "select * from (select ROWNUM rnum, aa.* from (select * from BOARD order by B_SEQ desc) aa) where rnum>? and rnum<=?";
}
