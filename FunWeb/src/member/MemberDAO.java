package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MemberDAO {
	
	private Connection getConnection() throws Exception{
		//예외처리를 메서드 호출한 곳에서 처리하겠다
		
	 	//1단계
		Class.forName("com.mysql.jdbc.Driver");
		//2단계 : 경로설정
	 	String dburl = "jdbc:mysql://localhost:3306/jspdb1";
	 	String dbUser = "jspid";
	 	String dbPass = "jsppass";
	 	//3단계
	 	Connection con = DriverManager.getConnection(dburl, dbUser, dbPass);

	 	return con;
	}
	

	public void insertMember(MemberBean mb) {
		try { //예외가 발생할 것같은 구문
			Connection con = getConnection();
		 	String sql = "insert into member(id,pass,name,email,address,phone,mobile,reg_date,postcode,detailAddress,extraAddress) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, mb.getId());
			pre.setString(2, mb.getPass());
			pre.setString(3, mb.getName());
			pre.setString(4, mb.getEmail());
			pre.setString(5, mb.getAddress());
			pre.setString(6, mb.getPhone());
			pre.setString(7, mb.getMobile());
			pre.setTimestamp(8, mb.getReg_date());
			pre.setString(9, mb.getPostcode());
			pre.setString(10, mb.getDetailAddress());
			pre.setString(11, mb.getExtraAddress());

			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// insertMember ��

	public int userCheck(String id,String pass) {
		int check = 0;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql="select * from member where id=?;";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, id);
			ResultSet rs = pre.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(pass)) {
						check =1;
						MemberBean jmb = new MemberBean();
					/*
					 * jmb.setId(rs.getString("id")); jmb.setName(rs.getString("name"));
					 * jmb.setPass(rs.getString("pass"));
					 */
					}else {
						check =0;
					}
				}else {
					check=-1;
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("check : " +check);
		return check;
	}//userCheck ��
	
	
	public MemberBean getMember(String id) {
		
		MemberBean jmb = new MemberBean();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";

			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql = "select * from member where id=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, id);
			ResultSet rs = pre.executeQuery();
			
			while(rs.next()) {
				jmb.setId(rs.getString("id"));
				jmb.setName(rs.getString("name"));
				jmb.setPass(rs.getString("pass"));
				jmb.setAge(rs.getInt("age"));
				jmb.setGender(rs.getString("gender"));
				jmb.setEmail(rs.getString("email"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jmb;
		
	}//getMember ��
	
	public void updateMember(MemberBean jmb) {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";

			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql = "update member set name=?,age=?,gender=?,email=? where id=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, jmb.getName());
			pre.setInt(2, jmb.getAge());
			pre.setString(3, jmb.getGender());
			pre.setString(4, jmb.getEmail());
			pre.setString(5, jmb.getId());
			
			pre.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}//update
	
	public void deleteMember(String id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";

			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql = "delete from member where id=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, id);
			
			pre.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}//deleteMember
	
	public List getMemberList() {
		List memberList = new ArrayList();
		
		try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
				String dbuser = "jspid";
				String dbpass = "jsppass";
				Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
				
				String sql="select * from member";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt = con.prepareStatement(sql);
				
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MemberBean jmb = new MemberBean();
					jmb.setId(rs.getString("id"));
					jmb.setPass(rs.getString("pass"));
					jmb.setName(rs.getString("name"));
					jmb.setAge(rs.getInt("age"));
					jmb.setGender(rs.getString("gender"));
					jmb.setEmail(rs.getString("email"));
					jmb.setReg_date(rs.getTimestamp("reg_date"));
				
					
					memberList.add(jmb);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}//getMemberList
	
	
	public int userCheck(MemberBean mb) {
		int check = 0;
		try { //예외가 발생할 것같은 구문
			Connection con = getConnection();
		 	String sql = "select * from member where id =?";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setString(1, mb.getId());

		 	//4단계 : sql문 실행
		 	
		 	ResultSet rs = pre.executeQuery();
		
		 	if(rs.next()){	//db비교
 				// 아이디 일치
 				if (rs.getString(2).equals(mb.getPass())) {
 					// = if(pass.equals(rs.getString("pass")))
 					System.out.println("dao check "+check);
 					check = 1;
 				} else {
 					System.out.println("dao check "+check);
 					check =0;
		 	
 				}
		 	}else {
		 		System.out.println("dao check "+check);
		 		check=-1;
		 	}
			}catch (Exception e) {
				// 예외가 발생하면 처리하는 구문
				e.printStackTrace(); // 예외 추적
			}
		return check;
	}//usercheck
	
	public int userDupCheck(String id) {
		int check = 1;
		try { //예외가 발생할 것같은 구문
			Connection con = getConnection();
		 	String sql = "select * from member where id=?;";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setString(1, id);
		 	ResultSet rs = pre.executeQuery();
		 	System.out.print("id:"+id);
		 	if(rs.next()) {
		 		if(rs.getString("id").equals(id)){
		 			//중복될 때
		 			check = 1;
		 			System.out.print("중복"+check);
		 		}
		 	}else{
	 			//중복안될 때
	 			check = 0;
	 			System.out.print("중복안됨"+check);
	 		}
		 	
		} catch (Exception e) {
			e.printStackTrace(); // 예외 추적
		}
		
		return check;
	}//userDupCheck

	
	
	
	
	

}
