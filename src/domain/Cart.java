package domain;

public class Cart {
	
	private String m_id;
	private long p_code;	
	private long p_amount;
	private long p_price;
	private String p_name;
	private String p_img;

	

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Cart(String m_id, long p_code, long p_amount, long p_price, String p_name, String p_img) {
		super();
		this.m_id = m_id;
		this.p_code = p_code;
		this.p_amount = p_amount;
		this.p_price = p_price;
		this.p_name = p_name;
		this.p_img = p_img;
	}



	public String getM_id() {
		return m_id;
	}



	public void setM_id(String m_id) {
		this.m_id = m_id;
	}



	public long getP_code() {
		return p_code;
	}



	public void setP_code(long p_code) {
		this.p_code = p_code;
	}



	public long getP_amount() {
		return p_amount;
	}



	public void setP_amount(long p_amount) {
		this.p_amount = p_amount;
	}



	public long getP_price() {
		return p_price;
	}



	public void setP_price(long p_price) {
		this.p_price = p_price;
	}



	public String getP_name() {
		return p_name;
	}



	public void setP_name(String p_name) {
		this.p_name = p_name;
	}



	public String getP_img() {
		return p_img;
	}



	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	

}
