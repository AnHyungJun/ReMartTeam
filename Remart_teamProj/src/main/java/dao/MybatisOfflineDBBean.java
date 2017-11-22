package dao;

import org.apache.ibatis.session.SqlSession;

public class MybatisOfflineDBBean extends MybatisConnector{
	private final String namespace = "offline.mybatis";
	private static MybatisOfflineDBBean instance = new MybatisOfflineDBBean();

	public static MybatisOfflineDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;

}
