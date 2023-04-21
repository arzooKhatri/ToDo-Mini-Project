package com.todo.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtils {

	private static String jdbcURL = "jdbc:sqlserver://localhost:1433;database=arzoo;encrypt=true;trustServerCertificate=true;";
	private static String jdbcUsername = "arzoo";
	private static String jdbcPassword = "arzoo1";

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				Throwable t = ex.getCause();
				while (t != null) {
					t = t.getCause();
				}
			}
		}
	}
}