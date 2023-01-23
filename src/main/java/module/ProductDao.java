package module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDao {
	private static ProductDao instance;
	private Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DB Connect
	private ProductDao() throws ClassNotFoundException {
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
	public static ProductDao getInstance() throws ClassNotFoundException {
		if (instance == null)
			instance = new ProductDao();
		return instance;
	}
	
	// 메뉴 다 꺼내기
	public ArrayList<Product> getAllmenu() {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM product");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setName(rs.getString("p_name"));
				product.setCategory(rs.getString("p_category"));
				product.setManu(rs.getString("p_manu"));
				product.setSeller(rs.getString("p_seller"));
				product.setProductPrice(rs.getInt("p_price"));
				product.setFileName(rs.getString("p_img"));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 상품 상세정보 가져오기
	public Product getProductOne(String name) {
		Product productOne = new Product();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM product WHERE p_name = ?");
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				productOne.setName(name);
				productOne.setCategory(rs.getString("p_category"));
				productOne.setManu(rs.getString("p_manu"));
				productOne.setSeller(rs.getString("p_seller"));
				productOne.setProductPrice(rs.getInt("p_price"));
				productOne.setFileName(rs.getString("p_img"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productOne;
	}
	
	public void addProduct(Product product) {
		try {
			pstmt = conn.prepareStatement("INSERT INTO product VALUES(?,?,?,?,?,?)");
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getCategory());
			pstmt.setString(3, product.getManu());
			pstmt.setString(4, product.getSeller());
			pstmt.setInt(5, product.getProductPrice());
			pstmt.setString(6, product.getFileName());
			System.out.println("pstmt.setString(6,product.getFileName) : " + product.getFileName());
			pstmt.executeUpdate();
			
			System.out.println("등록 성공");
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
	}
	
	
	public static void main(String[] args) throws ClassNotFoundException {
		new ProductDao();

	}

}
