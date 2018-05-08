package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBClose {
	public static void close(Connection con, PreparedStatement pstmt) {
	
       try {
    	   
		if(pstmt!=null)pstmt.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
       
       try {
		if(con!=null)con.close();
	} catch (SQLException e) {
		e.printStackTrace();
		// TODO Auto-generated
	}
	}
 


	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
	    try {
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO Auto-generated
		}
		
	}
}