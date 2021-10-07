import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectRds {

	private static String PUBILC_END_POINT = "hoang-rds-172.cfguj5gy1ncn.us-west-1.rds.amazonaws.com";
	private static String PORT = "3306";
	private static String DB_NAME = "lab4_rds";
	private static String USER_NAME = "Hoang014411072";
	private static String PASSWORD = "Khoa.rds123";

	public static void main(String[] args) {
		ConnectRds.connect();
	}

	public static void connect() {

		try {
//			Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://" + PUBILC_END_POINT + ":" + PORT + "/" + DB_NAME, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("select * from product");

			while (result.next()) {
				System.out.print(result.getString("name")  + " ");
				System.out.print(result.getString("product_cd")  + " ");
				System.out.print(result.getString("product_type_cd")  + " ");
				System.out.println();
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return;
	}

}
