package domain;

import java.sql.Date;

public class Member2 {

	private String m_id;
	private String m_pwd;
	private String m_name;
	private Date m_birth;
	private String m_phone;
	private String m_email;
	private String m_addr;
	private String m_addr2;
	private Date m_quitdate;
	
	public Member2() {
		// TODO Auto-generated constructor stub
	}

	public Member2(String m_id, String m_pwd, String m_name, Date m_birth, String m_phone, String m_email,
			String m_addr, String m_addr2, Date m_quitdate) {
		super();
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_addr = m_addr;
		this.m_addr2 = m_addr2;
		this.m_quitdate = m_quitdate;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public Date getM_birth() {
		return m_birth;
	}

	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_addr2() {
		return m_addr2;
	}

	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}

	public Date getM_quitdate() {
		return m_quitdate;
	}

	public void setM_quitdate(Date m_quitdate) {
		this.m_quitdate = m_quitdate;
	}

	
}
