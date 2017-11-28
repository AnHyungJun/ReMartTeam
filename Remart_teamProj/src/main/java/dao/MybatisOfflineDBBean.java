package dao;

import java.util.HashMap;
import java.util.List;

import model.Food_numDataBean;
import model.Mart_orderDataBean;
import model.Offline_martDataBean;
import model.ProductDataBean;
import model.R_memberDataBean;
import model.SaleDataBean;
import model.StaffDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisOfflineDBBean extends MybatisConnector{
	private final String namespace = "offline.mybatis";
	private static MybatisOfflineDBBean instance = new MybatisOfflineDBBean();

	public static MybatisOfflineDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;

	public int offlineLoginCheck(String id, String passwd) {
		System.out.println("offlineLoginCheck:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		int x = -1;
		try{
			String cuPasswd = sqlSession.selectOne(namespace + ".offlineLoginCheck",map);
			if(cuPasswd == null)
				x = -1; //해당아이디 없음
			else if(cuPasswd.equals(passwd))
				x = 1; //일치
			else
				x = 0; //비밀번호틀림
		}finally{
			sqlSession.close();
			return x;
		}

	}

	public int staffLoginCheck(String id, String passwd) {
		System.out.println("staffLoginCheck:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		int x = -1;
		try{
			String cuPasswd = sqlSession.selectOne(namespace + ".staffLoginCheck",map);
			if(cuPasswd == null)
				x = -1; //해당아이디 없음
			else if(cuPasswd.equals(passwd))
				x = 1; //일치
			else
				x = 0; //비밀번호틀림
		}finally{
			sqlSession.close();
			return x;
		}
	}

	public Offline_martDataBean getOfflineInfo(String id) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		Offline_martDataBean offline = new Offline_martDataBean();
		try{
			offline = (Offline_martDataBean)sqlSession.selectOne(namespace+".getOfflineInfo",map);
		}finally{
			sqlSession.close();
			return offline;
		}
	}

	public StaffDataBean getStaffInfo(String id) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		StaffDataBean staff = new StaffDataBean();
		try{
			staff = (StaffDataBean)sqlSession.selectOne(namespace+".getStaffInfo",map);
		}finally{
			sqlSession.close();
			return staff;
		}
	}
	public int getMart_order_num() {
		sqlSession = sqlSession();
		try{
			return sqlSession.selectOne(namespace+".getMart_order_num");
		}finally{
			sqlSession.close();

		}
	}

	public void insertMart_Order(Mart_orderDataBean mart_order) {
		System.out.println("insertMart_Order:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("mart_order", mart_order);
		try{
			int result = sqlSession.insert(namespace + ".insertMart_Order",map);
			System.out.println("insert Ok:"+result);
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void insertFood_num(Food_numDataBean food_num) {
		System.out.println("insertFood_num:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("food_num", food_num);
		try{
			int food_num_id = sqlSession.selectOne(namespace+".getFood_num_id");
			food_num_id++;
			map.put("food_num_id", food_num_id);
			int result = sqlSession.insert(namespace + ".insertFood_num",map);
			System.out.println("insert Ok:"+result);
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public List getMart_orders(String offline_mart_id) {
		sqlSession = sqlSession();
		System.out.println("getMart_orders");
		HashMap map = new HashMap();
		map.put("offline_mart_id", offline_mart_id);
		try {
			return sqlSession.selectList(namespace + ".getMart_orders", map);
		} finally {
			sqlSession.close();
		}
	}

	public void updateMartOrderStatus(String mart_order_id) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("mart_order_id", mart_order_id);
		try {
			sqlSession.update(namespace + ".updateMartOrderStatus", map);
			System.out.println("update ok:");
			
			
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

	}

	public List getFood_nums(String mart_order_id) {
		sqlSession = sqlSession();
		System.out.println("getFood_nums");
		HashMap map = new HashMap();
		map.put("mart_order_id", mart_order_id);
		try {
			return sqlSession.selectList(namespace + ".getFood_nums", map);
		} finally {
			sqlSession.close();
		}
	}

	public int getProductCnt(int food_id) {
		sqlSession = sqlSession();
		System.out.println("getFood_nums");
		HashMap map = new HashMap();
		map.put("food_id", food_id);
		try {
			return sqlSession.selectOne(namespace + ".getProductCnt", map);
		} finally {
			sqlSession.close();
		}
	}

	public void insertProduct(ProductDataBean product) {
		System.out.println("insertFood_num:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("product", product);
		try{
			int product_id = sqlSession.selectOne(namespace+".getProduct_id");
			product_id++;
			map.put("product_id", product_id);
			int result = sqlSession.insert(namespace + ".insertProduct",map);
			System.out.println("insert Ok:"+result);
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void updateProduct(ProductDataBean product) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("product", product);
		try {
			sqlSession.update(namespace + ".updateProduct", map);
			System.out.println("update ok:");
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
	}

	public List getMart_ordersDate(String offline_mart_id, String date1,
			String date2) {
		sqlSession = sqlSession();
		System.out.println("getMart_ordersDate");
		HashMap map = new HashMap();
		map.put("date1", date1);
		map.put("date2", date2);
		try {
			return sqlSession.selectList(namespace + ".getMart_ordersDate", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getFood_nums2(String mart_order_id) {
		sqlSession = sqlSession();
		System.out.println("getFood_nums2");
		HashMap map = new HashMap();
		map.put("mart_order_id", mart_order_id);
		try {
			return sqlSession.selectList(namespace + ".getFood_nums2", map);
		} finally {
			sqlSession.close();
		}
	}

	public void insertSale(SaleDataBean sale) {
		System.out.println("insertSale:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("sale", sale);
		try{
			int sale_id = sqlSession.selectOne(namespace+".getSale_id");
			sale_id++;
			map.put("sale_id", sale_id);
			int result = sqlSession.insert(namespace + ".insertSale",map);
			System.out.println("insert Ok:"+result);
			//재고 깎기
			sqlSession.update(namespace + ".updateProductM", map);
			System.out.println("update ok:");
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void updatePoint(String userPhone) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("userPhone", userPhone);
		try {
			sqlSession.update(namespace + ".updatePoint", map);
			System.out.println("update ok:");
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
