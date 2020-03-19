package jmember;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class JMemberDAO {

	public void insertMember(JMemberBean jmb) { // 기능 단위는 메서드로 묶음
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql = "insert into jmember(id,pass,name,age,gender,email,reg_date) values(?,?,?,?,?,?,?)";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, jmb.getId());
			pre.setString(2, jmb.getPass());
			pre.setString(3, jmb.getName());
			pre.setInt(4, jmb.getAge());
			pre.setString(5, jmb.getGender());
			pre.setString(6, jmb.getEmail());
			pre.setTimestamp(7, jmb.getReg_date());
			
			System.out.println("디비단에서 받아온 id : " + jmb.getId());
			System.out.println("디비단에서 받아온 pass : " + jmb.getPass());
			System.out.println("디비단에서 받아온 name : " + jmb.getName());
			System.out.println("디비단에서 받아온 age : " + jmb.getAge());
			System.out.println("디비단에서 받아온 gender : " + jmb.getGender());
			System.out.println("디비단에서 받아온 email : " + jmb.getEmail());
			System.out.println("디비단에서 받아온 reg_date : " + jmb.getReg_date());
			
			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// insertMember 끝

	public int userCheck(String id,String pass) {
		int check = 0;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql="select * from jmember where id=?;";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, id);
			ResultSet rs = pre.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(pass)) {
						check =1;
						JMemberBean jmb = new JMemberBean();
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
	}//userCheck 끝
	
	
	public JMemberBean getMember(String id) {
		
		JMemberBean jmb = new JMemberBean();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";

			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql = "select * from jmember where id=?";
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
		
	}//getMember 끝
	
	public void updateMember(JMemberBean jmb) {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";

			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql = "update jmember set name=?,age=?,gender=?,email=? where id=?";
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
			String sql = "delete from jmember where id=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, id);
			
			pre.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}//deleteMember
	
	public List getMemberList() {
		List jmemberList = new ArrayList();
		
		try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
				String dbuser = "jspid";
				String dbpass = "jsppass";
				Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
				
				String sql="select * from jmember";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt = con.prepareStatement(sql);
				
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					JMemberBean jmb = new JMemberBean();
					jmb.setId(rs.getString("id"));
					jmb.setPass(rs.getString("pass"));
					jmb.setName(rs.getString("name"));
					jmb.setAge(rs.getInt("age"));
					jmb.setGender(rs.getString("gender"));
					jmb.setEmail(rs.getString("email"));
					jmb.setReg_date(rs.getTimestamp("reg_date"));
				
					
					jmemberList.add(jmb);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jmemberList;
	}//getMemberList
}
