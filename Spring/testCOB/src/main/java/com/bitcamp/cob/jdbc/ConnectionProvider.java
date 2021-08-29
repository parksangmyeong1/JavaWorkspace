package com.bitcamp.cob.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	public static Connection getConnection() throws SQLException {

		String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
		String user = "krap";
		String pw = "krap";

		return DriverManager.getConnection(jdbcUrl, user, pw);
	}
}
