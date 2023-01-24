package module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NewMenuDao {
	private static NewMenuDao instance;
	private Connection conn;
	
	// DB Connect
	private NewMenuDao() throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
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
	public static NewMenuDao getInstance() throws ClassNotFoundException {
		if (instance == null)
			instance = new NewMenuDao();
		return instance;
	}
	
	// 신메뉴 다 꺼내기
	public ArrayList<NewMenu> getAllmenu() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NewMenu> list = new ArrayList<NewMenu> ();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM new");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NewMenu nm = new NewMenu();
				nm.setMenuId(rs.getString("id"));
				list.add(nm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
