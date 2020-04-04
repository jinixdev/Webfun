package gallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;


public class galleryDAO {
	
private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
	    DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB"); //장소/jdbc/MysqlDB
		Connection con = ds.getConnection(); //java.sql
		return con;
	}
	

	public void write(galleryBean gb) {
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		try {

			int num = 0;

			con = getConnection();

			
			 String sql = "select max(num) from g_board"; 
			 pre = con.prepareStatement(sql); 
			 rs= pre.executeQuery();
			 
			 if(rs.next()) { num = rs.getInt("max(num)")+1; }
			 else {
				 num =1;
			 }
			 if(pre!=null) try{pre.close();}catch(SQLException ex) {}

			sql = "insert into g_board(num,id,img,content,date,eattype,placename,placeaddr,star,name) values(?,?,?,?,?,?,?,?,?,?)";
			pre = con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.setString(2, gb.getId());
			pre.setString(3, gb.getFile());
			pre.setString(4, gb.getContent());
			pre.setTimestamp(5, gb.getDate());
			pre.setString(6, gb.getEattype());
			pre.setString(7, gb.getPlacename());
			pre.setString(8, gb.getPlaceaddr());
			pre.setString(9, gb.getStar());
			pre.setString(10, gb.getName());
			

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
		List gblist = new ArrayList();
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			con = getConnection();

			
			//String sql = "select * from board order by num desc";
			String sql = "select * from g_board group by placename order by num desc limit ?,?";
			pre = con.prepareStatement(sql); 
			pre.setInt(1, startRow-1); //startRow 시작을 포함하지 않기때문에 -1
			pre.setInt(2, pageSize);
			rs= pre.executeQuery();
			while(rs.next()) {
				galleryBean gb = new galleryBean();
				//String s = new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("date"));
				gb.setNum(rs.getInt("num"));
				gb.setContent(rs.getString("content"));
				gb.setDate(rs.getTimestamp("date"));
				gb.setFile(rs.getString("img"));
				gb.setId(rs.getString("id"));
				gb.setName(rs.getString("name"));
				gb.setPlacename(rs.getString("placename"));
				gb.setPlaceaddr(rs.getString("placeaddr"));
				gb.setEattype(rs.getString("eattype"));
				 
				 gblist.add(gb);
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		return gblist;
	}//getboardList
	
	// 선택한 content 가져오기
	public galleryBean getboardContent(int num) {
		galleryBean gb = new galleryBean();
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			
			con = getConnection();
			
//			 String sql = "update g_board set readcount=readcount+1 where num=?"; 
//			 pre = con.prepareStatement(sql); 
//			 pre.setInt(1, num);
//			 pre.executeUpdate();
			
			 String sql = "select * from g_board where num=?"; 
			 pre = con.prepareStatement(sql); 
			 pre.setInt(1, num);
			 rs= pre.executeQuery();
			 if(rs.next()) {
				 gb.setNum(rs.getInt("num"));
				 gb.setId(rs.getString("id"));
				 gb.setName(rs.getString("name"));
				 gb.setContent(rs.getString("content"));
				 gb.setDate(rs.getTimestamp("date"));
				 gb.setFile(rs.getString("img"));
				 gb.setEattype(rs.getString("eattype"));
				 gb.setPlacename(rs.getString("placename"));
				 gb.setPlaceaddr(rs.getString("placeaddr"));
				 gb.setStar(rs.getString("star"));
				 
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		return gb;
	}//getboardContent
	
	
	public List getContentList(String placename) {
		System.out.print(placename);
		List contentlist = new ArrayList();
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");

			con = getConnection();

			
			//String sql = "select * from board order by num desc";
			String sql = "select * from g_board where placename=? order by num desc";
			pre = con.prepareStatement(sql); 
			pre.setString(1, placename);
			rs= pre.executeQuery();
			while(rs.next()) {
				galleryBean gb = new galleryBean();
				//String s = new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("date"));
				gb.setNum(rs.getInt("num"));
				gb.setId(rs.getString("id"));
				gb.setContent(rs.getString("content"));
				gb.setDate(rs.getTimestamp("date"));
				gb.setFile(rs.getString("img"));
				gb.setName(rs.getString("name"));
				gb.setPlacename(rs.getString("placename"));
				gb.setPlaceaddr(rs.getString("placeaddr"));
				gb.setStar(rs.getString("star"));
				gb.setEattype(rs.getString("eattype"));
				
				 
				contentlist.add(gb);
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) try {rs.close();}catch(SQLException ex) {}
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
		
		return contentlist;
	}//getContentList
	
	
	
	
	public void updateBoard(int num,galleryBean gb) {
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			con = getConnection();
			String sql="update g_board set img=?,content=?,placename=?,placeaddr=?,eattype=?,star=? where num=?";
			pre = con.prepareStatement(sql);
			pre.setString(1, gb.getFile());
			pre.setString(2, gb.getContent());
			pre.setString(3, gb.getPlacename());
			pre.setString(4, gb.getPlaceaddr());
			pre.setString(5, gb.getEattype());
			pre.setString(6, gb.getStar());
			pre.setInt(7, num);
			
			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			if(con!=null) try {con.close();}catch(SQLException ex) {}
		}
	}//updateBoard
	
	
	
	public void deleteBoard(int num,String category) {
		PreparedStatement pre=null;
		Connection con=null;
		try {
			con = getConnection();
			String sql="delete from g_board where num=?;";
			pre = con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.executeUpdate();
			if(pre!=null) try{pre.close();}catch(SQLException ex) {}
			
			sql="delete from comment where p_num=?&&category=?";
			pre = con.prepareStatement(sql);
			pre.setInt(1, num);
			pre.setString(2, category);
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
			String sql="select count(num) from g_board";
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
		
		return count;
		
		
	}//getBoardCount
	
	
	public int getPlaceCount(String placename) {
		int count=0;
		ResultSet rs=null;
		PreparedStatement pre=null;
		Connection con=null;
		
		try {
			con = getConnection();
			String sql="select count(num) from g_board where placename=?";
			pre = con.prepareStatement(sql);
			pre.setString(1, placename);
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
		
		return count;
		
		
	}//getPlaceCount
	
	
	// 내글 가져오기
		public List getboardList_mylst(int startRow,int pageSize,String id) {
			List jbblist = new ArrayList();
			ResultSet rs=null;
			PreparedStatement pre=null;
			Connection con=null;
			
			try {
				
				con = getConnection();

				 String sql = "select * from g_board where id=? order by num desc limit ?,?";
				 pre = con.prepareStatement(sql); 
				 pre.setString(1, id);
				 pre.setInt(2, startRow-1); //startRow 시작을 포함하지 않기때문에 -1
				 pre.setInt(3, pageSize);
				 
				 rs= pre.executeQuery();
				 while(rs.next()) {
					 galleryBean gb = new galleryBean();
//					 String s = new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("date"));
					gb.setNum(rs.getInt("num"));
					gb.setId(rs.getString("id"));
					gb.setContent(rs.getString("content"));
					gb.setDate(rs.getTimestamp("date"));
					gb.setFile(rs.getString("img"));
					gb.setName(rs.getString("name"));
					gb.setPlacename(rs.getString("placename"));
					gb.setPlaceaddr(rs.getString("placeaddr"));
					gb.setStar(rs.getString("star"));
					 
					 jbblist.add(gb);
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
		
	
		// 내글 카운트
		public int getBoardCount_mylst(String id) {
			int count=0;
			ResultSet rs=null;
			PreparedStatement pre=null;
			Connection con=null;
			
			try {
				con = getConnection();
				String sql="select count(num) from g_board where id=?";
				pre = con.prepareStatement(sql);
				pre.setString(1, id);
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
			
			return count;
			
			
		}//getBoardCount(String id)
		
		// place 평점
			public int getPlaceRating(String placename) {
				int rating=0;
				ResultSet rs=null;
				PreparedStatement pre=null;
				Connection con=null;
				
				try {
					con = getConnection();
					String sql="select avg(star) rating from g_board group by placename having placename=?";
					pre = con.prepareStatement(sql);
					pre.setString(1, placename);
					rs= pre.executeQuery();
					if(rs.next()) {
						rating = rs.getInt("rating"); 
					 }
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}
					if(pre!=null) try{pre.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}
				}
				
				return rating;
				
				
			}//getPlaceRating(String placename)
	
			// ===================================search=====================================
			public int getBoardCount(String search) {
				int count=0;
				ResultSet rs=null;
				PreparedStatement pre=null;
				Connection con=null;
				
				try {
					con = getConnection();
					String sql="select count(num) from g_board where placename like ? ";
					pre = con.prepareStatement(sql);
					pre.setString(1, "%"+search+"%");
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
				
				return count;
				
				
			}//getBoardCount

			
			public List getboardList_search(int startRow,int pageSize,String search) {
				List glist = new ArrayList();
				ResultSet rs=null;
				PreparedStatement pre=null;
				Connection con=null;
				
				try {
					
					Class.forName("com.mysql.jdbc.Driver");

					con = getConnection();

					
//					 String sql = "select * from board order by num desc";
					String sql = "select * from g_board where placename like ? order by num desc limit ?,?";
					 pre = con.prepareStatement(sql); 
					 pre.setString(1, "%"+search+"%");
					 pre.setInt(2, startRow-1); //startRow 시작을 포함하지 않기때문에 -1
					 pre.setInt(3, pageSize);
					 rs= pre.executeQuery();
					 while(rs.next()) {
						 galleryBean gb = new galleryBean();
//						 String s = new SimpleDateFormat("yyyy-MM-dd").format(rs.getTimestamp("date"));
						gb.setNum(rs.getInt("num"));
						gb.setContent(rs.getString("content"));
						gb.setDate(rs.getTimestamp("date"));
						gb.setFile(rs.getString("img"));
						gb.setId(rs.getString("id"));
						gb.setName(rs.getString("name"));
						gb.setPlacename(rs.getString("placename"));
						gb.setPlaceaddr(rs.getString("placeaddr"));
						 
						 glist.add(gb);
					 }
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					if(rs!=null) try {rs.close();}catch(SQLException ex) {}
					if(pre!=null) try{pre.close();}catch(SQLException ex) {}
					if(con!=null) try {con.close();}catch(SQLException ex) {}
				}
				
				return glist;
			}//getboardList
	
	

}
