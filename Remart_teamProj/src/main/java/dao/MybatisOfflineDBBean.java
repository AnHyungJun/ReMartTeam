package dao;

import java.util.HashMap;

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
			System.out.println(cuPasswd);
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

}
