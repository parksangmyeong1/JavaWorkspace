package com.bitcamp.mm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.dao.Dao;
import com.bitcamp.mm.domain.Member;
import com.bitcamp.mm.domain.SearchType;

@Service
public class MemberListService {

	private Dao dao;

	@Autowired
	private SqlSessionTemplate template;

	public List<Member> getMemberList(){
		return template.getMapper(Dao.class).selectAll();
	}
	
	public List<Member> getMemberList(SearchType searchType){
		return template.getMapper(Dao.class).selectMember(searchType);
	}
}