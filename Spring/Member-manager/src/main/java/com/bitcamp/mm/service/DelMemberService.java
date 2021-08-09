package com.bitcamp.mm.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.dao.MemberDao;
import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.jdbc.JdbcUtil;

@Service
public class DelMemberService {

	@Autowired
	MemberDao dao;

	public void getPage(HttpServletRequest request, String idx) throws IOException {
		
		int resultCnt = 0;
		Connection conn = null;
		
		try{
		conn = ConnectionProvider.getConnection();
		System.out.println("2" + idx);
		resultCnt = dao.deleteMember(conn, Integer.parseInt(idx));
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtil.close(conn);
		}
		
		request.setAttribute("resultDel", resultCnt);
	}
}
