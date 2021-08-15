package com.bitcamp.op.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.op.jdbc.ConnectionProvider;
import com.bitcamp.op.member.dao.Dao;
import com.bitcamp.op.member.dao.JdbcTemplateMemberDao;
import com.bitcamp.op.member.dao.MemberDao;
import com.bitcamp.op.member.dao.mybatisMemberDao;

@Service
public class IdCheckService {
	
//	@Autowired
//	MemberDao dao;
	
//	@Autowired
//	private JdbcTemplateMemberDao dao;

//	@Autowired
//	private mybatisMemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	Dao dao;
	
	public String idCheck(String id) {
		
		// 기본적으로 Y세팅
		String result = "Y";
		// Connection conn = null;	Template 사용으로 connection 필요없어짐
		
		dao = template.getMapper(Dao.class);
		
		// conn = ConnectionProvider.getConnection();

		// DB확인 후 아이디가 있으면 N으로 바꿔줌.
		if(dao.selectById(id)>0) {
			result="N";
		}
		
		return result;
	}
}