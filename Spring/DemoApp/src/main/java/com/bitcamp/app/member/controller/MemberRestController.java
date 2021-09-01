package com.bitcamp.app.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.app.member.domain.Member;
import com.bitcamp.app.member.service.MemberRestService;

// @Controller
@RestController
public class MemberRestController {

	@Autowired
	private MemberRestService service;
	
	@RequestMapping("/members/{id}")
	// @ResponseBody
	public Member getMember(
			@PathVariable("id") int idx) {
		
		Member member = service.getMember(idx);
		System.out.println(member);
		
		return member;
	}
	
	/*
	 * @DeleteMapping
	 * 
	 * @PutMapping
	 * 
	 * @PostMapping
	 */
	@GetMapping("/members")
	@CrossOrigin	// 어디에서 요청이 들어오든 통신 가능
	public List<Member> getMembers(){
		return service.getMembers();
	}
	
	@GetMapping("/members1")
	@CrossOrigin
	public Map<Integer, Member> getMembers1(){
		
		return service.getMembers1();
	}
	
}
