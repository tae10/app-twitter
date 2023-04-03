package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import data.User;

public class Users {
	
	static final String url="jdbc:oracle:thin:@192.168.4.22:1521:xe";
	static final String user="C##TAE_TWITTER";
	static final String password="1q2w3e4r";
	
	//데이터 등록시 사용할 function
	public static int create(String id,String pass, String nick) {
		try {
			 //1.연결
			Connection conn =DriverManager.getConnection(url,user,password);
			
			//2 요청객체 준비
			String sql ="INSERT INTO USERS(ID,PASS,NICK) VALUES(?,?,?)";
			PreparedStatement ps =conn.prepareStatement(sql);
			
			ps.setString(1, id);
			ps.setString(2, pass);
			ps.setString(3,nick);

			int r =ps.executeUpdate();
			conn.close();
			
			return r ;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
	}
	//특정ID를 가진 데이터를 찾고자할떄 사용할 function	
	public static User findById(String id) {
		try {
			//1.연결
	Connection conn=	DriverManager.getConnection(url,user,password);
	   
	     String sql ="select*from users where id=?";
		PreparedStatement ps =	conn.prepareStatement(sql);
		    ps.setString(1, id);
	ResultSet rs	=  ps.executeQuery();
		    User one =null;
		    if(rs.next()) {
		    	one = new User();
				one.setId(id);
				one.setPass(rs.getString("pass"));
				one.setNick(rs.getString("nick"));
				one.setProfile(rs.getString("profile"));
				one.setJoined(rs.getDate("joined"));
				one.setImg(rs.getString("img"));
		    	
		    }
		 
	   conn.close();
	   return one;
	
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		

		
		
		
		
		
	}
	//특정 ID의 컬럼 값을 변경하는 메서드를 만들어보자
	public static int updateOne(String id,String nick,String profile,String img) {
		try {
			 //1.연결
			Connection conn =DriverManager.getConnection(url,user,password);
			
			//2 요청객체 준비
			String sql = "UPDATE USERS SET NICK=?, PROFILE=?, IMG=? WHERE ID=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			
			ps.setString(1, nick);
			ps.setString(2,profile);
			ps.setString(3,img);
			ps.setString(4, id);
			
			
			int r =ps.executeUpdate();
			conn.close();
			
			return r ;
			
			
		}catch(Exception e) {   //1이면 처리 0이면데이터못찾은거 -1이면 쿼리가잘못됬거나 뭔가잘못
			e.printStackTrace();
			return -1;
		}
		
	}
	public static List<User> findByKeyword(String keyword){
		
		try {
			 //1.연결
			Connection conn =DriverManager.getConnection(url,user,password);
			
			//2 요청객체 준비
			 List<User> li=new ArrayList<>();
			 String sql = "SELECT USERS.*, NVL(FOLLOWERS.CNT, 0) AS CNT FROM USERS LEFT JOIN FOLLOWERS ON USERS.ID = FOLLOWERS.TARGET ";
				sql += " WHERE ID LIKE '%'||?|| '%' OR NICK LIKE ? OR PROFILE LIKE ?";
			 //setString 으로 "%"+keyword+"%" 만들어서 세팅
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, keyword);
			ps.setString(2, "%" + keyword + "%");
			ps.setString(3, "%" + keyword + "%");
			ResultSet rs	=  ps.executeQuery();
			while (rs.next()) {
				User one = new User();
				one.setId(rs.getString("id"));
				one.setPass(rs.getString("pass"));
				one.setNick(rs.getString("nick"));
				one.setProfile(rs.getString("profile"));
				one.setJoined(rs.getDate("joined"));
				one.setImg(rs.getString("img"));
				one.setFollowerCnt(rs.getInt("cnt"));
				li.add(one);
			}
			
			
			conn.close();
			
			return li;
	
			
			
		}catch(Exception e) {   //1이면 처리 0이면데이터못찾은거 -1이면 쿼리가잘못됬거나 뭔가잘못
			e.printStackTrace();
			return null;
		}
		
		
		
	}
	

}
