package dao;

import org.apache.ibatis.session.SqlSession;

public class MybatisAdminDBBean {
	private final String namespace = "admin.mybatis";
	private static MybatisAdminDBBean instance = new MybatisAdminDBBean();

	public static MybatisAdminDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;
}
