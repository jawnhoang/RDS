import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectRds {

	private static String PUBILC_END_POINT = "#########";//censored due to privacy- endpoint is aws
	private static String PORT = "3306";
	private static String DB_NAME = "lab4_rds";
	private static String USER_NAME = "#######"; //censored due to privacy
	private static String PASSWORD = "######";//censored due to privacy

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
