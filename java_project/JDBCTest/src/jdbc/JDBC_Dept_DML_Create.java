package jdbc;
/*
 * CREATE : Insert 
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBC_Dept_DML_Create {

	public static void main(String[] args) {

		// 연결 객체: 연결 정보를 가진다
		Connection conn = null;
		// sql을 실행할 메소드 제공 -> 2가지 메소드 있다
		Statement stmt = null;
		// executeQuery() 반환타입 -> select의 결과 (테이블)를 담는 객체
		ResultSet rs = null;
		// Statement -> PreparedStatment : 성능개선
		PreparedStatement pstmt = null;

		
		Scanner sc = new Scanner(System.in);
		
		
		try {
			//1. 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로드 성공!");


			//2. 연결
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String pw = "tiger";

			conn= DriverManager.getConnection(jdbcUrl, user, pw);
			System.out.println("데이터베이스 연결 성공!!");
			
			//트렌젝션 설정
			// default는 자동커밋
			conn.setAutoCommit(false); // true는 자동커밋
			
			System.out.println("부서 정보 입력을 시작합니다.");
			System.out.println("부서 이름을 입력해주세요.");
			String dname = sc.nextLine();
			System.out.println("부서 위치를 입력해주세요.");
			String loc = sc.nextLine();
			
			//3. sql처리
			//사용자에게 정보를 받아 데이터를 입력
			String sql = "insert into dept01 values(dept01_deptno_seq.nextval, ?, ?)";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, dname); //사용자에게 받은 정보 넣기
		    pstmt.setString(2, loc);
		    
		    int result = pstmt. executeUpdate(); // 반영된 갯수 반환
		    // 반영 안되면 0개 행 반영되었습니다.  반영 되면 n개행 반영되었습니다
		    if(result > 0) {// 반영안됨
		    	System.out.println("입력되었습니다.");
		    }else {
		    	System.out.println("입력 실패!!");
		    }
			
		    //트렌젝션 완료(성공)
		    conn.commit();
		    
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 클래스를 찾지못함!");
			e.printStackTrace();
		} catch (SQLException e) {
			//System.out.println("데이터베이스 연결 실패");
			
			try {
				conn.rollback(); // 문제 생기면 처음로 돌아간 all or nothing
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
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