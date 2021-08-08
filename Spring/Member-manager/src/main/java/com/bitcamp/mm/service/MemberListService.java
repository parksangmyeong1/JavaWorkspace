package com.bitcamp.mm.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.dao.MemberDao;
import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.jdbc.JdbcUtil;

@Service
public class MemberListService {

	@Autowired
	MemberDao dao;
	
	public void listMember(HttpServletRequest request) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			request.setAttribute("resultList", dao.selectList(conn));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
	}
}