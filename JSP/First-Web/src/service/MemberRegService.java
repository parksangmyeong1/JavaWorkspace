package service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ncs.member.Member;
import ncs.member.MemberDao;
import ncs.member.util.ConnectionProvider;

public class MemberRegService {
	
	private MemberRegService() {}
	private static MemberRegService service = new MemberRegService();
	public static MemberRegService getInstance() {
		return service;
	}
	
	public int regMember(HttpServletRequest request) throws FileUploadException {
		
		int resultCnt = 0;
		
		Member member = new Member();
		Connection conn = null;
		MemberDao dao = null;
		
		
		try {
			// 1. multipart 여부 확인
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			if(isMultipart){
				// 2. 파일을 저장할 Factory 객체 생성
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				// 3. 요청 처리(form 안에 있는 input 들을 분리)를 위해서
				// ServletFileUpload 생성
				ServletFileUpload upload = new ServletFileUpload(factory);
				
				// 4. 사용자 요청을 파싱(분리 : 원하는 형태로 분리 input => FileItem)
				// FileItem -> input 데이터를 저장하고 있는 객체
				List<FileItem> items = upload.parseRequest(request);
				
				Iterator<FileItem> itr = items.iterator();
				
				while(itr.hasNext()){
					FileItem item = itr.next();	// text,checkbox,hidden,password,file 등등
					
					// file과 file 이외의 폼을 구분
					if(item.isFormField()){
						// 회원의 아이디, 회원 이름, 비밀번호
						String paramName = item.getFieldName();
						if(paramName.equals("id")) {
							// String value = item.getString("utf-8");
							member.setId(item.getString("utf-8"));
						} else if(paramName.equals("pw")) {
							member.setPw(item.getString("utf-8"));
						} else if(paramName.equals("name")) {
							member.setName(item.getString("utf-8"));
						}
						
					} else{
						String uploadUri = "upload";
						String dir = request.getSession().getServletContext().getContextPath();
						
						File saveDir = new File(dir);
						
						if(!saveDir.exists()) {
							saveDir.mkdir();
						}
						
						String paramName = item.getFieldName();
						if(paramName.equals("photo")) {
							// 파일 이름, 사이즈 
							if(item.getName() != null && item.getSize() > 0) {
								// 저장
								item.write(new File(saveDir, item.getName()));
								// DB에 저장할 파일의 이름
								member.setPhoto(item.getName());
							}
						}
						
					}
					
				}
			} else {
				throw new Exception("multipart 타입이 아닙니다!");
			}
			/////////////////////////////////////
			// DB insert
			// Connection, MemberDao
			
			conn = ConnectionProvider.getConnection();
			dao = MemberDao.getInstance();
			
			resultCnt = dao.insertMember(conn, member);
			
		} catch(SQLException e) {
			e.printStackTrace();
			// 파일은 저장되지만, db 예외 발생할 경우 저당된 파일 지워줘야 한다.
			
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
}
