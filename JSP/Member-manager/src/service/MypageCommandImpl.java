package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {

		if(request.getSession().getAttribute("loginInfo") == null) {
			return "/WEB-INF/views/pleaseLogin.jsp";
		}else {
			return "/WEB-INF/views/mypage.jsp";
		}
	}
}