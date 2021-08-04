package com.bitcamp.firstSpring.member.domain;

public class LoginRequest {
	
	private String id;
	private String pw;
	
	// 기본 생성자 필수
	public LoginRequest() {}
	
	// setter/getter 필요
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}

	@Override
	public String toString() {
		return "LoginRequest [id=" + id + ", pw=" + pw + "]";
	}
	
}
