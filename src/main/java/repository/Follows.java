package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import data.Follow;
import data.User;

public class Follows {

	static final String url = "jdbc:oracle:thin:@192.168.4.22:1521:xe";
	static final String user = "C##TAE_TWITTER";
	static final String password = "1q2w3e4r";

	public static int create(String code, String owner, String target) {
		try {
			Connection conn = DriverManager.getConnection(url, user, password);

			String sql = "INSERT INTO FOLLOWS VALUES(?,?,?,SYSDATE)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, owner);
			ps.setString(3, target);

			int r = ps.executeUpdate();
			conn.close();

			return r;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;

		}

	}

	public static List<Follow> findByOwner(String owner) {
		try {
			// 1.연결
			Connection conn = DriverManager.getConnection(url, user, password);
			List<Follow> li = new ArrayList<>();
			String sql = "select * from follows join users on users.id =follows.target where owner=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, owner);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Follow one = new Follow();
				one.setTarget(rs.getString("target"));
				
                   User targetUser =new User();
                    targetUser.setNick(rs.getString("nick"));
                    targetUser.setId(rs.getString("id"));
                    
                    one.setTargetUser(targetUser);
                    
                    
				li.add(one);
				
			}
			conn.close();
			return li;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static List<Follow> findByTarget(String target) {
		try {
			// 1.연결
			Connection conn = DriverManager.getConnection(url, user, password);
			List<Follow> li = new ArrayList<>();
			String sql = "select*from follows where target=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, target);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Follow one = new Follow();
				one.setOwner(rs.getString("owner"));

				li.add(one);
			}
			conn.close();
			return li;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	public static int unFollow(String owner,String target){
		try {
			Connection conn = DriverManager.getConnection(url, user, password);

			String sql = "DELETE FROM FOLLOWS WHERE OWNER=? AND TARGET=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, owner);
			ps.setString(2, target);
	
			int r = ps.executeUpdate();
			conn.close();
             
			return r;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;

		}
		
		
		
		
		
		
		
		
	}
	
	
	

}