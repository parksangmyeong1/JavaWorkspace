package com.bitcamp.mm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bitcamp.mm.domain.Board;
import com.bitcamp.mm.jdbc.JdbcUtil;

public class BoardDao {
	
	private BoardDao () {}
	private static BoardDao dao = new BoardDao();
	public static BoardDao getInstance() {
		return dao == null? new BoardDao() : dao;
	}
	
	public int writeMessage(Connection conn, Board board) throws SQLException {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "insert into board (id, title, content)" + 
				"values ( ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			resultCnt = pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return resultCnt;
	}

	public List<Board> selectList(Connection conn) {
		
		List<Board> list = null;

		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();

			String sql = "select * from board";

			rs = stmt.executeQuery(sql);

			list = new ArrayList<Board>();

			while (rs.next()) {
				list.add(new Board(
						rs.getInt(1), 
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4),
						rs.getInt(5),
						rs.getTimestamp(6)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		return list;
	}
	
}
