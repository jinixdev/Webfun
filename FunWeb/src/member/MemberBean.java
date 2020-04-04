package member;

import java.sql.Timestamp;

public class MemberBean {

		private String id,pass,name,email;
		private String address,postcode,detailAddress,extraAddress,ip;
		private Timestamp reg_date;
		
		public String getIp() {
			return ip;
		}
		public void setIp(String ip) {
			this.ip = ip;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getPostcode() {
			return postcode;
		}
		public void setPostcode(String postcode) {
			this.postcode = postcode;
		}
		public String getDetailAddress() {
			return detailAddress;
		}
		public void setDetailAddress(String detailAddress) {
			this.detailAddress = detailAddress;
		}
		public String getExtraAddress() {
			return extraAddress;
		}
		public void setExtraAddress(String extraAddress) {
			this.extraAddress = extraAddress;
		}

		
		
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public Timestamp getReg_date() {
			return reg_date;
		}
		public void setReg_date(Timestamp reg_date) {
			this.reg_date = reg_date;
		}
		
		
	
	}
