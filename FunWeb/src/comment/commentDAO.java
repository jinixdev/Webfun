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
		int p_num =0;
		int r_num =0;
		
		try {
			//1단계
			Class.forName("com.mysql.jdbc.Driver");
			//2단계 : 경로설정
		 	String dburl = "jdbc:mysql://localhost:3306/jspdb1";
		 	String dbUser = "jspid";
		 	String dbPass = "jsppass";
		 	//3단계
		 	Connection con = DriverManager.getConnection(dburl, dbUser, dbPass);
		 	String sql="select max(num),max(r_num) from comment";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	ResultSet rs = pre.executeQuery();
		 	
		 	if(rs.next()) {
		 		number = rs.getInt("max(num)")+1;
		 		r_num = rs.getInt("max(r_num)")+1;
		 		System.out.print("number"+number);
		 	}else {
		 		number=1;
		 		r_num=1;
		 		
		 	}
		 	
		 	sql="insert into comment(num,id,content,date,c_num) values(?,?,?,?,?)";
		 	pre = con.prepareStatement(sql);
		 	
		 	System.out.println(cm.getId());
		 	pre.setInt(1, number);
		 	pre.setString(2, cm.getId());
		 	pre.setString(3, cm.getContent());
		 	pre.setTimestamp(4, cm.getReg_date());
		 	pre.setInt(5, r_num);
		 	
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
		 	String sql="select * from comment where p_num&&r_num";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setInt(1, num);
		 	ResultSet rs = pre.executeQuery();
		 	
		 	while(rs.next()) {
		 		commentBean cm = new commentBean();
		 		cm.setNum(rs.getInt("num"));
		 		cm.setId(rs.getString("id"));
		 		cm.setContent(rs.getString("content"));
		 		cm.setReg_date(rs.getTimestamp("date"));
		 		cm.setP_num(rs.getInt("p_num"));
		 		cm.setR_num(rs.getInt("r_num"));
		 		
		 		
		 	commentlist.add(cm);
		 	
		 	}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return commentlist;
	}//getCommentList
	
	public commentBean getcomment(int num,int p_num) {
		commentBean cb = new commentBean();
		try {
			//1단계
			Class.forName("com.mysql.jdbc.Driver");
			//2단계 : 경로설정
		 	String dburl = "jdbc:mysql://localhost:3306/jspdb1";
		 	String dbUser = "jspid";
		 	String dbPass = "jsppass";
		 	//3단계
		 	Connection con = DriverManager.getConnection(dburl, dbUser, dbPass);
		 	String sql="select * from comment where num=?&&p_num=?";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setInt(1, num);
		 	pre.setInt(2, p_num);
		 	ResultSet rs = pre.executeQuery();
		 	
		 	if(rs.next()) {
		 	cb.setNum(rs.getInt("num"));
		 	cb.setId(rs.getString("id"));
		 	cb.setContent(rs.getString("content"));
		 	cb.setP_num(rs.getInt("p_num"));
		 	cb.setReg_date(rs.getTimestamp("date"));
		 	}
		} catch (Exception e) {
			// TODO: handle exception
		}
			return cb;		
	}
	
	
	
	
	
	public void commentUpdate(commentBean cb) {
		try {
			//1단계
			Class.forName("com.mysql.jdbc.Driver");
			//2단계 : 경로설정
		 	String dburl = "jdbc:mysql://localhost:3306/jspdb1";
		 	String dbUser = "jspid";
		 	String dbPass = "jsppass";
		 	//3단계
		 	Connection con = DriverManager.getConnection(dburl, dbUser, dbPass);
		 	String sql="update comment set content=? where num=?&&p_num=?";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setString(1, cb.getContent());
		 	pre.setInt(2, cb.getNum());
		 	pre.setInt(3, cb.getP_num());
		 	pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//commentUpdate
	
	public void commentDelete(int num,int p_num,int r_num) {
		try {
			//1단계
			Class.forName("com.mysql.jdbc.Driver");
			//2단계 : 경로설정
		 	String dburl = "jdbc:mysql://localhost:3306/jspdb1";
		 	String dbUser = "jspid";
		 	String dbPass = "jsppass";
		 	//3단계
		 	Connection con = DriverManager.getConnection(dburl, dbUser, dbPass);
		 	String sql="delete from comment where num=?&&p_num=?&&r_num";
		 	PreparedStatement pre = con.prepareStatement(sql);
		 	pre.setInt(1, num);
		 	pre.setInt(2, p_num);
		 	pre.setInt(3, r_num);
		 	pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}//commentDelete
	

}
