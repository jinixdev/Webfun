package comment;

import java.sql.Timestamp;

public class commentBean {
	
	
		private int num,p_num,r_num,re_r_num;
		private String id,content;
		private Timestamp reg_date;
		
		
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Timestamp getReg_date() {
			return reg_date;
		}
		public void setReg_date(Timestamp reg_date) {
			this.reg_date = reg_date;
		}
		public int getP_num() {
			return p_num;
		}
		public void setP_num(int p_num) {
			this.p_num = p_num;
		}
		public int getR_num() {
			return r_num;
		}
		public void setR_num(int r_num) {
			this.r_num = r_num;
		}
		public int getRe_r_num() {
			return re_r_num;
		}
		public void setRe_r_num(int re_r_num) {
			this.re_r_num = re_r_num;
		}

	}



