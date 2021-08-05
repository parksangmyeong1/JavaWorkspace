package com.bitcamp.firstSpring;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CookieController {

		// 쿠키를 생성해주는 요청 처리
		@RequestMapping("/cookie/make")
		public String makeCookie(HttpServletResponse response) {
			
			Cookie c = new Cookie("userName", "KING");
			response.addCookie(c);
			
			// Service.process(response)
			
			return "cookie/make";
		}
		
		// 쿠키정보를 보는 요청 처리
		@RequestMapping("cookie/view")
		public String viewCookie(
				
				// @CookieValue(value = "userNames", required = true) String userName, // 반드시 가져와야만 할때 require문
				@CookieValue(value = "userNames", defaultValue = "SCOTT") String userName, // 없다면 기본값 처리해야 할 때
				Model model
				
				) {
			
			model.addAttribute("userName", userName);
			System.out.println(userName);
			// ..Cookie 정보를 이용해서 데이터 처리
			
			return "cookie/view";
		}
}