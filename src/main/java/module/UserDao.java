package module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	private static UserDao instance;
	private Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private UserDao() {
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
	public static UserDao getInstance() throws ClassNotFoundException {
		if (instance == null)
			instance = new UserDao();
		return instance;
	}
	 
	// 로그인 확인
	public User selectOne(String id) {
		User user = new User();
		System.out.println("selecOne e들어왔다 ");
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user WHERE u_id = ?");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				user.setU_id(id);
				user.setU_name(rs.getString("u_name"));
				user.setU_pwd(rs.getString("u_password"));
				user.setU_power(rs.getString("u_power"));
				user.setU_phone(rs.getString("u_phone"));
				user.setU_birth(rs.getString("u_address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public void joinUser (User user) {
		System.out.println("insetUser submit");
		try {
			pstmt = conn.prepareStatement("INSERT INTO user VALUES (?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getU_id());
			pstmt.setString(2, user.getU_name());
			pstmt.setString(3, user.getU_pwd());
			pstmt.setString(4, "c");
			pstmt.setString(5, user.getU_phone());
			pstmt.setString(6, user.getU_birth());
			pstmt.setString(7, user.getU_address());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println("실패혔다");
	}

}
