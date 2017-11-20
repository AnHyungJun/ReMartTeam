package dao;

import org.apache.ibatis.session.SqlSession;

public class MybatisMypageDBBean extends MybatisConnector{
	private final String namespace = "mypage.mybatis";
	private static MybatisMypageDBBean instance = new MybatisMypageDBBean();

	public static MybatisMypageDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;

}
