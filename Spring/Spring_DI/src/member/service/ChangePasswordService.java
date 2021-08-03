package member.service;

import member.dao.Dao;
import member.domain.Member;

public class ChangePasswordService {
	
	private Dao dao;
	
	// setter 필요 - 프로퍼티 방식
	public void setDao(Dao dao) {
		this.dao = dao;
	}
	
	// 기본생성자 필요 - 프로퍼티 방식
	public ChangePasswordService() {
		System.out.println("ChangePasswordService 인스턴스 생성");
	}
	
	// 생성자 방식
	public ChangePasswordService(Dao dao) {
		this.dao = dao;
		System.out.println("ChangePasswordService 인스턴스 생성");
	}
	
	public void changePassword(String email, String oldPw, String newPw) throws Exception {
		
		System.out.println("change : " + email);
		
		Member member = dao.selectByEmail(email);
		
		if(member == null) {
			throw new Exception("존재하지않는 회원!");
		}
		
		member.changePassword(oldPw, newPw);
			
		dao.update(member);
	}
}