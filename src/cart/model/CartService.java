package cart.model;

import java.util.ArrayList;

import domain.Cart;
import domain.Member;
import domain.Product;

public class CartService {
	private CartDAO dao;
	private static final CartService instance = new CartService();
	private CartService() {
		dao = new CartDAO();
	}
	public static CartService getInstance() {
		return instance;
	}
	
		
	public ArrayList<Cart> getCart(String id) {
		 ArrayList<Cart> c = dao.getCart(id);
		return c;
	}
	
	public Boolean PutIntoCart(String m_id, Long p_amount, Long p_code) {
		Boolean flag = dao.PutIntoCart(m_id, p_amount, p_code);
		
		return flag;
	}
	
	public Boolean update(String m_id, Long p_amount, Long p_code) {
		Boolean flag = dao.update(m_id, p_amount, p_code);
		
		return flag;
	}
	
	public Boolean cleanCart(String m_id) {
		Boolean flag = dao.cleanCart(m_id);
		
		return flag;
	}
	
	public Boolean cleanProduct(String m_id, Long p_code) {
		Boolean flag = dao.cleanProduct(m_id, p_code);
		
		return flag;
	}
	
	
}
