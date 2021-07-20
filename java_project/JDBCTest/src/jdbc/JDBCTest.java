package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTest {

	public static void main(String[] args) {

		// 연결 객체: 연결 정보를 가진다
		Connection conn = null;
		// sql을 실행할 메소드 제공 -> 2가지 메소드 있다
		Statement stmt = null;
		// executeQuery() 반환타입 -> select의 결과 (테이블)를 담는 객체
		ResultSet rs = null;
		// Statement -> PreparedStatment : 성능개선
		PreparedStatement pstmt = null;

		try {
			//1. 드라이버 로드
			// oracle
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// mysql
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("드라이버 로드 성공!");


			//2. 연결
			// oracle
			//String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			
			// mysql
			String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
			
//			String user = "hr";
//			String pw = "tiger";
			
			String user = "bit";
			String pw = "bit";

			conn= DriverManager.getConnection(jdbcUrl, user, pw);
			System.out.println("데이터베이스 연결 성공!!");

			//3. sql처리
			stmt = conn.createStatement();
			
//			String sqlSelect = 
//					"select * from dept order by dname ";
			String sqlSelect = 
					"select * from dept";
			
			
		
			rs = stmt.executeQuery(sqlSelect); //반환값이 resultSet, 결과가 테이블
			
			// rs.next() -> 다음행의 존재 유무 확인, boolean
			while(rs.next()) {//행단위로 가져오기
				int deptno = rs.getInt("deptno"); // column label에 있는 값을 int 반환
				System.out.print(deptno+"\t");
				String dname = rs.getString("dname"); 
				System.out.print(dname +"\t");
				String loc = rs.getString("loc");
				System.out.println(loc + "\t");
			}
		
			//////////////////////////////////////////////////////////
			//PreparedStatement -> SQL 먼저 등록 -> 매개변수처럼 ?를 이용해서 나중에 변수를 바인딩
			
			System.out.println("PreparedStatement 사용");
			System.out.println("==========================================");
								
			String sqlSelect2 = "select * from dept where deptno = ? ";
			pstmt = conn.prepareStatement(sqlSelect2);
			//변수(?)에 데이터 바인딩
			pstmt.setInt(1, 10); //첫번째 ? = 10 deptno =?
			
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				int deptno = rs.getInt("deptno"); // column label에 있는 값을 int 반환
				System.out.print(deptno+"\t");
				String dname = rs.getString("dname"); 
				System.out.print(dname +"\t");
				String loc = rs.getString("loc");
				System.out.println(loc + "\t");
			}
		
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 클래스를 찾지못함!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 실패");
			e.printStackTrace();
		}finally {
			//4. close
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
				
					e.printStackTrace();
				}
			}
			
			
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}
}