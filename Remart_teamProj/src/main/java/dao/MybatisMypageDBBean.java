package dao;

import java.util.HashMap;
import java.util.List;

import model.FeedDataBean;
import model.ImgDataBean;
import model.R_memberDataBean;
import model.RepleDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisMypageDBBean extends MybatisConnector {
	private final String namespace = "mypage.mybatis";
	private static MybatisMypageDBBean instance = new MybatisMypageDBBean();

	public static MybatisMypageDBBean getInstance() {
		return instance;
	}

	SqlSession sqlSession;

	public R_memberDataBean selectMember(String id) {

		sqlSession = sqlSession();
		R_memberDataBean member;
		try {
			HashMap map = new HashMap();
			map.put("id", id);
			member = sqlSession.selectOne(namespace + ".pagea", map);

		} finally {

			sqlSession.close();
		}
		return member;
	}

	public List getFeedList(String id) {
		List<FeedDataBean> feedlist=null;
		sqlSession = sqlSession();
		List<ImgDataBean> tmp=null;
		try {
			HashMap map = new HashMap();
			map.put("id", id);
			feedlist=sqlSession.selectList(namespace + ".getfeedlist", map);
			for(int i=0;i<feedlist.size();i++){
				map.clear();
				map.put("feed_id", feedlist.get(i).getFeed_id());
				feedlist.get(i).setImg_name(sqlSession.selectList(namespace + ".getImg_name", map));
				feedlist.get(i).setContent(sqlSession.selectList(namespace + ".getContent", map));
				feedlist.get(i).setReplelist(sqlSession.selectList(namespace + ".feedreple", map));
			}
			
			

			
			return feedlist;

		} finally {

			sqlSession.close();
		}
	}
	
	
	
	
	
}
