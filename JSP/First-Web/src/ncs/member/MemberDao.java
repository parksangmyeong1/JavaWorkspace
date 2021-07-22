package ncs.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import jdbc.util.jdbcUtil;
import ncs.member.util.UtilClose;

public class MemberDao {
	private MemberDao() {}
	
	private static MemberDao dao = new MemberDao();
	
	public static MemberDao getInstance() {
		return dao==null?new MemberDao():dao;
	}
	
	public ArrayList<Member> getMemberList(Connection conn){
		
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList<Member> memberList = null;
		
		try {
			
			stmt = conn.createStatement();
			
			String sqlSelect = "select * from member";
			
			rs = stmt.executeQuery(sqlSelect);
			
			memberList = new ArrayList<Member>();
			
			while(rs.next()){
				memberList.add(new Member(rs.getInt("idx"),
				rs.getString("id"),
				rs.getString("pw"),
				rs.getString("name"),
				rs.getString("date")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			UtilClose.close(rs);
			UtilClose.close(stmt);
		}
		
		return memberList;
	}
	
	public int insertMember(Connection conn, Member member) {
		int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sqlInsert = "insert into member(id,pw,name) values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			
			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		
		
		return resultCnt;
	}
	
	public int deleteMember(Connection conn, int idx) {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sqlDelete = "delete from member where idx = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sqlDelete);
			pstmt.setInt(1, idx);
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			UtilClose.close(pstmt);
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
				member = makeMember(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			UtilClose.close(rs);
		}
		return member;
	}
	
	public int updateMember(Connection conn, Member member) {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sqlUpdate = "update member set id=?,pw=?,name=?,date=? where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getDate());
			pstmt.setInt(5, member.getIdx());
			
			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			UtilClose.close(pstmt);
		}
		return resultCnt;
	}
	
	private Member makeMember(ResultSet rs) {
		
		Member member = null;
		
			try {
				member.setIdx(rs.getInt("idx"));
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setDate(rs.getString("date"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return member;
	}
}
