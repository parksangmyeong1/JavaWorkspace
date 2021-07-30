package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class logoutCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.getSession().invalidate();
		
		return "/WEB-INF/views/logout.jsp";
	}
}