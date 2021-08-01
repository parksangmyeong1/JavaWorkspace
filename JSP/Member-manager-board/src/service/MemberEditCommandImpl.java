package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;

import dao.MemberDao;
import domain.Member;
import util.ConnectionProvider;
import util.JdbcUtil;

public class MemberEditCommandImpl implements Command {

	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Member member = (Member) request.getSession().getAttribute("member");
		
		member.setMemberid(request.getParameter("id"));
		member.setPassword(request.getParameter("pw"));
		member.setMembername(request.getParameter("name"));
		
		int resultCnt = 0;
		
		Connection conn = null;
		MemberDao dao = MemberDao.getInstance();
		
		try{
			conn = ConnectionProvider.getConnection();
			
			resultCnt = dao.updateMember(conn, member);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtil.close(conn);
		}
		request.setAttribute("resultEdit", resultCnt);

		return "/WEB-INF/views/edit.jsp";
	}
}