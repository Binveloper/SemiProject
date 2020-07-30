package cart.model;

class CartSQL {
	final static String INSERT = "insert into CART values(?, ?, ?)";
	//cart에 상품 최초 추가
	final static String DELETE = "delete from CART where M_ID=?";
	//cart에 있는 상품 전체 삭제
	final static String DELETE2 = "delete from CART where M_ID=? and P_CODE=?";
	//cart에 있는 해당 상품만 삭제
	final static String UPDATE = "update CART set P_AMOUNT=? where M_ID=? and P_CODE=?";
	//cart에 있는 해당회원의 해당 상품의 수량 업데이트
	final static String SELECT = "select P.P_CODE, P.P_IMG, P.P_NAME, P.P_PRICE, C.P_AMOUNT from PRODUCT P join CART C on P.P_CODE=C.P_CODE where C.M_ID=?";
	//cart 상품 전체 검색
}
