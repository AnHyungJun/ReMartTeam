package dao;

import java.util.HashMap;
import java.util.List;

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
}
