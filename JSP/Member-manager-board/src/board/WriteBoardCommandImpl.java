package board;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import domain.Board;
import domain.Member;
import service.Command;
import util.ConnectionProvider;
import util.JdbcUtil;

public class WriteBoardCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) {
		
		// .... 핵심처리
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board board = new Board();
		
		board.setId(id);
		board.setTitle(title);;
		board.setContent(content);
		
		Connection conn = null;
		BoardDao dao = null;
		int result = 0;
		dao = BoardDao.getInstance();
		
		try {
			conn = ConnectionProvider.getConnection();
			result = dao.writeMessage(conn, board);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		request.setAttribute("msgReg", result);
		
		return "/WEB-INF/views/msgReg_view.jsp";
	}
}