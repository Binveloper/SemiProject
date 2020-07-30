package orders.model;

import java.util.ArrayList;

import domain.Order;

public class OrdersService {
	private OrdersDAO dao;
	private static final OrdersService instance = new OrdersService();
	private OrdersService() {
		dao = new OrdersDAO();
	}
	public static OrdersService getInstance() {
		return instance;
	}
	
	public ArrayList<Order> getOrder(String m_id) {
		ArrayList<Order> list = dao.getOrder(m_id);
		return list;
	}
	
	public Boolean order(Long p_code, String m_id, long o_amount, long o_total) {
		return dao.order(p_code, m_id, o_amount, o_total);
	}
}
