package dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class MybatisChatDBBean extends MybatisConnector{

	private final String namespace = "chat.mybatis";
	private static MybatisChatDBBean instance = new MybatisChatDBBean();

	public static MybatisChatDBBean getInstance() {
		return instance;
	}

	SqlSession sqlSession;
	
	public String getChatMessage(String id) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		
		try {
			String chat_id = sqlSession.selectOne(namespace + ".getChatId",map);
			System.out.println("chat_id : " + chat_id);
			map.put("chat_id", chat_id);
			
			String x = "";
			x = sqlSession.selectOne(namespace + ".getChatContent", map);
			return x;
			
		} finally {
			sqlSession.close();
		}
	}
	
	
	
}
