
package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author sadit
 */
public class DBConnect {
    
	// saditha database 1
	private static Connection conn;
	
	public static Connection getConn() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/warehouse_5","root","54321");

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

	
	
}