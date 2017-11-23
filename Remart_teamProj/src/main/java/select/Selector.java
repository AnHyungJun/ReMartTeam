package select;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.FoodDataBean;

public class Selector {
	public List selectFoodDb(String str){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String jdbcUrl = "jdbc:oracle:thin:211.238.142.120:1521:orcl";
		String dbId = "scott";
		String dbPass = "1111";
		List<FoodDataBean> li = new ArrayList();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			String query = "select * from food where name like '%" + str + "%'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()){
				do{
					FoodDataBean food = new FoodDataBean();
					food.setFood_id(rs.getInt("food_id"));
					food.setName(rs.getString("name"));
					food.setPrice(rs.getInt("price"));
		
					li.add(food);
				}while(rs.next());
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			return li;
		}
	}
}
