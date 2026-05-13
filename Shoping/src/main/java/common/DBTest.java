package common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBTest {
	
	public static void main(String[] args) {
		
	String url="jdbc:mysql://localhost:3306/shop_db?serverTimezone=UTC";
	String user="root";
	String password="as1012530*";
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn= DriverManager.getConnection(url,user,password);
					
					 if(conn!=null){
						 System.out.println("succes");
						 }
		}catch(Exception e) {
						System.out.println("fail... " + e.getMessage()); e.printStackTrace();
					}
					
		}
}