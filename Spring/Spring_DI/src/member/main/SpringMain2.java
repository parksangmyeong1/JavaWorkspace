package member.main;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import member.dao.Dao;
import member.domain.RegRequest;
import member.service.ChangePasswordService;
import member.service.MemberRegService;

public class SpringMain2 {
	
	static ApplicationContext ctx;

	public static void main(String[] args) {
		
		//ctx = new GenericXmlApplicationContext("classpath:appCtx1.xml");
		// ctx = new GenericXmlApplicationContext("classpath:appCtx2.xml");
		ctx = new GenericXmlApplicationContext("classpath:appCtx4.xml");
		
		// MemberRegService 객체를 컨테이너로부터 받아온다.
		Dao dao1 = ctx.getBean("memberDao", Dao.class);
		Dao dao2 = ctx.getBean("memberDao", Dao.class);
		
		// 싱글톤이라서 같은 결과가 나온다
		System.out.println(dao1==dao2);
		
		MemberRegService regService1 = ctx.getBean("regService", MemberRegService.class);
		MemberRegService regService2 = ctx.getBean("regService", MemberRegService.class);
		
		// prototype : 다른 결과가 나온다.
		// 싱글톤은 처음에 만들어지고, prototype은 요청할 때 만들어진다.
		System.out.println(regService1==regService2);
		
		ChangePasswordService pwService1 = ctx.getBean("changePwService", ChangePasswordService.class);
		ChangePasswordService pwService2 = ctx.getBean("changePwService", ChangePasswordService.class);
		
		// 싱글톤이라서 결과는 같음
		System.out.println(pwService1==pwService2);
	}
}