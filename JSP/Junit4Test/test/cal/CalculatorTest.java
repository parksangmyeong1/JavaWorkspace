package cal;

import static org.junit.Assert.*;

import java.sql.SQLException;

import javax.management.RuntimeErrorException;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class CalculatorTest {
	
	// Calculator cal = new Calculator();
	Calculator cal;
	
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
		cal = new Calculator();
	}

	@After
	public void tearDown() throws Exception {
		System.out.println("@After");
	}

	@Test
	public void testAdd() {
		System.out.println("testAdd()");
		// Calculator cal = new Calculator();
		
		assertEquals("add() 메소드 테스트", 12, cal.add(10, 2));
		
		// System.out.println(cal.add(10, 2));
		// fail("Not yet implemented");
	}

	@Test
	public void testSubstract() {
		System.out.println("testSubstract()");
		assertEquals("substract()", 8, cal.substract(10, 2));
		// fail("Not yet implemented");
	}

	@Test
	public void testMultiply() {
		System.out.println("testMultiply()");
		assertEquals("substract()", 20, cal.multiply(10, 2));
		// fail("Not yet implemented");
	}

	@Test
	public void testDivide() {
		System.out.println("testDivide()");
		assertEquals("substract()", 5, cal.divide(10, 2));
		// fail("Not yet implemented");
	}
	
	// 예외 타입을 비교해서 테스트
	@Test(expected = SQLException.class)
	public void test1() throws SQLException {
		System.out.println("@Test 실행 중 예외타입 테스트");
		throw new SQLException();
	}
	
	// 처리시간 테스트
	@Test(timeout = 1)	// 100/1000 => 1/10초에 벗어나면 에러 처리(ms 단위)
	public void test2() {
		System.out.println("@Test 테스트 중 허용시간 ms 안에 실행이 완료되는지 테스트");
		cal.add(100, 200);
		cal.substract(10, 2);
	}
	
	@Test
	public void test3() {
		// fail("테스트 미실행");
		// assertTrue("메소드의 반환값이 boolean인 경우 사용", false);
		// assertNull("메소드의 실행 값이 null이 예상되는 경우", new Object());
		// assertNotNull("메소드의 실행 값이 null이 아닌 값이 예상되는 경우", null);
		// assertSame("같은 값일 경우", 1, 2);
		// assertNotSame("다른 값일 경우", 1, 1);
		assertTrue("메소드 반환 값이 True 예상할 때", false);
	}

}
