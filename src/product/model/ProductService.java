package product.model;

import java.util.ArrayList;

import domain.Product;

public class ProductService {
	private ProductDAO dao;
	private static final ProductService instance = new ProductService();
	
	
	private ProductService() {
		dao = new ProductDAO();
	}
	
	public static final ProductService getInstance() {
		return instance;
	}
	
	public ArrayList<Product> listS() {
		return dao.list();
	}
	
	public ArrayList<Product> contentsS(long p_code) {
		return dao.contents(p_code);
	}
	
	public ArrayList<Product> listTWS() {
		return dao.listTW();
	}
	
	/*public ArrayList<Product> contentsTWS(long tw_code) {
		return dao.contentsTW(tw_code);
	}*/
	
	public ArrayList<Product> listGiftS() {
		return dao.listGift();
	}
	
	/*public ArrayList<Product> contentsGiftS(long g_code) {
		return dao.contentsGift(g_code);
	}*/
}
