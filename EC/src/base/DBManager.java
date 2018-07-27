package base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author d-yamaguchi
 *
 */
public class DBManager {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ec_db?useUnicode=true&characterEncoding=utf8", "root", "password");/* 各環境に合わせて変更してください*/
			System.out.println("DBConnected!!");
			return con;
		} catch (ClassNotFoundException e) {
			throw new IllegalMonitorStateException();
		} catch (SQLException e) {
			throw new IllegalMonitorStateException();
		}
	}
}
