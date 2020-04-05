package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class commentDAO {
	
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
	    DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB"); //장소/jdbc/MysqlDB
		Connection con = ds.getConnection(); //java.sql
		return con;
	}
	
	public void insertComment(commentBean cm,String category) {
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		int number =0;
		int r_num =0;
		
		try {
			con = getConnection();
			
		 	String sql="select max(num) from comment";
		 	pre = con.prepareStatement(sql);
		 	rs = pre.executeQuery();
		 	
		 	if(rs.next()) {
		 		number = rs.getInt("max(num)")+1;
		 	}else {
		 		number=1;
		 	}
		 	if(pre!=null) try{pre.close();}catch(SQLException ex) {}
		 	
		 	sql="select max(r_num) from comment where p_num=?&&category=?";
		 	pre = con.prepareStatement(sql);
		 	pre.setInt(1, cm.getP_num());
		 	pre.setString(2, cm.getCategory());
		 	rs = pre.executeQuery();
		 	if(rs.next()) {
		 		r_num = rs.getInt("max(r_num)")+1;
		 	}else {
		 		r_num=1;
		 	}
		 	
		 	
		 	
		 	sql="insert into comment(num,id,content,date,p_num,r_num,category) values(?,?,?,?,?,?,?)";
		 	pre = con.prepareStatement(sql);
		 	
		 	System.out.println(cm.getId());
		 	pre.setInt(1, number);
		 	pre.setString(2, cm.getId());
		 	pre.setString(3, cm.getContent());
		 	pre.setTimestamp(4, cm.getReg_date());
		 	pre.setInt(5, cm.getP_num());
		 	pre.setInt(6, r_num);
		 	pre.setString(7, cm.getCategory());
		 	
		 	pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
	}//insertComment
	
	
	public List getCommentList(int p_num,String category) {
		List commentlist = new ArrayList();
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			con = getConnection();
		 	String sql="select * from comment where p_num=?&&category=?";
		 	pre = con.prepareStatement(sql);
		 	pre.setInt(1, p_num);
		 	pre.setString(2, category);
		 	
		 	rs = pre.executeQuery();
		 	
		 	while(rs.next()) {
		 		commentBean cb = new commentBean();
		 		cb.setNum(rs.getInt("num"));
		 		cb.setId(rs.getString("id"));
		 		cb.setContent(rs.getString("content"));
		 		cb.setReg_date(rs.getTimestamp("date"));
		 		cb.setP_num(rs.getInt("p_num"));
		 		cb.setR_num(rs.getInt("r_num"));
		 		cb.setCategory(rs.getString("category"));
		 		
		 	commentlist.add(cb);
		 	
		 	}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		
		
		return commentlist;
	}//getCommentList
	
	public commentBean getcomment(int p_num,int r_num,String category) {
		commentBean cb = new commentBean();
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		try {
			//1단계
			con = getConnection();
		 	String sql="select * from comment where p_num=?&&r_num=?&&category=?";
		 	pre = con.prepareStatement(sql);
		 	pre.setInt(1, p_num);
		 	pre.setInt(2, r_num);
		 	rs = pre.executeQuery();
		 	
		 	if(rs.next()) {
		 		cb.setNum(rs.getInt("num"));
		 		cb.setId(rs.getString("id"));
		 		cb.setContent(rs.getString("content"));
		 		cb.setReg_date(rs.getTimestamp("date"));
		 		cb.setP_num(rs.getInt("p_num"));
		 		cb.setR_num(rs.getInt("r_num"));
		 		cb.setCategory(rs.getString("category"));
		 	}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
			return cb;		
	}
	
	
	
	
	
	public void commentUpdate(commentBean cb) {
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		try {
			con = getConnection();
			
		 	String sql="update comment set content=? where p_num=?&&r_num=?&&category=?";
		 	pre = con.prepareStatement(sql);
		 	pre.setString(1, cb.getContent());
		 	pre.setInt(2, cb.getP_num());
		 	pre.setInt(3, cb.getR_num());
		 	pre.setString(4, cb.getCategory());
		 	pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
	}//commentUpdate
	
	public void commentDelete(int num,String category) {
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		try {
			con = getConnection();
			
		 	String sql="delete from comment where num=?&&category=?";
		 	pre = con.prepareStatement(sql);
		 	pre.setInt(1, num);
		 	pre.setString(2, category);
		 	pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		
	}//commentDelete
	

}
