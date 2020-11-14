package com.murari.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	private static Connection con;
	public static Connection getConnection() {
		try {
			if (con==null) {
				//load jdbc driver
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//create connection
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "98Murari");
				
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
