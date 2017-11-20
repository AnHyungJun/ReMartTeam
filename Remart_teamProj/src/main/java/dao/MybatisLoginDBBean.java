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
}
