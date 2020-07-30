package member.model;

import java.sql.Date;

import domain.Member;
import login.model.LoginSet;


public class MemberService {
	private MemberDAO dao;
	private static final MemberService instance = new MemberService();
	private MemberService() {
		dao = new MemberDAO();
	}
	public static MemberService getInstance() {
		return instance;
	}
	
	public int checkMember(String id) {
		Member m = dao.getMember(id);
		if(m == null) {
			return MemberSet.PASS; //중복 아이디가 없음!
		}else {
			return MemberSet.YES_ID; // 중복아이디가 있음!
		}
	}
	
	public int checkPwd(String id, String pwd) {
		Member m = dao.getMember(id);
		if(m != null) {
			String pwdDb = m.getM_pwd();
			if(pwdDb != null) pwdDb = pwdDb.trim();
			
			if(!pwd.equals(pwdDb)) {
				return MemberSet.NO_PWD; //PWD불일치 
			}else {
				return MemberSet.YES_ID; //PWD 일치 
			}
		}else { 
			return MemberSet.PASS; // ID가 없음
		}
	}
	
	public Boolean join(Member m) {
		Boolean flag = dao.join(m);
		return flag;
	}
	
	public Boolean edit(Member m) {
		Boolean flag = dao.edit(m);
		return flag;
	}
	
	public Member getMember(String id) {
		return dao.getMember(id);
	}
	
	public Boolean quit(Member m) {
		Boolean flag = false;
		if(dao.quit(m)) {
		 flag = dao.clean(m);
		}else {
			return false;
		}
		return flag;
	}
	
	public String findID(String name, Date birth) {
		String id = dao.findID(name, birth);
		if(id != null) {
			return id; // ID 줄게 
		}else { 
			return null; // ID가 없음
		}
	}

	public String findPWD(String id, String email) {
		String pwd = dao.findPWD(id, email);
		if(pwd != null) {
			return pwd; //PWD 줄게
		}else { 
			return null; // PWD 없음
		}
	}	
	
}
