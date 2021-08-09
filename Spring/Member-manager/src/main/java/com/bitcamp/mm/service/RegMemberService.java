package com.bitcamp.mm.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.mm.dao.MemberDao;
import com.bitcamp.mm.domain.Member;
import com.bitcamp.mm.domain.RegFormCommand;
import com.bitcamp.mm.jdbc.ConnectionProvider;

@Service
public class RegMemberService {
	
	@Autowired
	MemberDao dao;
	
	final String UPLOAD_URI = "/uploadfile";

	public int regMember(RegFormCommand regFormCommand,HttpServletRequest request) {
		
		int resultCnt = 0;
		Member member = new Member();
		Connection conn = null;
		File newFile = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			System.out.println(regFormCommand);
			
			member.setMemberid(regFormCommand.getMemberid());
			member.setPassword(regFormCommand.getPassword());
			member.setMembername(regFormCommand.getMembername());

			if(regFormCommand.getMemberphoto()!=null) {
				member.setMemberphoto(regFormCommand.getMemberphoto().getOriginalFilename());
				saveFile(request, regFormCommand.getMemberphoto());
			}
			
			resultCnt = dao.insertMember(conn, member);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			if (newFile !=null && newFile.exists()) {
				//파일을삭제
				newFile.delete();
				System.out.println("파일삭제!!");
			}
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 		
		request.setAttribute("result", resultCnt);
					
		return resultCnt;
	}	
	
	// 사용자가 업로드한 파일을 저장하는 메소드
	private void saveFile(HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {

		// 저장 경로 : 시스템 경로
		String saveDir = request.getSession().getServletContext().getRealPath(UPLOAD_URI);

		// 새롭게 저장할 파일을 정의
		File newFile = new File(saveDir, file.getOriginalFilename());

		// 파일 저장
		file.transferTo(newFile);
	}
}
