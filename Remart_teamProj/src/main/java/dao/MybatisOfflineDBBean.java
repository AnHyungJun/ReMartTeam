package dao;

import java.util.HashMap;

import model.Food_numDataBean;
import model.Mart_orderDataBean;
import model.Offline_martDataBean;
import model.R_memberDataBean;
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

}
