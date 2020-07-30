package domain;

import java.sql.Date;

public class BoardQ {

	private Long seq;
	private String writer;
	private String subject;
	private String content;
	private Date udate;
	private Long count;
	
	public BoardQ() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardQ(Long seq, String writer, String subject, String content, Date udate, Long count) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.udate = udate;
		this.count = count;
	}

	public Long getSeq() {
		return seq;
	}

	public void setSeq(Long seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return udate;
	}

	public void setDate(Date udate) {
		this.udate = udate;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}
}
