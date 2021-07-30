package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import util.ConnectionProvider;
import util.JdbcUtil;

public class memberRegCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// dept_list.jsp -> 요청을 받고 처리 -> 결과 데이터를 객체속성에 저장 -> view 지정

		// 1. 드라이버 로드
		
		// 2. DB 연결
		Connection conn = null;
		MemberDao dao = MemberDao.getInstance();
		
		try {
			// jdbcUrl 
			conn = ConnectionProvider.getConnection();
			
			// 6. 결과 데이터 request 의 속성에 저장 -> 데이터 공유(전달)
			request.setAttribute("result", dao.selectList(conn));
			
		} catch (SQLException e){
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		} finally{
			JdbcUtil.close(conn);
		}
		// <jsp:forward page="list_view.jsp" />
		return "/WEB-INF/views/list_view.jsp";
	}
}