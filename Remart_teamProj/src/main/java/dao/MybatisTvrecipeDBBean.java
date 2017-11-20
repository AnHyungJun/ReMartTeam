package dao;

import org.apache.ibatis.session.SqlSession;

public class MybatisTvrecipeDBBean extends MybatisConnector{
	private final String namespace = "tvrecipe.mybatis";
	private static MybatisTvrecipeDBBean instance = new MybatisTvrecipeDBBean();

	public static MybatisTvrecipeDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;

}
