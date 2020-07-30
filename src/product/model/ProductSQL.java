package product.model;

public class ProductSQL {
	static final String PRODUCT_LIST = "select * from PRODUCT where P_TYPE='tea' order by P_NAME desc";
	static final String TEAWARE_LIST = "select * from PRODUCT where P_TYPE='teaware' order by P_NAME desc";
	static final String GIFTSET_LIST = "select * from PRODUCT where P_TYPE='giftset' order by P_NAME desc";
}
