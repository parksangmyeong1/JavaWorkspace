package com.bitcamp.mm.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.dao.MemberDao;
import com.bitcamp.mm.domain.Member;
import com.bitcamp.mm.jdbc.ConnectionProvider;

@Service
public class LoginService {
	
	@Autowired
	MemberDao dao;

	public void loginMember(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		boolean loginChk = false;
		
		String memberId = request.getParameter("memberid");
		String password = request.getParameter("password");
		String reId = request.getParameter("reid");
		
		Connection conn = null;
		
		if(memberId!=null && password!=null && memberId.trim().length()>2 && password.trim().length()>3){
			
			try{
				conn = ConnectionProvider.getConnection();	
				Member member = dao.selectByIdPw(conn, memberId, password);
				
				if(member != null){
					// 회원의 정보, 간략한 정보를 Session 객체에 저장 
					request.getSession().setAttribute("member", member);
					request.getSession().setAttribute("loginInfo", member.toLoginInfo());
					loginChk = true;
				}
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		
		// ID 저장을 위한 쿠키 설정
		// reid 값의 유무 체크
		if (memberId != null && password != null && memberId.trim().length() > 2 && password.trim().length() > 2) {
			try {
				conn = ConnectionProvider.getConnection();
				
				Member member = dao.selectByIdPw(conn, memberId, password);
				
				if (member != null) {
					session.setAttribute("loginInfo", member.toLoginInfo());
					loginChk = true;
				}
				
				if (reId != null && reId.equals("on")) {
					Cookie cookie = new Cookie("reId", URLEncoder.encode(memberId, "utf-8"));
					cookie.setMaxAge(60*60*24*365);
					response.addCookie(cookie);
				} else {
					Cookie cookie = new Cookie("reId", URLEncoder.encode(memberId, "utf-8"));
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} 
			
			session.setAttribute("loginChk", loginChk);
		}
	}
}