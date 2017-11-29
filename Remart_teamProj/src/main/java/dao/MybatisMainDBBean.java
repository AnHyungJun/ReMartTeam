package dao;

import java.util.HashMap;
import java.util.List;

import model.FeedDataBean;
import model.ImgDataBean;
import model.R_memberDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisMainDBBean extends MybatisConnector {
	private final String namespace = "main.mybatis";
	private static MybatisMainDBBean instance = new MybatisMainDBBean();

	public static MybatisMainDBBean getInstance() {
		return instance;
	}

	SqlSession sqlSession;

	public List getFeeds() {
		sqlSession = sqlSession();
	
		List<FeedDataBean> feedlist = null;
		try {
			feedlist = sqlSession.selectList(namespace + ".getfeeds");
			for (int i = 0; i < feedlist.size(); i++) {
				int feed_id= feedlist.get(i).getFeed_id();
				feedlist.get(i).setImg_name(
						sqlSession.selectList(namespace + ".getImg_name", feed_id));
				feedlist.get(i).setContent(
						sqlSession.selectList(namespace + ".getContent", feed_id));
			}
			return feedlist;

		} finally {

			sqlSession.close();
		}
	}
	
	public List getLikeList(String id){
		sqlSession=sqlSession();
		try{
			return sqlSession.selectList(namespace+".getLikeList",id);
		}finally{
			sqlSession.close();
		}
		
	}
	public List getFeeds(R_memberDataBean r_member) {
	      sqlSession = sqlSession();
	   
	      List<FeedDataBean> feedlist = null;
	      try {
	         String id;
	         if(r_member == null){
	            id="idnotexist";
	            feedlist = sqlSession.selectList(namespace + ".getfeedsNologin");
	         }
	         else{
	        	 id=r_member.getId();
	        	 feedlist = sqlSession.selectList(namespace + ".getfeeds",id);
	         }
	         
	         for (int i = 0; i < feedlist.size(); i++) {
	            int feed_id= feedlist.get(i).getFeed_id();
	            feedlist.get(i).setImg_name(
	                  sqlSession.selectList(namespace + ".getImg_name", feed_id));
	            feedlist.get(i).setContent(
	                  sqlSession.selectList(namespace + ".getContent", feed_id));
	         }
	         return feedlist;

	      } finally {

	         sqlSession.close();
	      }
	   }
}
