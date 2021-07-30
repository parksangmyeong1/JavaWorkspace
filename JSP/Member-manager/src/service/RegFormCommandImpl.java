package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegFormCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		return "/WEB-INF/views/regForm.jsp";
	}
}