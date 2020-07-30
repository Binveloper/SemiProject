package member.control;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.model.LoginService;
import login.model.LoginSet;
import member.model.MemberService;
import member.model.MemberSet;
import domain.Member;

@WebServlet("/member/member.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String m = "";
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
				case "form": form(request, response); break;
				case "check": check(request, response); break;
				case "join": join(request, response); break;
				case "congrats": congrats(request, response); break;
				case "edit": edit(request, response); break;
				case "out": out(request, response); break;
				case "goUpdate": goUpdate(request, response); break;
				case "update": update(request, response); break;
				case "leave": leave(request, response); break;
				case "findID": findID(request, response); break;
				case "foundID": foundID(request, response); break;
				case "findPWD": findPWD(request, response); break;
				case "foundPWD": foundPWD(request, response); break;
				default: response.sendRedirect("../index.do");
			}
		}else {
			response.sendRedirect("../index.do");
		}
	}
	private void form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "join.jsp";
		response.sendRedirect(view);
	}
	private void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		String id = request.getParameter("id");
	    if(id != null) id = id.trim();
	    
	    MemberService service = MemberService.getInstance();
	    int rCode = service.checkMember(id);
	    request.setAttribute("rCode", rCode);
	    if(rCode==MemberSet.PASS) {
	    	HttpSession session = request.getSession();
	    	//Member m = service.getMemberS(id);
	    	session.setAttribute("id", id);
	    }
	    
	    String referer = request.getHeader("Referer");
		request.getSession().setAttribute("redirectURI", referer);
	}
	
	private void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		String id = request.getParameter("id");
	    String pwd = request.getParameter("pwd");
	    String name = request.getParameter("name");
	    String birthStr = request.getParameter("birth");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String addr = request.getParameter("addr");
	    String addr2 = request.getParameter("addr2");
	    if(id != null) id = id.trim();
	    if(pwd != null) pwd = pwd.trim();
	    if(name != null) name = name.trim();
	    if(birthStr != null) birthStr = birthStr.trim();
	    if(email != null) email = email.trim();
	    if(phone != null) phone = phone.trim();
	    if(addr != null) addr = addr.trim();
	    if(addr2 != null) addr2 = addr2.trim();
	    
	    Date birth = null;
	    try {
		    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date utilBirthStr = dateFormat.parse(birthStr);
		    birth = new java.sql.Date(utilBirthStr.getTime());
	    }catch(ParseException pe) {}
	    
	    MemberService service = MemberService.getInstance();
	    Member member = new Member(id, pwd, name, birth, phone, email, addr, addr2, null);
	    Boolean rCode = service.join(member);
	    

	    if(rCode) {
	    	member.setM_pwd("");
	    	HttpSession session = request.getSession();
		    session.setAttribute("member", member);
		    response.sendRedirect("member.do?m=congrats");
	    }
	}
	
	private void congrats(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String view = "congrats.jsp";
		response.sendRedirect(view);
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = null;
		Boolean uCode = false;
		Member m = (Member)session.getAttribute("loginUser");
		if(m!=null) {
			id = m.getM_id();
		}
		if(id!=null) {
			uCode = true;
			session.setAttribute("uCode", uCode);
			
		}else {
			session.setAttribute("uCode", uCode);
		}
		String view = "fail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	private void goUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String view = "edit.jsp";
		response.sendRedirect(view);
	}
		

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean upCode = false; // update ¼º°ø¿©ºÎ
		
		String id = request.getParameter("id");
	    String pwd = request.getParameter("pwdcheck"); // ºñ¹øÈ®ÀÎ¶õ
	    String name = request.getParameter("name");
	    String birthStr = request.getParameter("birth");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String addr = request.getParameter("addr");
	    String addr2 = request.getParameter("addr2");
	    if(id != null) id = id.trim();
	    if(pwd != null) pwd = pwd.trim();
	    if(name != null) name = name.trim();
	    if(birthStr != null) birthStr = birthStr.trim();
	    if(email != null) email = email.trim();
	    if(phone != null) phone = phone.trim();
	    if(addr != null) addr = addr.trim();
	    if(addr2 != null) addr2 = addr2.trim();
	    
	    Date birth = null;
	    try {
		    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date utilBirthStr = dateFormat.parse(birthStr);
		    birth = new java.sql.Date(utilBirthStr.getTime());
	    }catch(ParseException pe) {}
	    System.out.println(id+ "&"+pwd);
	    MemberService service = MemberService.getInstance();
	    if(service.checkPwd(id, pwd) == MemberSet.YES_ID) {
		    Member member = new Member(id, pwd, name, birth, phone, email, addr, addr2, null);
		    upCode = service.edit(member);
	
	    	HttpSession session = request.getSession();
	    	session.setAttribute("loginUser", member);
	    	session.setAttribute("upCode", upCode);
		    response.sendRedirect("edit_msg.jsp");
	    }else {
	    	HttpSession session = request.getSession();
	    	session.setAttribute("upCode", upCode);
		    response.sendRedirect("edit_msg.jsp");
	    }

	}
	private void out(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String view = "bye.jsp";
		response.sendRedirect(view);
	}
	private void leave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		MemberService service = MemberService.getInstance();
		Boolean flag = service.quit(member);
		if(flag) {
			session.invalidate(); // Å»ÅðÈÄ ·Î±×¾Æ¿ô
			
			String view = "../index.do";
			response.sendRedirect(view);
		}else {
			String view = "../index.do";
			response.sendRedirect(view);
		}
	}
	
	private void findPWD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String view = "findPWD.jsp";
		response.sendRedirect(view);
	}
	private void foundPWD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		if(id != null) id = id.trim();
		if(email != null) email = email.trim();

	    MemberService service = MemberService.getInstance();
	    String pwd = service.findPWD(id, email);
	    
	    HttpSession session = request.getSession();
    	session.setAttribute("FoundPWD", pwd);
		String view = "foundPWD.jsp";
		response.sendRedirect(view);
	}
	
	private void findID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String view = "findID.jsp";
		response.sendRedirect(view);
	}
	private void foundID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String birthStr = request.getParameter("birth");
		if(name != null) name = name.trim();
		if(birthStr != null) birthStr = birthStr.trim();
		
		Date birth = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilBirthStr = dateFormat.parse(birthStr);
			birth = new java.sql.Date(utilBirthStr.getTime());
		}catch(ParseException pe) {}
		
		MemberService service = MemberService.getInstance();
		String id = service.findID(name, birth);
		
		HttpSession session = request.getSession();
		session.setAttribute("FoundID", id);
		String view = "foundID.jsp";
		response.sendRedirect(view);
	}
}
