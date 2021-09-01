package com.bitcamp.app.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.app.member.mapper.MemberMapper;


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
	
	MemberMapper dao;
	
	public String idCheck(String id) {
		
		// 기본적으로 Y세팅
		String result = "Y";
		// Connection conn = null;	Template 사용으로 connection 필요없어짐
		
		dao = template.getMapper(MemberMapper.class);
		
		// conn = ConnectionProvider.getConnection();

		// DB확인 후 아이디가 있으면 N으로 바꿔줌.
		if(dao.selectById(id)>0) {
			result="N";
		}
		
		return result;
	}
}