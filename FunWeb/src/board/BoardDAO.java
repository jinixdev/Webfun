package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class BoardDAO {
	
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
	    DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB"); //장소/jdbc/MysqlDB
		Connection con = ds.getConnection(); //java.sql
		return con;
	}
	

	public void write(BoardBean bb) {
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		try {
			System.out.println(bb.getName());

			int num = 0;
			int readcount = 0;

			con = getConnection();

			
			 String sql = "select max(num) from board"; 
			 pre = con.prepareStatement(sql); 
			 rs= pre.executeQuery();
			 
			 if(rs.next()) { num = rs.getInt("max(num)")+1; }
			 

			sql = "insert into board(name,pass,subject,content,num,readcount,date,id,file) values(?,?,?,?,?,?,?,?,?)";
			pre = con.prepareStatement(sql);
			pre.setString(1, bb.getName());
			pre.setString(2, bb.getPass());
			pre.setString(3, bb.getSubject());
			pre.setString(4, bb.getContent());
			pre.setInt(5, num);
			pre.setInt(6, readcount);
			pre.setTimestamp(7, bb.getDate());
			pre.setString(8, bb.getId());
			pre.setString(9, bb.getFile());

			pre.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
	}//write
	
	public List getboardList(int startRow,int pageSize) {
		List jbblist = new ArrayList();
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			con = getConnection();

			
//			 String sql = "select * from board order by num desc";
			String sql = "select * from board order by num desc limit ?,?";
			 pre = con.prepareStatement(sql); 
			 pre.setInt(1, startRow-1); //startRow 시작을 포함하지 않기때문에 -1
			 pre.setInt(2, pageSize);
			 rs= pre.executeQuery();
			 while(rs.next()) {
				 BoardBean jbb = new BoardBean();
				 String s = new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("date"));
				 jbb.setNum(rs.getInt("num"));
				 jbb.setName(rs.getString("name"));
				 jbb.setPass(rs.getString("pass"));
				 jbb.setSubject(rs.getString("subject"));
				 jbb.setContent(rs.getString("content"));
				 jbb.setDate(rs.getTimestamp("date"));
				 jbb.setReadcount(rs.getInt("readcount"));
				 jbb.setFile(rs.getString("file"));
				 
				 jbblist.add(jbb);
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		return jbblist;
	}//getboardList
	
	public List getboardList(String name) {
		List jbblist = new ArrayList();
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			
			con = getConnection();

			 String sql = "select * from board where name=? order by num desc";
			 pre = con.prepareStatement(sql); 
			 pre.setString(1, name);
			 rs= pre.executeQuery();
			 while(rs.next()) {
				 BoardBean jbb = new BoardBean();
//				 String s = new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("date"));
				 jbb.setNum(rs.getInt("num"));
				 jbb.setName(rs.getString("name"));
				 jbb.setPass(rs.getString("pass"));
				 jbb.setSubject(rs.getString("subject"));
				 jbb.setContent(rs.getString("content"));
				 jbb.setDate(rs.getTimestamp("date"));
				 jbb.setReadcount(rs.getInt("readcount"));
				 
				 jbblist.add(jbb);
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		return jbblist;
	}//getboardList(String id)
	
	public BoardBean getboardContent(int num) {
		BoardBean jbb = new BoardBean();
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			
			con = getConnection();
			
			 String sql = "update board set readcount=readcount+1 where num=?"; 
			 pre = con.prepareStatement(sql); 
			 pre.setInt(1, num);
			 pre.executeUpdate();
			
			 sql = "select * from board where num=?"; 
			 pre = con.prepareStatement(sql); 
			 pre.setInt(1, num);
			 rs= pre.executeQuery();
			 if(rs.next()) {
				 jbb.setNum(rs.getInt("num"));
				 jbb.setId(rs.getString("id"));
				 jbb.setName(rs.getString("name"));
				 jbb.setPass(rs.getString("pass"));
				 jbb.setSubject(rs.getString("subject"));
				 jbb.setContent(rs.getString("content"));
				 jbb.setDate(rs.getTimestamp("date"));
				 jbb.setReadcount(rs.getInt("readcount"));
				 jbb.setFile(rs.getString("file"));
				 
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		return jbb;
	}//getboardList
	
	public void updateBoard(int num,BoardBean jbb) {
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			con = getConnection();
			String sql="update board set subject=?,content=? where num=?";
			pre = con.prepareStatement(sql);
			System.out.print(jbb.getSubject());
			pre.setString(1, jbb.getSubject());
			pre.setString(2, jbb.getContent());
			pre.setInt(3, num);
			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
	}//updateBoard
	
	public int passCheck(int num,String pass) {
		int check =0;
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			con = getConnection();
			String sql="select * from board where num=?";
			pre = con.prepareStatement(sql);
			pre.setInt(1, num);
			rs = pre.executeQuery();
			
			if(rs.next()) {
			if(pass.equals(rs.getString("pass"))){
				check = 1;
			}else {
				check =-1;
			}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		return check;
	}//passCheck
	
	public void deleteBoard(int num) {
		PreparedStatement pre=null;
		Connection con=null;
		try {
			con = getConnection();
			String sql="delete from board where num=?;";
			pre = con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		
	}//deleteBoard
	
	public int getBoardCount() {
		int count=0;
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			con = getConnection();
			String sql="select count(num) from board";
			pre = con.prepareStatement(sql);
			rs= pre.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(num)"); 
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		System.out.print("count(num)"+count);
		return count;
		
		
	}//getBoardCount

	
	
	
	

}
