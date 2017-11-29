package dao;

import java.util.HashMap;

import model.R_memberDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisLoginDBBean extends MybatisConnector{
	private final String namespace = "login.mybatis";
	private static MybatisLoginDBBean instance = new MybatisLoginDBBean();

	public static MybatisLoginDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;

	public int comfirmId(String id) throws Exception{
		System.out.println("comfirmId:"+id);
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		int x=-1, cnt;
		try{
			cnt = sqlSession.selectOne(namespace + ".comfirmId",map);
			if(cnt == 0)
				x = -1;
			else
				x = 1;
			
		}finally{
			sqlSession.close();
			return x;
		}
	}

	public void insertMember(R_memberDataBean member) {
		System.out.println("insertMember:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("member", member);
		try{
			int result = sqlSession.insert(namespace + ".insertMember",map);
			System.out.println("insert Ok:"+result);
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public int loginCheck(String id, String passwd) {
		System.out.println("loginCheck:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		int x = -1;
		try{
			String cuPasswd = sqlSession.selectOne(namespace + ".loginCheck",map);
			if(cuPasswd == null)
				x = -1; //�빐�떦�븘�씠�뵒 �뾾�쓬
			else if(cuPasswd.equals(passwd))
				x = 1; //�씪移�
			else
				x = 0; //鍮꾨�踰덊샇��由�
		}finally{
			sqlSession.close();
			return x;
		}
		
		
	}

	public R_memberDataBean getMemberInfo(String id){
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		R_memberDataBean member = new R_memberDataBean();
		try{
			member = (R_memberDataBean)sqlSession.selectOne(namespace+".getMemberInfo",map);
		}finally{
			sqlSession.close();
			return member;
		}
	}
	
	public String getId(String email) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("email", email);
		try {
			return sqlSession.selectOne(namespace + ".getId", map);
		} finally {
			sqlSession.close();
		}
	}

	public void updatePasswd(String id, String passwd) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);
		try {
			sqlSession.update(namespace + ".updatePw", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public int forgotCheck(String name, String email) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("email", email);
		int chkidpw = 1;
		try {
			// String conid = sqlSession.selectOne(namespace + ".getId", map);
			String conname = sqlSession.selectOne(namespace + ".getName", map);
			if(conname == null)
				chkidpw = -1;
			else if (conname.equals(name))
					chkidpw = 1;
			else
				chkidpw = 0;
		} finally {
			sqlSession.close();
			return chkidpw;
		}
	}
}
