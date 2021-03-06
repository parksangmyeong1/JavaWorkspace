package member.service;

import java.util.Date;

import member.dao.Dao;
import member.domain.Member;
import member.domain.RegRequest;

public class MemberRegService {
	
	//Dao dao = new MemberDao();
	private Dao dao; // 생성자 버전
	private int num; // 기본타입 버전
	
	// setter 필요 - 프로퍼티 방식
	public void setDao(Dao dao) {
		this.dao = dao;
	}
	
	// 기본생성자 필요 - 프로퍼티 방식
	public MemberRegService() {
		System.out.println("MemberRegService 인스턴스 생성");
	}
	
	// 생성자 방식
	public MemberRegService(Dao dao) {
		this.dao = dao;
		System.out.println("MemberRegService 인스턴스 생성");
	}
	
	public void regMember(RegRequest request) throws Exception {
		
		// 중복 이메일 체크
		Member member = dao.selectByEmail(request.getEmail());
		
		if(member != null) {
			throw new Exception("중복 이메일 !!");
		}
		
		Member newMember = new Member(
				0, 
				request.getEmail(), 
				request.getPassword(), 
				request.getName(), 
				new Date());
		
		dao.insert(newMember);
	}
}