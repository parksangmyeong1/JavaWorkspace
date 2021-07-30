package dao;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import dept.dao.DeptDao;
import dept.domain.Dept;
import ncs.member.util.ConnectionProvider;

public class DaoTest {

	// DeptDao와 connection을 생성.
	DeptDao dao;
	Connection conn = null;
	
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println("@BeforeClass");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		System.out.println("@AfterClass");
	}

	@Before
	public void setUp() throws Exception {
		System.out.println("@Before");
		
		// 각 테스트 시작전에 dao,conn 연결
		dao = DeptDao.getInstance();
		conn = ConnectionProvider.getConnection();
	}

	@After
	public void tearDown() throws Exception {
		System.out.println("@After");
	}

	@Test
	public void testGetDeptList() {
		// 리스트 반환된건지 확인
		assertNotNull("리스트 값이 있는지 확인", dao.getDeptList(conn));
		// 리스트 출력
		List<Dept> list = dao.getDeptList(conn);
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
	}
	
	@Test
	public void testInsertDao() {
		// 반환되는 resultCnt가 1이면 테스트 성공
		assertSame("dept가 입력되지 않은 경우", 1, dao.insertDept(conn, new Dept(50, "개발", "제주도")));
	}
	
	@Test
	public void testUpdateDao() {
		// 해당 deptno에 리스트가 반환되는지 확인
		// assertNotNull("dept가 반환되지 않은 경우", dao.selectByDeptno(conn, 50));
		// 수정한 내용이 업데이트 되면 1
		assertSame("dept가 수정되지 않은 경우", 1, dao.updateDept(conn, new Dept(50, "개발팀", "서울")));
	}
	
	@Test
	public void testDeleteDao() {
		// 삭제가 되면 1 
		assertSame("dept가 삭제되지 않은 경우", 1, dao.deleteDept(conn, 50));
	}

}
