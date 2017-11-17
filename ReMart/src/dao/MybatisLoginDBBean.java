package dao;

import java.util.HashMap;

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


	
}
