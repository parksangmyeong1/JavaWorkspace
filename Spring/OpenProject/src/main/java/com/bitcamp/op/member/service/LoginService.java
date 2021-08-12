package com.bitcamp.op.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.op.member.dao.JdbcTemplateMemberDao;
import com.bitcamp.op.member.dao.mybatisMemberDao;
import com.bitcamp.op.member.domain.Member;

@Service
public class LoginService {

//	@Autowired
//	MemberDao dao;
	
//	@Autowired
//	private JdbcTemplateMemberDao dao;
	
	@Autowired
	private mybatisMemberDao dao;
	
	public boolean login(String id, String pw, String reid, 
			HttpSession session, HttpServletResponse response) {
		
		boolean loginChk = false;
		
		// Connection conn = null; Template 사용으로 connection 필요없어짐
		
		Member member = dao.selectByIdPw(id, pw);
		
		System.out.println(member);
		
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