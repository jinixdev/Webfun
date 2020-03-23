package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {

	public void write(BoardBean bb) {
		try {
			System.out.println(bb.getName());

			int num = 0;
			int readcount = 0;

			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbuser = "jspid";
			String dbpass = "jsppass";

			Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);

			
			 String sql = "select max(num) from board"; 
			 PreparedStatement pre = con.prepareStatement(sql); 
			 ResultSet rs= pre.executeQuery();
			 
			 if(rs.next()) { num = rs.getInt("max(num)")+1; }
			 

			sql = "insert into board(name,pass,subject,content,num,readcount,date) values(?,?,?,?,?,?,?)";
			pre = con.prepareStatement(sql);
			pre.setString(1, bb.getName());
			pre.setString(2, bb.getPass());
			pre.setString(3, bb.getSubject());
			pre.setString(4, bb.getContent());
			pre.setInt(5, num);
			pre.setInt(6, readcount);
			pre.setTimestamp(7, bb.getDate());

			pre.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}//write
	
	public List getboardList(int startRow,int pageSize) {
		List jbblist = new ArrayList();
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);

			
//			 String sql = "select * from board order by num desc";
			String sql = "select * from board order by num desc limit ?,?";
			 PreparedStatement pre = con.prepareStatement(sql); 
			 pre.setInt(1, startRow-1); //startRow 시작을 포함하지 않기때문에 -1
			 pre.setInt(2, pageSize);
			 ResultSet rs= pre.executeQuery();
			 while(rs.next()) {
				 BoardBean jbb = new BoardBean();
				 String s = new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("date"));
				 jbb.setNum(rs.getInt("num"));
				 jbb.setName(rs.getString("name"));
				 jbb.setPass(rs.getString("pass"));
				 jbb.setSubject(rs.getString("subject"));
				 jbb.setContent(rs.getString("content"));
				 jbb.setOnlydate(s);
				 jbb.setReadcount(rs.getInt("readcount"));
				 
				 jbblist.add(jbb);
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jbblist;
	}//getboardList
	
	public List getboardList(String name) {
		List jbblist = new ArrayList();
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);

			
			 String sql = "select * from board where name=? order by num desc";
			 PreparedStatement pre = con.prepareStatement(sql); 
			 pre.setString(1, name);
			 ResultSet rs= pre.executeQuery();
			 while(rs.next()) {
				 BoardBean jbb = new BoardBean();
				 String s = new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("date"));
				 jbb.setNum(rs.getInt("num"));
				 jbb.setName(rs.getString("name"));
				 jbb.setPass(rs.getString("pass"));
				 jbb.setSubject(rs.getString("subject"));
				 jbb.setContent(rs.getString("content"));
				 jbb.setOnlydate(s);
				 jbb.setReadcount(rs.getInt("readcount"));
				 
				 jbblist.add(jbb);
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jbblist;
	}//getboardList(String id)
	
	public BoardBean getboardContent(int num) {
		BoardBean jbb = new BoardBean();
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
			
			 String sql = "update board set readcount=readcount+1 where num=?"; 
			 PreparedStatement pre = con.prepareStatement(sql); 
			 pre.setInt(1, num);
			 pre.executeUpdate();
			
			 sql = "select * from board where num=?"; 
			 pre = con.prepareStatement(sql); 
			 pre.setInt(1, num);
			 ResultSet rs= pre.executeQuery();
			 if(rs.next()) {
				 
				 jbb.setNum(rs.getInt("num"));
				 jbb.setName(rs.getString("name"));
				 jbb.setPass(rs.getString("pass"));
				 jbb.setSubject(rs.getString("subject"));
				 jbb.setContent(rs.getString("content"));
				 jbb.setDate(rs.getTimestamp("date"));
				 jbb.setReadcount(rs.getInt("readcount"));
				 
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jbb;
	}//getboardList
	
	public void updateBoard(int num,BoardBean jbb) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
			String sql="update board set subject=?,content=? where num=?";
			PreparedStatement pre = con.prepareStatement(sql);
			System.out.print(jbb.getSubject());
			pre.setString(1, jbb.getSubject());
			pre.setString(2, jbb.getContent());
			pre.setInt(3, num);
			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//updateBoard
	
	public int passCheck(int num,String pass) {
		int check =0;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
			String sql="select * from board where num=?";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setInt(1, num);
			ResultSet rs = pre.executeQuery();
			
			if(rs.next()) {
			if(pass.equals(rs.getString("pass"))){
				check = 1;
			}else {
				check =-1;
			}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}//passCheck
	
	public void deleteBoard(int num) {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
			String sql="delete from board where num=?;";
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}//deleteBoard
	
	public int getBoardCount() {
		int count=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String dburl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbuser = "jspid";
			String dbpass = "jsppass";
			
			Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
			String sql="select count(num) from board";
			PreparedStatement pre = con.prepareStatement(sql);
			ResultSet rs= pre.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(num)"); 
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print("count(num)"+count);
		return count;
		
		
	}//getBoardCount

	
	
	
	

}
