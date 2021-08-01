package board;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.MemberDao;
import domain.Board;
import domain.Member;
import service.Command;
import util.ConnectionProvider;
import util.JdbcUtil;

public class BoardListCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) {
		
		//.... 핵심처리
		Connection conn = null;
		BoardDao dao = BoardDao.getInstance();

		try {
			// jdbcUrl
			conn = ConnectionProvider.getConnection();

			// 6. 결과 데이터 request 의 속성에 저장 -> 데이터 공유(전달)
			request.setAttribute("boardList", dao.selectList(conn));

		} catch (SQLException e){
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		} finally{
			JdbcUtil.close(conn);
		}

		return "/WEB-INF/views/boardList.jsp";
	}
}