package boardQ.control;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardQ.model.BoardQService;
import boardQ.vo.ListResult;
import domain.BoardQ;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/boardq/boardq.do")
public class BoardQController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void service(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	String m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			if(m.equals("content")){
				content(request, response);
			}else if(m.equals("delete")){
				delete(request, response);
			}else if(m.equals("countPlus")){
				countPlus(request, response);
			}else if(m.equals("writeH")){
				writeH(request, response);
			}else if(m.equals("write")){
				write(request, response);
			}else if(m.equals("update")){
				update(request, response);
			}else if(m.equals("update2")){
				update2(request, response);
			}else {
				list(request, response);
			}
		}else{
			list(request, response);
		}
    }

    
    private void list(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
    	String cpStr = request.getParameter("cp");
    	String psStr = request.getParameter("ps");
    	HttpSession session = request.getSession();
    	
    	//(1) cp 
    			int cp = 1;
    			if(cpStr == null) {
    				Object cpObj = session.getAttribute("cp");
    				if(cpObj != null) {
    					cp = (Integer)cpObj;
    				}
    			}else {
    				cpStr = cpStr.trim();
    				cp = Integer.parseInt(cpStr);
    			}
    			session.setAttribute("cp", cp);
    			
    			//(2) ps 
    			int ps = 3;
    			if(psStr == null) {
    				Object psObj = session.getAttribute("ps");
    				if(psObj != null) {
    					ps = (Integer)psObj;
    				}
    			}else {
    				psStr = psStr.trim();
    				int psParam = Integer.parseInt(psStr);
    				
    				Object psObj = session.getAttribute("ps");
    				if(psObj != null) {
    					int psSession = (Integer)psObj;
    					if(psSession != psParam) {
    						cp = 1;
    						session.setAttribute("cp", cp);
    					}
    				}else {
    					if(ps != psParam) {
    						cp = 1;
    						session.setAttribute("cp", cp);
    					}
    				}
    				
    				ps = psParam;
    			}
    			session.setAttribute("ps", ps);
    			
    			
    			BoardQService service = BoardQService.getInstance();
    			ListResult listResult = service.getListResult(cp, ps);
    			request.setAttribute("listResult", listResult);
    			System.out.println(listResult);
    			if(listResult.getList().size() == 0 && cp > 1) {
    				response.sendRedirect("boardq.do?m=list&cp="+(cp-1));
    			}else {
    				String view = "List.jsp";
    				RequestDispatcher rd = request.getRequestDispatcher(view);
    				rd.forward(request, response);
    			}
    }
    
    private void content(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
    	BoardQService service = BoardQService.getInstance();
		String seqStr =  request.getParameter("seq");
		if(seqStr != null) seqStr = seqStr.trim();
		long seq = Long.parseLong(seqStr);
		
		
		ArrayList<BoardQ> contents = service.contentsS(seq);
		request.setAttribute("contents", contents);
		
		String view = "Content.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        
        service.countplusS(seq);
    }
    
    private void delete(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
    	BoardQService service = BoardQService.getInstance();
		long seq = 0;
		String seqStr = request.getParameter("seq");
		if(seqStr != null) {
			seqStr = seqStr.trim();
			seq = Long.parseLong(seqStr);
			service.deleteS(seq);
		}	
		
		response.sendRedirect("boardq.do");
    }
    
    private void writeH(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = "WriteH.jsp";
		response.sendRedirect(view);	
    }
    
    private void write(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
    	
    	
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		BoardQ dto = new BoardQ(-1L, writer, subject, content, null, -1L);
		
		BoardQService service = BoardQService.getInstance();
		boolean flag = service.writeS(dto);
		
		
		request.setAttribute("flag", flag);
		
		String view = "Write.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }
    
    private void update(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
    	long seq=0;
    	BoardQService service = BoardQService.getInstance();
		String seqStr =  request.getParameter("seq");
		if(seqStr != null) seqStr = seqStr.trim();
		try {
		seq = Long.parseLong(seqStr);
		}catch(NumberFormatException ne) {}
		ArrayList<BoardQ> contents = service.contentsS(seq);
		request.setAttribute("contents", contents);
		
		String view = "Update.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
		
		
    }
    
    private void update2(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
    	long seq=0;
    	String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String seqStr =  request.getParameter("seq");
		System.out.println(writer);
		System.out.println(subject);
		System.out.println(content);
		System.out.println(seqStr);
		if(seqStr != null) seqStr = seqStr.trim();
		try {
		seq = Long.parseLong(seqStr);
		}catch(NumberFormatException ne) {}
		BoardQ dto = new BoardQ(seq, writer, subject, content, null, -1L);
		
		BoardQService service = BoardQService.getInstance();
		boolean flags = service.update2S(dto);
		System.out.println(flags);
		
		request.setAttribute("flags", flags);
		
		String view = "Update2.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }
    
    private void countPlus(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
    	BoardQService service = BoardQService.getInstance();
		long seq = 0;
		String seqStr = request.getParameter("seq");
		if(seqStr != null) {
			seqStr = seqStr.trim();
			seq = Long.parseLong(seqStr);
			service.countplusS(seq);
		}	
		
		response.sendRedirect("boardq.do");
    }
}

