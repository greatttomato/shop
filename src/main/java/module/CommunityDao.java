package module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommunityDao {
	
	private static CommunityDao instance;
	private Connection conn;
	
	// DB Connect
	private CommunityDao() throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/market?severTimezone=UTC","root","1111");
			System.out.println("성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("데이터베이스 에러");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC 연결 에러");
		}
	}
	
	// MemberDao 타입의 (오브젝트)인스턴스 생성 메소드 (싱글톤) ★★★★★★★★★★
	public static CommunityDao getInstance() throws ClassNotFoundException {
		if (instance == null)
			instance = new CommunityDao();
		return instance;
	}
	
	// 게시글 불러오기
	public ArrayList<Community> getAllPost() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Community> list = new ArrayList<Community>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM board");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Community com = new Community();
				com.setIndex(rs.getInt("index"));
				com.setId(rs.getString("u_id"));
				com.setPostTitle(rs.getString("title"));
				com.setWriteDate(rs.getString("date"));
				
				list.add(com);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 게시글 내용 불러오기
	public Community getPostContent( ) {
		Community com = new Community();
		
		return com;
	}
	
	public static void main(String[] args) throws ClassNotFoundException {
		new CommunityDao();

	}
}
