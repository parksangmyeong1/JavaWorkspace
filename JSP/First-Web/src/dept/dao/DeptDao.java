package dept.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dept.domain.Dept;
import jdbc.util.jdbcUtil;

public class DeptDao {
	
	// 싱글톤 패턴
	// 1. 인스턴스 생성을 막는다!!!
	private DeptDao() {}
	// 2. 클래스 내부에서 인스턴스를 생성한다!!
	private static DeptDao dao = new DeptDao();
	// 3. 외부에서 반환 받을 수 있는 메소드
	public static DeptDao getInstance() {
		return dao==null?new DeptDao() : dao;
	}

	public List<Dept> getDeptList(Connection conn){
		
		Statement stmt = null;
		ResultSet rs = null;
		
		List<Dept> deptList = null;
		
		try {
			// 3. Statement
			stmt = conn.createStatement();

			String selectSql = "select * from dept";

			// 4. ResultSet
			rs = stmt.executeQuery(selectSql);
			
			// 5. List<Dept> <- 결과
			deptList = new ArrayList<Dept>();
			
			while(rs.next()){
				// List에 객체 추가
				deptList.add(makeDept(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
		}
		
		return deptList;
		
		
	}
	
	public int insertDept(Connection conn, Dept dept) {

		int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "insert into dept values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dept.getDeptno());
			pstmt.setString(2, dept.getDname());
			pstmt.setString(3, dept.getLoc());
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
		}

		return resultCnt;
	}
	
	public int deleteDept(Connection conn, int deptno) {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "delete from dept where deptno =?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		return resultCnt;
	}
	
	public Dept selectByDeptno(Connection conn, int deptno) {
		
		Dept dept = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from dept where deptno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dept = makeDept(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
			jdbcUtil.close(rs);
		}
		return dept;
	}
	
	public int updateDept(Connection conn, Dept dept) {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "update dept set dname=?,loc=? where deptno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept.getDname());
			pstmt.setString(2, dept.getLoc());
			pstmt.setInt(3, dept.getDeptno());
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
		}

		return resultCnt;
	}
	
	private Dept makeDept(ResultSet rs) {
		Dept dept = new Dept();
		try {
			dept.setDeptno(rs.getInt("deptno"));
			dept.setDname(rs.getString("dname"));
			dept.setLoc(rs.getString("loc"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dept;
	}
}
