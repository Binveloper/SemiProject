package cart.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.CartService;
import domain.Cart;
import domain.Member;
import member.model.MemberService;
import member.model.MemberSet;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart/cart.do")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String m = "";
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
				case "cart": cart(request, response); break;
				case "PutIntoCart": PutIntoCart(request, response); break;
				//case "cartList": cartList(request, response); break;
				case "cleanProduct": cleanProduct(request, response); break;
				case "cleanAll": cleanAll(request, response); break;
				
				default: response.sendRedirect("../index.jsp");
			}
		}else {
			response.sendRedirect("../index.jsp");
		}
	}
	
	private void cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Cart> cart = null;
		String id = null;
		System.out.println(1);
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser);
		if(loginUser !=null) {
			id = loginUser.getM_id();
		}
	    if(id!=null) {
		    CartService service = CartService.getInstance();
		    cart = service.getCart(id);
		    System.out.println(cart);
	    }else {
	    	
	    }
	    
	    if(cart!=null) {
	    	session.setAttribute("cart", cart);
	    }else {
	    	session.setAttribute("cart", cart);
	    }
		
		String view = "cart.jsp";
		response.sendRedirect(view);
	}
	
	private void PutIntoCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		String m_id = null;
		long p_amount = 1;
		long p_code = -1L;
		Boolean flag2 = false;
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser);
		if(loginUser !=null) {
			m_id = loginUser.getM_id();
			flag2 = true;
		}
		
		String p_amountStr = request.getParameter("p_amount");
	    String p_codeStr = request.getParameter("p_code");
	    if(p_amountStr !=null || p_codeStr !=null) {
		    try {
				if(p_codeStr!=null) p_codeStr = p_codeStr.trim();
				if(p_amountStr!=null) p_amountStr = p_amountStr.trim();
				p_code = Long.parseLong(p_codeStr);
				p_amount = Long.parseLong(p_amountStr);
			}catch(NumberFormatException ne) {}
	    }
		

		CartService service = CartService.getInstance();

		Boolean flag = service.PutIntoCart(m_id, p_amount, p_code);
		session.setAttribute("cFlag", flag);
		session.setAttribute("lFlag", flag2);
		String view = "cart_msg.jsp";
		response.sendRedirect(view);
	}
	
	private void cleanProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String m_id = null;
		long p_code = -1L;
		
		String p_codeStr = request.getParameter("code");
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser !=null) {
			m_id = loginUser.getM_id();
		}else {}
		
		try {
			if(p_codeStr!=null) p_codeStr = p_codeStr.trim();
			p_code = Long.parseLong(p_codeStr);
		}catch(NumberFormatException ne) {}
		
		CartService service = CartService.getInstance();
		Boolean cFlag = service.cleanProduct(m_id, p_code);
		request.setAttribute("cFlag", cFlag);
		cart(request, response);
	}	
	
	private void cleanAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String m_id = null;
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser !=null) {
			m_id = loginUser.getM_id();
		}else {}
		
		CartService service = CartService.getInstance();
		service.cleanCart(m_id);
		
		response.sendRedirect("../order/order.do?m=thankyou");
	}
	
	

}
