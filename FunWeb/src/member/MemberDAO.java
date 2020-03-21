package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MemberDAO {
	
	private Connection getConnection() throws Exception{
		//�삁�쇅泥섎━瑜� 硫붿꽌�뱶 �샇異쒗븳 怨녹뿉�꽌 泥섎━�븯寃좊떎
		
	 	//1�떒怨�
		Class.forName("com.mysql.jdbc.Driver");
		//2�떒怨� : 寃쎈줈�꽕�젙
	 	String dburl = "jdbc:mysql://localhost:3306/jspdb1";
	 	String dbUser = "jspid";
	 	String dbPass = "jsppass";
	 	//3�떒怨�
	 	Connection con = DriverManager.getConnection(dburl, dbUser, dbPass);

	 	return con;
	}
	

	public void insertMember(MemberBean mb) {
		try { //�삁�쇅媛� 諛쒖깮�븷 寃껉컳�� 援щЦ
			Connection con = getConnection();
		 	String sql = "insert into member(id,pass,name,email,address,reg_date,postcode,detailAddress,extraAddress) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, mb.getId());
			pre.setString(2, mb.getPass());
			pre.setString(3, mb.getName());
			pre.setString(4, mb.getEmail());
			pre.setString(5, mb.getAddress());
			pre.setTimestamp(6, mb.getReg_date());
			pre.setString(7, mb.getPostcode());
			pre.setString(8, mb.getDetailAddress());
			pre.setString(9, mb.getExtraAddress());

			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// insertMember 占쏙옙

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
	}//userCheck 占쏙옙
	
	
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
				jmb.setEmail(rs.getString("email"));
				jmb.setAddress(rs.getString("address"));
				jmb.setPostcode(rs.getString("postcode"));
				jmb.setDetailAddress(rs.getString("detailAddress"));
				jmb.setExtraAddress(rs.getString("extraAddress"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jmb;
		
	}//getMember 占쏙옙
	
	public void updateMember(MemberBean jmb) {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1"; 
			String dbuser = "jspid";
			String dbpass = "jsppass";

			Connection con = DriverManager.getConnection(dburl,dbuser,dbpass);
			String sql = "update member set name=?,pass=?,email=?,address=?,postcode=?,detailAddress=?,extraAddress=? where id=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, jmb.getName());
			pre.setString(2, jmb.getPass());
			pre.setString(3, jmb.getEmail());
			pre.setString(4, jmb.getAddress());
			pre.setString(5, jmb.getPostcode());
			pre.setString(6, jmb.getDetailAddress());
			pre.setString(7, jmb.getExtraAddress());
			pre.setString(8, jmb.getId());
			
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
		try { //�삁�쇅媛� 諛쒖깮�븷 寃껉컳�� 援щЦ
			Connection con = getConnection();
		 	String sql = "select * from member where id =?";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setString(1, mb.getId());

		 	//4�떒怨� : sql臾� �떎�뻾
		 	
		 	ResultSet rs = pre.executeQuery();
		
		 	if(rs.next()){	//db鍮꾧탳
 				// �븘�씠�뵒 �씪移�
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
				// �삁�쇅媛� 諛쒖깮�븯硫� 泥섎━�븯�뒗 援щЦ
				e.printStackTrace(); // �삁�쇅 異붿쟻
			}
		return check;
	}//usercheck
	
	public int userDupCheck(String id) {
		int check = 1;
		try { //�삁�쇅媛� 諛쒖깮�븷 寃껉컳�� 援щЦ
			Connection con = getConnection();
		 	String sql = "select * from member where id=?;";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setString(1, id);
		 	ResultSet rs = pre.executeQuery();
		 	System.out.print("id:"+id);
		 	if(rs.next()) {
		 		if(rs.getString("id").equals(id)){
		 			//以묐났�맆 �븣
		 			check = 1;
		 			System.out.print("id is exist "+check);
		 		}
		 	}else{
	 			//以묐났�븞�맆 �븣
	 			check = 0;
	 			System.out.print("id is no exist "+check);
	 		}
		 	
		} catch (Exception e) {
			e.printStackTrace(); // �삁�쇅 異붿쟻
		}
		
		return check;
	}//userDupCheck

	
	
	
	
	

}
