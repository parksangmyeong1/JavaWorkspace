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

public class MemberEditFormCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String idx = request.getParameter("idx");

		Connection conn = null;
		try{
			conn = ConnectionProvider.getConnection();
			MemberDao dao = MemberDao.getInstance();
			
			request.setAttribute("member", dao.selectByIdx(conn, Integer.parseInt(idx)));
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtil.close(conn);
		}
		return "/WEB-INF/views/editForm.jsp";
	}
}