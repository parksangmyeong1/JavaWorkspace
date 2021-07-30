package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdcheckCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) {

		//.... 핵심처리
		String memberId = request.getParameter("mid");
		request.setAttribute("resultIdCheck", IdCheckService.getInstance().idCheck(memberId));

		return "/WEB-INF/views/idcheck.jsp";
	}

}