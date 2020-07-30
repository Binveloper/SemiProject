package orders.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Cart;
import domain.Member;
import domain.Order;
import orders.model.OrdersService;

@WebServlet("/order/order.do")
public class OrdersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String m = "";
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
				case "checkout": checkout(request, response); break;
				case "order": order(request, response); break;
				case "thankyou": thankyou(request, response); break;
				case "search": search(request, response); break;
				default: index(request, response);
			}
		}else {
			index(request, response);
		}
		
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = "../index.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	public void checkout(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = "checkout.jsp";
		response.sendRedirect(view);
	}
	
	public void order(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		String amountStr = request.getParameter("hiddenPamount");
		String totalStr = request.getParameter("hiddenPtotal");
		long o_amount = -1L;
		long o_total = -1L;
		try {
			if(amountStr!=null) amountStr.trim();
			if(totalStr!=null) totalStr.trim();
			o_amount = Long.parseLong(amountStr);
			o_total = Long.parseLong(totalStr);
		}catch(NumberFormatException ne) {}
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cart");
		ArrayList<Long> codeList = new ArrayList<Long>();
		session.setAttribute("codeList", codeList);
		for(Cart cart : cartList) {
			codeList.add(cart.getP_code());
		}
		
		String m_id = m.getM_id();
		Long p_code = codeList.get(0);
		OrdersService service = OrdersService.getInstance();
		boolean flag = service.order(p_code, m_id, o_amount, o_total);

		String view = "../cart/cart.do?m=cleanAll";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);

	}
	
	public void thankyou(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.sendRedirect("thankyou.jsp");
		
	}
	
	public void search(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		String m_id = m.getM_id();
		OrdersService service = OrdersService.getInstance();
		ArrayList<Order> order = service.getOrder(m_id);
		
		session.setAttribute("UserOrders", order);

		String view = "List.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	


}
