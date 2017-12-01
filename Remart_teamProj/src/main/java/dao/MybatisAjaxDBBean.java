package dao;

import java.util.HashMap;
import java.util.List;

import model.Food_numDataBean;
import model.Mart_orderDataBean;
import model.Offline_martDataBean;
import model.ProductDataBean;
import model.R_memberDataBean;
import model.RepleDataBean;
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
	public void insertReple(String feed_id,String content,String member_id) {
		System.out.println("insertReple:");
		int num;
		sqlSession = sqlSession();
		
		try {
			HashMap map = new HashMap();
			map.put("feed_id", feed_id);
			num=sqlSession.selectOne(namespace + ".selectRepleid",map);
			if(num==0) num=1;
			else num++;
			map.clear();
			map.put("num", num);
			map.put("feed_id", feed_id);
			map.put("content", content);
			map.put("member_id", member_id);
			sqlSession.selectList(namespace + ".insertReple", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
			
		}
	}
	public List selectReple(String feed_id) {
		System.out.println("selectReple:");
		sqlSession = sqlSession();
		List<RepleDataBean> list;
		HashMap map = new HashMap();
		map.put("feed_id", feed_id);
		try {
			list=sqlSession.selectList(namespace + ".selectReple", map);
			
			return list;
		} finally {
			sqlSession.close();
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
	public List selectUserIdDb() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserIdDb");
		} finally {
			sqlSession.close();
		}
	}
	public List selectHashDb() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectHashDb");
		} finally {
			sqlSession.close();
		}
	}
	public List selectFoodNameDb() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectFoodNameDb");
		} finally {
			sqlSession.close();
		}
	}
	
	public void selectBasketDb(int food_id, int food_num, String id) {
		   System.out.println("insertBasket");
		   sqlSession = sqlSession();
		   
		   try {
			   HashMap map = new HashMap();
			   map.put("food_id", food_id);
			   map.put("food_num", food_num);
			   map.put("id", id);
			   int number = sqlSession.selectOne(namespace + ".insertBasket_new");
			   if(number != 0)
				   number++;
			   else 
				   number = 1;
			   map.put("number", number);
			   
			   System.out.println("insert : " + number);
			   int result = sqlSession.insert(namespace + ".insertBasket", map);
			   System.out.println("insert ok:" + result);
		   }finally {
			   sqlSession.commit();
			   sqlSession.close();
		   }   
	   }
	
	public void insertFollow(String myid, String otherid) {
		System.out.println("insertFollow:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("myid", myid);
		map.put("otherid", otherid);
		try{
			int follow_id = sqlSession.selectOne(namespace+".getFollow_id");
			follow_id++;
			map.put("follow_id", follow_id);
			int result = sqlSession.insert(namespace + ".insertFollow",map);
			System.out.println("insert Ok:"+result);
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void deleteFollow(String myid, String otherid) 
			throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("myid", myid);
		map.put("otherid", otherid);
		try {

			int result = sqlSession.delete(namespace + ".deleteFollow", map);
			System.out.println("delete Ok:"+result);
		} finally {
			sqlSession.commit();
			sqlSession.close();
			
		}
	}
}
