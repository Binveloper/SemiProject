package orders.model;

import java.sql.Date;

public class OrdersSQL {
	static final String ORDER = "insert into ORDERS values(ORDERS_SEQ.nextval, ?, ?, ?, ?, SYSDATE)";
	static final String ORDER_LIST = "select O.O_SEQ, O.O_AMOUNT, O.O_TOTAL, O.B_DATE, O.P_CODE, P.P_NAME from PRODUCT P join ORDERS O on P.P_CODE=O.P_CODE where M_ID=? order by O.O_SEQ desc";

}
