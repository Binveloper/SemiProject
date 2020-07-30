package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/index.do")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String m = "";
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
				case "tea": tea(request, response); break;
				case "teaware": teaware(request, response); break;
				case "giftset": giftset(request, response); break;
				case "notice": notice(request, response); break;
				case "qna": qna(request, response); break;
				default: index(request, response);
			}
		}else {
			index(request, response);
		}
		
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = "index.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	public void tea(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = "product/product.do?m=list";
		response.sendRedirect(view);
	}
	
	public void teaware(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = "product/product.do?m=listTW";
		response.sendRedirect(view);
	}
	
	public void giftset(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = "product/product.do?m=listGift";
		response.sendRedirect(view);
	}
	public void notice(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.sendRedirect("board/board.do");
	}
	public void qna(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.sendRedirect("boardq/boardq.do");

	}
}
