package guest.jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class JdbcDriverLoad extends HttpServlet{

	@Override
	// 설정된 파라미터 값을 가져오기 위한 용도 ServletConfig
	public void init(ServletConfig config) throws ServletException {
		
		String jdbcDriver = config.getInitParameter("jdbcdriver");
		
		try {
			jdbcDriver = jdbcDriver == null ? "com.mysql.cj.jdbc.Driver" : jdbcDriver;
			Class.forName(jdbcDriver);
			System.out.println("mysql Driver load.... !!!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
