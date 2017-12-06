package dao;

import java.util.HashMap;
import java.util.List;

import model.FoodDataBean;
import model.Mart_orderDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisAdminDBBean extends MybatisConnector {
	private final String namespace = "admin.mybatis";
	private static MybatisAdminDBBean instance = new MybatisAdminDBBean();

	public static MybatisAdminDBBean getInstance() {
		return instance;
	}

	SqlSession sqlSession;

	public List getOrderList() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".getMart_orders");
		} finally {
			sqlSession.close();
		}
	}

	public List getPayList() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".getFood_payments");
		} finally {
			sqlSession.close();
		}
	}
	public void change(int mart_order_id, String status) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("mart_order_id", mart_order_id);
		//map.put("status", status);
		String new_status = "";
		if (status.equals("order"))
			new_status = "ready";
		else if (status.equals("ready"))
			new_status = "ing";
		else if (status.equals("ing"))
			new_status = "end";
		else
			return;
		map.put("new_status", new_status);
		try {
			sqlSession.update(namespace + ".statuschange",map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	public void change2(int payment_id, String status) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("payment_id", payment_id);
		//map.put("status", status);
		String new_status = "";
		if (status.equals("pay"))
			new_status = "ready";
		else if (status.equals("ready"))
			new_status = "ing";
		else if (status.equals("ing"))
			new_status = "end";
		else
			return;
		map.put("new_status", new_status);
		try {
			sqlSession.update(namespace + ".paychange",map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public void insertFood(FoodDataBean foodDataBean) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("foodDataBean", foodDataBean);
		try{
			int food_id = sqlSession.selectOne(namespace+".getFood_id");
			food_id++;
			map.put("food_id", food_id);
			int result = sqlSession.insert(namespace + ".insertFood",map);
			System.out.println("insert Ok:"+result);
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public List foodlist(String foods) {
		List<FoodDataBean> food = null;
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("foods", foods);
		try {
			if(foods != null)
					food= sqlSession.selectList(namespace + ".foodlist", map);
			else
				food= sqlSession.selectList(namespace + ".foodlistnull");
		} finally {
			sqlSession.close();
			return food;
		}
	}



	public void updateFood(FoodDataBean food) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("food", food);
		try{
			
			int result = sqlSession.update(namespace + ".updateFood",map);
			System.out.println("update :"+result);
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public List allfoodlist() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".allfoodlist");
		} finally {
			sqlSession.close();
		}
	}
}
