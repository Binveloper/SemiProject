package member.model;

import javax.servlet.http.HttpSession;

import domain.Member;

class MemberSQL {

	final static String JOIN = "insert into MEMBER values(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
	final static String QUIT = "insert into MEMBER2 values(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
	final static String CLEAN = "delete from MEMBER where M_ID = ?";
	final static String CHECK = "select * from MEMBER where M_ID = ?";
	final static String EDIT = "update MEMBER set M_NAME=?, M_BIRTH=?, M_PHONE=?, M_EMAIL=?, M_ADDR=?, M_ADDR2=? where M_ID=?";
	final static String EDITPWD = "update MEMBER set M_PWD=? where M_ID=?";
	final static String FINDID = "select M_ID from MEMBER where M_NAME = ? and M_BIRTH=?";
	final static String FINDPWD = "select M_PWD from MEMBER where M_ID = ? and M_EMAIL=?";
}

