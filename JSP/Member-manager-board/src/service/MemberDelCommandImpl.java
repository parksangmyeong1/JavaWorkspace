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

public class MemberDelCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String idx = request.getParameter("idx");
		
		int resultCnt = 0;
		Connection conn = null;
		
		try{
		conn = ConnectionProvider.getConnection();
		MemberDao dao = MemberDao.getInstance();
		
		resultCnt = dao.deleteMember(conn, Integer.parseInt(idx));
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtil.close(conn);
		}
		
		request.setAttribute("resultDel", resultCnt);
		
		return "/WEB-INF/views/delete.jsp";
	}
}