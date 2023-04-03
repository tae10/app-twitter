package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import data.TweetAttach;

public class TweetAttaches {
	static final String url = "jdbc:oracle:thin:@192.168.4.22:1521:xe";
	static final String user = "C##TAE_TWITTER";
	static final String password = "1q2w3e4r";

	// 현재 인덱스 값 얻어오기
	public static int findLastIdx() {
		try {

			Connection conn = DriverManager.getConnection(url, user, password);
			String sql = "SELECT VALUE FROM TWEET_ATTACHES_IDX";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			int value = 0;
			rs.next();
			value = rs.getInt("value");

			String sql2 = "UPDATE TWEET_ATTACHES_IDX SET VALUE=VALUE+1";
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			int r = ps2.executeUpdate();
			System.out.println("r===>" + r);
			conn.close();
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;

		}

	}

	// 데이터 등록

	public static int create(int idx, String uri, String tweetCode) {
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO TWEET_ATTACHES VALUES(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setString(2, uri);
			ps.setString(3, tweetCode);

			int r = ps.executeUpdate();

			return r;

		} catch (Exception e) {
			e.printStackTrace();

			return -1;

		}
	}

	// 특정 트윗코드의 첨부물들 가지고오기

	public static List<TweetAttach> findByTweetCode(String tweetCode) {
		try {
			Connection conn = DriverManager.getConnection(url, user, password);

			String sql = "SELECT * FROM TWEET_ATTACHES WHERE TWEET_CODE=? ORDER BY IDX";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, tweetCode);
			ResultSet rs = ps.executeQuery();
			List<TweetAttach> list = new ArrayList<>();
			while (rs.next()) {
				TweetAttach one = new TweetAttach();
				one.setIdx(rs.getInt("idx"));
				one.setTweetCode(rs.getString("tweet_Code"));
				one.setUri(rs.getString("uri"));

				list.add(one);

			}
			conn.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

}
