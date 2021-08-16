package com.bitcamp.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.mm.jdbc.JdbcUtil;
import com.bitcamp.mm.member.domain.Member;
import com.bitcamp.mm.member.domain.SearchIdPw;

@Repository
public class mybatisMemberDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private final String NAME_SPACE = "com.bitcamp.op.member.dao.memberMapper";
	
	public int insertMember(Member member) throws SQLException {

		
		return template.update(NAME_SPACE+".insertMember", member);
	}
	
	// 자동 증가한 컬럼의 값을 필요로 할때
	public int insertMember1(final Member member) throws SQLException {

		int resultCnt = 0;
		
//		// 자동 증가한 컬럼의 값을 저장할 객체
//		KeyHolder holder = new GeneratedKeyHolder();
//		
//		resultCnt = template.update(
//				// 별도의 클래스를 만들어도 가능
//				new PreparedStatementCreator() {
//					
//					// 익명 클래스
//					@Override
//					public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
//						
//						String sql2 = "insert into member (memberid,password,membername, memberphoto) values (?, ?, ?, ?)";
//						PreparedStatement pstmt = conn.prepareStatement(sql2, new String[] {"idx"});
//						pstmt.setString(1, member.getMemberid());
//						pstmt.setString(2, member.getPassword());
//						pstmt.setString(3, member.getMembername());
//						pstmt.setString(4, member.getMemberphoto());
//						
//						return pstmt;
//					}
//				}, holder);
//		
//		Number idx = holder.getKey();
//		member.setIdx(idx.intValue());
		
		return resultCnt;
	}

//	public List<Member> selectList(Connection conn) {
//
//		List<Member> list = null;
//
//		try {
//			stmt = conn.createStatement();
//
//			String sql = "select * from member";
//
//			rs = stmt.executeQuery(sql);
//
//			list = new ArrayList<Member>();
//
//			while (rs.next()) {
//				list.add(new Member(
//						rs.getInt(1), 
//						rs.getString(2), 
//						rs.getString(3), 
//						rs.getString(4),
//						rs.getString(5),
//						rs.getTimestamp(6)));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			JdbcUtil.close(rs);
//			JdbcUtil.close(stmt);
//		}
//		return list;
//	}
	
	public Member selectByIdPw(String id, String pw) {

		// Member member = template.selectOne(NAME_SPACE+".selectByIdPw", new SearchIdPw(id, pw));
		
		return template.selectOne(NAME_SPACE+".selectByIdPw", new SearchIdPw(id, pw));
	}

	// ID 중복여부 확인을 위한 id 값으로 검색 -> 개수 반환
	public int selectById(String memberId) throws SQLException {
		
		return template.selectOne(NAME_SPACE+".selectById", memberId);
	}

	public int deleteMember(Connection conn, int idx) {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "delete from member where idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}

	public Member selectByIdx(Connection conn, int idx) {
		
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sqlSelect = "select * from member where idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sqlSelect);
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				member = new Member();
				member.setIdx(rs.getInt("idx"));
				member.setMemberid(rs.getString("memberid"));
				member.setPassword(rs.getString("password"));
				member.setMembername(rs.getString("membername"));
				member.setRegdate(rs.getTimestamp("regdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
		}
		return member;
	}

	public int updateMember(Connection conn, Member member) {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "update member set memberid=?,password=?,membername=? where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberid());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMembername());
			pstmt.setInt(4, member.getIdx());
			
			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}
	
}