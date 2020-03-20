package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class commentDAO {
	
	public void insertComment(commentBean cm) {
		int number =0;
		
		try {
			//1단계
			Class.forName("com.mysql.jdbc.Driver");
			//2단계 : 경로설정
		 	String dburl = "jdbc:mysql://localhost:3306/jspdb1";
		 	String dbUser = "jspid";
		 	String dbPass = "jsppass";
		 	//3단계
		 	Connection con = DriverManager.getConnection(dburl, dbUser, dbPass);
		 	String sql="select max(num) from comment";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	ResultSet rs = pre.executeQuery();
		 	
		 	if(rs.next()) {
		 		number = rs.getInt("max(num)")+1;
		 		System.out.print("number"+number);
		 	}else {
		 		number=1;
		 	}
		 	
		 	sql="insert into comment(num,id,content,date,ref) values(?,?,?,?,?)";
		 	pre = con.prepareStatement(sql);
		 	
		 	System.out.println(cm.getId());
		 	pre.setInt(1, number);
		 	pre.setString(2, cm.getId());
		 	pre.setString(3, cm.getContent());
		 	pre.setTimestamp(4, cm.getReg_date());
		 	pre.setInt(5, cm.getRef());
		 	
		 	pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertComment
	
	
	public List getCommentList(int num) {
		List commentlist = new ArrayList();
		
		try {
			//1단계
			Class.forName("com.mysql.jdbc.Driver");
			//2단계 : 경로설정
		 	String dburl = "jdbc:mysql://localhost:3306/jspdb1";
		 	String dbUser = "jspid";
		 	String dbPass = "jsppass";
		 	//3단계
		 	Connection con = DriverManager.getConnection(dburl, dbUser, dbPass);
		 	String sql="select * from comment where ref=?";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setInt(1, num);
		 	ResultSet rs = pre.executeQuery();
		 	
		 	while(rs.next()) {
		 		commentBean cm = new commentBean();
		 		cm.setNum(rs.getInt("num"));
		 		cm.setId(rs.getString("id"));
		 		cm.setContent(rs.getString("content"));
		 		cm.setReg_date(rs.getTimestamp("date"));
//		 		cm.setRef(rs.getInt("ref"));
		 		
		 	commentlist.add(cm);
		 	
		 	}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return commentlist;
	}

}
