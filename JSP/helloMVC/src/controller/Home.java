package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home")

public class Home extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// action 문자열 -> 사용자가 누른 값(login or help)
		String action = req.getParameter("action");
		String page = null;
		
		// 조건문에 맞는 결과로 page 문자열 대입
		if(action.equals("login")) {
			page = "/view/loginform.jsp";
		}
		else if(action.equals("help")){
			page = "/view/help.jsp";
		}
		
		else {
			page = "/view/error.jsp";
		}
		
		// 요청된 페이지의 값을 dispatcher에 저장
		RequestDispatcher dispatcher = req.getRequestDispatcher(page);
		// forward 시키면 해당 req에 대한 resp가 발생
		dispatcher.forward(req, resp);
		
	}
}
