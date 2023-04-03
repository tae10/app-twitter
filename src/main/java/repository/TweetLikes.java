package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class TweetLikes {
	
	
	static final String url = "jdbc:oracle:thin:@192.168.4.22:1521:xe";
	static final String user = "C##TAE_TWITTER";
	static final String password = "1q2w3e4r";
	
	public static int create(String owner, String code ) {
		try {
			Connection conn = DriverManager.getConnection(url, user, password);

			String sql = "INSERT INTO Tweet_Like(OWNER, CODE) VALUES(?, ?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,owner);
			ps.setString(2, code);
	

			int r = ps.executeUpdate();
			conn.close();

			return r;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;

		}

	}
	
	

}
