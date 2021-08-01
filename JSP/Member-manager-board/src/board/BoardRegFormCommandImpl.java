package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Command;

public class BoardRegFormCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) {
		
		// .... 핵심처리
		return "/WEB-INF/views/boardRegForm.jsp";
	}
}