package domain;

import java.sql.Date;

public class Board {

		private long b_seq;
		private String b_subject;
		private String b_content;
		private Date b_date;
		private int b_count;
				
		public Board() {}
		public Board(long b_seq, String b_subject, String b_content, Date b_date, int b_count) {
			super();
			this.b_seq = b_seq;
			this.b_subject = b_subject;
			this.b_content = b_content;
			this.b_date = b_date;
			this.b_count = b_count;
		}

		public long getB_seq() {
			return b_seq;
		}

		public void setB_seq(long b_seq) {
			this.b_seq = b_seq;
		}

		public String getB_subject() {
			return b_subject;
		}

		public void setB_subject(String b_subject) {
			this.b_subject = b_subject;
		}

		public String getB_content() {
			return b_content;
		}

		public void setB_content(String b_content) {
			this.b_content = b_content;
		}

		public Date getB_date() {
			return b_date;
		}

		public void setB_date(Date b_date) {
			this.b_date = b_date;
		}
		public int getB_count() {
			return b_count;
		}
		public void setB_count(int b_count) {
			this.b_count = b_count;
		}
}
