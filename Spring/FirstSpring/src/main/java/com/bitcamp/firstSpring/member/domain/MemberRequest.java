package com.bitcamp.firstSpring.member.domain;

public class MemberRequest {
	
	private String memberid;
	private String password;
	private String membername;
	// private String photo;
	
	// 기본 생성자 필수
	public MemberRequest() {}

	// setter/getter 필요
	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	/*
	 * public String getPhoto() { return photo; }
	 * 
	 * public void setPhoto(String photo) { this.photo = photo; }
	 */

	/*
	 * @Override public String toString() { return "MemberRequest [memberid=" +
	 * memberid + ", password=" + password + ", membername=" + membername +
	 * ", photo=" + photo + "]"; }
	 */
}
