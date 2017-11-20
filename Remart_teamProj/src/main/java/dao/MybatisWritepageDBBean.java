package dao;

import org.apache.ibatis.session.SqlSession;

public class MybatisWritepageDBBean extends MybatisConnector{
	private final String namespace = "writepage.mybatis";
	private static MybatisWritepageDBBean instance = new MybatisWritepageDBBean();

	public static MybatisWritepageDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;

}
