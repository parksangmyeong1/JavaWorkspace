package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;

import dao.MemberDao;
import util.ConnectionProvider;
import util.JdbcUtil;

public class MemberRegCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		try {
			request.setAttribute("resultReg", MemberRegService.getInstance().regMember(request));
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		return "/WEB-INF/views/reg_view.jsp";
	}
}