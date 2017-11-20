package dao;

import org.apache.ibatis.session.SqlSession;

public class MybatisMainDBBean extends MybatisConnector{
	private final String namespace = "main.mybatis";
	private static MybatisMainDBBean instance = new MybatisMainDBBean();

	public static MybatisMainDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;

}
