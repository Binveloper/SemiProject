package domain;

import java.sql.Date;

public class Order {
	
	private long o_seq;
	private long p_code;
	private String p_name;
	private String m_id;
	private long o_amount;
	private long o_total;
	private Date b_date;
	
	
	public Order() {
		
	}


	public Order(long o_seq, long p_code, String p_name, String m_id, long o_amount, long o_total, Date b_date) {
		super();
		this.o_seq = o_seq;
		this.p_code = p_code;
		this.p_name = p_name;
		this.m_id = m_id;
		this.o_amount = o_amount;
		this.o_total = o_total;
		this.b_date = b_date;
	}


	public long getO_seq() {
		return o_seq;
	}


	public void setO_seq(long o_seq) {
		this.o_seq = o_seq;
	}


	public long getP_code() {
		return p_code;
	}


	public void setP_code(long p_code) {
		this.p_code = p_code;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public long getO_amount() {
		return o_amount;
	}


	public void setO_amount(long o_amount) {
		this.o_amount = o_amount;
	}


	public long getO_total() {
		return o_total;
	}


	public void setO_total(long o_total) {
		this.o_total = o_total;
	}


	public Date getB_date() {
		return b_date;
	}


	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	
	


}
