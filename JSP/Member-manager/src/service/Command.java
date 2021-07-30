package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	// GreetingCommandImpl
	// 메소드가 추상메소드
	// public abstract
	String getPage(HttpServletRequest request, HttpServletResponse respone) throws IOException;
}