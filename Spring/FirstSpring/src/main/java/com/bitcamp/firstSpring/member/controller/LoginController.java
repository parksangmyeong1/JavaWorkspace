package com.bitcamp.firstSpring.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.firstSpring.member.domain.LoginInfo;
import com.bitcamp.firstSpring.member.domain.LoginRequest;

@Controller
@RequestMapping("/member/login")	// 기본 경로 설정해서 밑에서 value 생략 가능
public class LoginController {
	
	// @RequestMapping("/member/loginForm") => 브라우저에서 사용하는 url랑 매칭, contextPath뒤로오는 경로
	// @RequestMapping(value="/member/login", method = RequestMethod.GET)
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginForm(
			@RequestParam(value="page", defaultValue = "1") 
			String page) {
		
		// System.out.println(page+1);
		System.out.println(page);
		// /WEB-INF/views/member/loginForm.jsp
		return "member/loginForm";
	}
	
	// @RequestMapping(value="/member/login", method = RequestMethod.POST)
	@RequestMapping(method = RequestMethod.POST)
	public String login(
			
			@RequestParam("id") String id, 
			@RequestParam("pw") String pw,
			HttpServletRequest request,
			// LoginRequest loginRequest,	// 빈즈 객체
			@ModelAttribute("loginReq") LoginRequest loginRequest,	// 이름바꿔줌
			Model model) {
		
		// view에 전달한 데이터 저장 : Model 객체를 이용
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		
		// System.out.println(id + pw);
		
		String uid = request.getParameter("id");
		String upw = request.getParameter("pw");
		
		System.out.println("id : " + uid + ", pw : " + upw);
		
		model.addAttribute("uid", uid);
		model.addAttribute("upw", upw);
		
		// System.out.println(loginRequest);	// 값이 자동으로 바인딩되서 들어온다. 모델에 저장됨.
		
		// 세션의 속성에 loginInfo 등록
		request.getSession(false).setAttribute("loginInfo", new LoginInfo());
		
		
		return "member/login";	// /WEB-INF/views/member/login.jsp
	}
}
