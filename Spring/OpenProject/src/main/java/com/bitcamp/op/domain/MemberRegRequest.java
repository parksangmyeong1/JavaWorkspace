package com.bitcamp.op.domain;

import org.springframework.web.multipart.MultipartFile;

public class MemberRegRequest {

	// 사용자의 입력을 저장하는 용도의 클래스
	// regForm의 name과 일치시켜야 알아서 저장해준다.
	// 알아서 넣어주기 때문에 생성자 필요가 없다.
	private String memberid;
	private String password;
	private String membername;
	private MultipartFile photo;
	
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
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	
	// 데이터가 잘들어왔는지 확인하는 용도
	// getOriginalFilename 쓰는 이유는 데이터 확인용으로 파일 이름을 보기 위해서
	@Override
	public String toString() {
		return "MemberRegRequest [memberid=" + memberid + ", password=" + password + ", membername=" + membername
				+ ", photo=" + photo.getOriginalFilename() + "]";
	}
	
	// MemberRegRequest -> Member 
	// 사용자에게 받는 건 MemberRegRequest지만 DB저장은 Member라서 바꿔줘야한다.
	public Member toMember() {
		return new Member(0, memberid, password, membername, 
				photo.getOriginalFilename(), null);
	}
}
