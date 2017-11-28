package dao;

import java.util.HashMap;
import java.util.List;

import model.Food_numDataBean;
import model.Mart_orderDataBean;
import model.Offline_martDataBean;
import model.ProductDataBean;
import model.R_memberDataBean;
import model.StaffDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisAjaxDBBean extends MybatisConnector{
	private final String namespace = "ajax.mybatis";
	private static MybatisAjaxDBBean instance = new MybatisAjaxDBBean();

	public static MybatisAjaxDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;
	
	public String selectUserNameDb(String keyword) {
		System.out.println("selectUserNameDb:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("keyword", keyword);
		String x = "";
		try{
			R_memberDataBean member = sqlSession.selectOne(namespace + ".selectUserNameDb",map);
			x += member.getName() + "," + member.getPoint();
		}finally{
			sqlSession.close();
			return x;
		}

	}
	
	public String selectProductDb(String keyword) {
		System.out.println("selectProductDb:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("keyword", keyword);
		String x = "";
		try{
			ProductDataBean product = sqlSession.selectOne(namespace + ".selectProductDb",map);
			x += product.getProduct_id() + ","+product.getName()+"," +product.getPrice() + "," +product.getQty();
		}finally{
			sqlSession.close();
			return x;
		}

	}

	public List selectFoodDb(String keyword) {
		System.out.println("selectFoodDb:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("keyword", keyword);
		try {
			return sqlSession.selectList(namespace + ".selectFoodDb", map);
		} finally {
			sqlSession.close();
		}
	}
}
