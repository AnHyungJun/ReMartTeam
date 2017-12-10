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

	public R_memberDataBean selectMember(String id,String myid) {

		sqlSession = sqlSession();
		R_memberDataBean member;
		try {
			HashMap map = new HashMap();
			map.put("id", id);
			map.put("myid", myid);
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
				feedlist.get(i).setFood_id(sqlSession.selectList(namespace + ".editorfood", map));
				String tmps="";
				for(int j=0;j<feedlist.get(i).getContent().size();j++){
					tmps+=feedlist.get(i).getContent().get(j)+"@!";
				}
				feedlist.get(i).setMakecontent(tmps);
				feedlist.get(i).setHashtaglist(sqlSession.selectList(namespace + ".hashtaglist", map));
			}
			
			

			
			return feedlist;

		} finally {

			sqlSession.close();
		}
	}
	
	public void updateMember(R_memberDataBean member) {
		System.out.println("updateMember:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("member", member);
		
		System.out.println("member"+member);
		try{
			sqlSession.update(namespace + ".updateMember",map);
			System.out.println("update Ok:");
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public List<FeedDataBean> getLikeFeedList(String id) {
		List<FeedDataBean> feedlist=null;
		sqlSession = sqlSession();
		List<ImgDataBean> tmp=null;
		try {
			HashMap map = new HashMap();
			map.put("id", id);
			feedlist=sqlSession.selectList(namespace + ".getLikeFeedList", map);
			
			for(int i=0;i<feedlist.size();i++){
				map.clear();
				map.put("feed_id", feedlist.get(i).getFeed_id());
				feedlist.get(i).setImg_name(sqlSession.selectList(namespace + ".getImg_name", map));
				feedlist.get(i).setContent(sqlSession.selectList(namespace + ".getContent", map));
				feedlist.get(i).setReplelist(sqlSession.selectList(namespace + ".feedreple", map));
				feedlist.get(i).setFood_id(sqlSession.selectList(namespace + ".editorfood", map));
				String tmps="";
				for(int j=0;j<feedlist.get(i).getContent().size();j++){
					tmps+=feedlist.get(i).getContent().get(j)+"@!";
				}
				feedlist.get(i).setMakecontent(tmps);
				feedlist.get(i).setHashtaglist(sqlSession.selectList(namespace + ".hashtaglist", map));
			}
			
			

			
			return feedlist;

		} finally {

			sqlSession.close();
		}
	}

	public List<FeedDataBean> getBookmarkFeedList(String id) {
		List<FeedDataBean> feedlist=null;
		sqlSession = sqlSession();
		List<ImgDataBean> tmp=null;
		try {
			HashMap map = new HashMap();
			map.put("id", id);
			feedlist=sqlSession.selectList(namespace + ".getBookmarkFeedList", map);
			
			for(int i=0;i<feedlist.size();i++){
				map.clear();
				map.put("feed_id", feedlist.get(i).getFeed_id());
				feedlist.get(i).setImg_name(sqlSession.selectList(namespace + ".getImg_name", map));
				feedlist.get(i).setContent(sqlSession.selectList(namespace + ".getContent", map));
				feedlist.get(i).setReplelist(sqlSession.selectList(namespace + ".feedreple", map));
				feedlist.get(i).setFood_id(sqlSession.selectList(namespace + ".editorfood", map));
				String tmps="";
				for(int j=0;j<feedlist.get(i).getContent().size();j++){
					tmps+=feedlist.get(i).getContent().get(j)+"@!";
				}
				feedlist.get(i).setMakecontent(tmps);
				feedlist.get(i).setHashtaglist(sqlSession.selectList(namespace + ".hashtaglist", map));
			}
			
			

			
			return feedlist;

		} finally {

			sqlSession.close();
		}
	}

	public List<FeedDataBean> getFollowFeedList(String id) {
		List<FeedDataBean> feedlist=null;
		sqlSession = sqlSession();
		List<ImgDataBean> tmp=null;
		try {
			HashMap map = new HashMap();
			map.put("id", id);
			feedlist=sqlSession.selectList(namespace + ".getFollowFeedList", map);
			
			for(int i=0;i<feedlist.size();i++){
				map.clear();
				map.put("feed_id", feedlist.get(i).getFeed_id());
				feedlist.get(i).setImg_name(sqlSession.selectList(namespace + ".getImg_name", map));
				feedlist.get(i).setContent(sqlSession.selectList(namespace + ".getContent", map));
				feedlist.get(i).setReplelist(sqlSession.selectList(namespace + ".feedreple", map));
				feedlist.get(i).setFood_id(sqlSession.selectList(namespace + ".editorfood", map));
				String tmps="";
				for(int j=0;j<feedlist.get(i).getContent().size();j++){
					tmps+=feedlist.get(i).getContent().get(j)+"@!";
				}
				feedlist.get(i).setMakecontent(tmps);
				feedlist.get(i).setHashtaglist(sqlSession.selectList(namespace + ".hashtaglist", map));
			}
			
			

			
			return feedlist;

		} finally {

			sqlSession.close();
		}
	}

	public List getFollowingList(String id) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		try {
			return sqlSession.selectList(namespace + ".getFollowingList", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getFollowerList(String id) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		try {
			return sqlSession.selectList(namespace + ".getFollowerList", map);
		} finally {
			sqlSession.close();
		}
	}
	
	
	
}
