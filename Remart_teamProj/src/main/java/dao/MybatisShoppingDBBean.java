package dao;

import org.apache.ibatis.session.SqlSession;

public class MybatisShoppingDBBean extends MybatisConnector{
	private final String namespace = "shopping.mybatis";
	private static MybatisShoppingDBBean instance = new MybatisShoppingDBBean();

	public static MybatisShoppingDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;

}
