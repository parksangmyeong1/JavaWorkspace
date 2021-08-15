package com.bitcamp.mm.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.dao.Dao;
import com.bitcamp.mm.domain.Member;

@Service
public class LoginService {

//	@Autowired
//	MemberDao dao;
	
//	@Autowired
//	private JdbcTemplateMemberDao dao;
	
//	@Autowired
//	private mybatisMemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private Dao dao;
	
	public boolean login(String id, String pw, String reid, 
			HttpSession session, HttpServletResponse response) {
		
		boolean loginChk = false;
		
		// Connection conn = null; Template 사용으로 connection 필요없어짐
		
		// 인터페이스 Dao의 구현체 Mapper
		dao = template.getMapper(Dao.class);
		
		System.out.println("인터페이스 매퍼 dao 생성");
		
		Member member = dao.selectByIdPw(id, pw);
		
		if(member != null) {
			// 로그인 처리
			session.setAttribute("loginInfo", member.toLoginInfo());
			
			loginChk = true;
		}
		
		// 아이디 저장을 위한 Cookie 설정
		if(reid != null && reid.length() > 0) {
			Cookie cookie = new Cookie("reid", id);
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*365);	// 1년
			
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("reid", id);
			cookie.setPath("/");
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
		
		return loginChk;
	}
}