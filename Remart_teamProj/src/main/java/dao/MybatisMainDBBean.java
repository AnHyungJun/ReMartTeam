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

	public FeedDataBean getFeed(int feed_id) {
		sqlSession = sqlSession();
		FeedDataBean feed = null;
		try {
			feed = sqlSession.selectOne(namespace + ".getfeednol", feed_id);
			feed.setImg_name(sqlSession.selectList(namespace + ".getImg_name",
					feed_id));
			feed.setContent(sqlSession.selectList(namespace + ".getContent",
					feed_id));
			return feed;

		} finally {

			sqlSession.close();
		}
	}

	public FeedDataBean getFeed(int feed_id, String id) {
		sqlSession = sqlSession();
		FeedDataBean feed = null;
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("feed_id", feed_id);
		try {
			feed = sqlSession.selectOne(namespace + ".getfeed", map);
			feed.setImg_name(sqlSession.selectList(namespace + ".getImg_name",
					feed_id));
			feed.setContent(sqlSession.selectList(namespace + ".getContent",
					feed_id));
			return feed;

		} finally {

			sqlSession.close();
		}
	}

	public List getFeeds(String userid) {
		sqlSession = sqlSession();

		List<FeedDataBean> feedlist = null;
		try {
			String id;
			if (userid == null || userid.equals("")) {
				id = "idnotexist";
				feedlist = sqlSession
						.selectList(namespace + ".getfeedsNologin");
			} else {
				id = userid;
				feedlist = sqlSession.selectList(namespace + ".getfeeds", id);
			}

			for (int i = 0; i < feedlist.size(); i++) {
				int feed_id = feedlist.get(i).getFeed_id();
				feedlist.get(i).setImg_name(
						sqlSession.selectList(namespace + ".getImg_name",
								feed_id));
				feedlist.get(i).setContent(
						sqlSession.selectList(namespace + ".getContent",
								feed_id));

				feedlist.get(i).setReplelist(
						sqlSession.selectList(namespace + ".feedrepletwo",
								feed_id));
				feedlist.get(i).setFood_id(
						sqlSession.selectList(namespace + ".editorfoodtwo",
								feed_id));
				feedlist.get(i).setHashtaglist(
						sqlSession.selectList(namespace + ".hashtaglist",
								feed_id));
				id = feedlist.get(i).getId();
				feedlist.get(i).setProfileImg(
						(String) sqlSession.selectOne(
								namespace + ".profileImg", id));

			}
			return feedlist;

		} finally {

			sqlSession.close();
		}
	}

	public List getFeeds(R_memberDataBean r_member) {
		sqlSession = sqlSession();

		List<FeedDataBean> feedlist = null;
		try {
			String id;
			if (r_member == null) {
				id = "idnotexist";
				feedlist = sqlSession
						.selectList(namespace + ".getfeedsNologin");
			} else {
				id = r_member.getId();
				feedlist = sqlSession.selectList(namespace + ".getfeeds", id);
			}

			for (int i = 0; i < feedlist.size(); i++) {
				int feed_id = feedlist.get(i).getFeed_id();
				feedlist.get(i).setImg_name(
						sqlSession.selectList(namespace + ".getImg_name",
								feed_id));
				feedlist.get(i).setContent(
						sqlSession.selectList(namespace + ".getContent",
								feed_id));
				feedlist.get(i).setReplelist(
						sqlSession.selectList(namespace + ".feedrepletwo",
								feed_id));
				feedlist.get(i).setFood_id(
						sqlSession.selectList(namespace + ".editorfoodtwo",
								feed_id));
				feedlist.get(i).setHashtaglist(
						sqlSession.selectList(namespace + ".hashtaglist",
								feed_id));
				id = feedlist.get(i).getId();
				feedlist.get(i).setProfileImg(
						(String) sqlSession.selectOne(
								namespace + ".profileImg", id));

			}
			return feedlist;

		} finally {

			sqlSession.close();
		}
	}

	public void like(String id, int feed_id, String type) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("feed_id", feed_id);
		map.put("type", type);
		try {
			int likely_bookmark_id = sqlSession
					.selectOne(namespace + ".likeid");
			map.put("likely_bookmark_id", likely_bookmark_id);
			sqlSession.insert(namespace + ".like", map);
			if (type.equals("L"))
				sqlSession.update(namespace + ".point", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void unlike(String id, int feed_id, String type) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("feed_id", feed_id);
		map.put("type", type);
		try {
			sqlSession.delete(namespace + ".unlike", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();

		}
	}

	public List getUserSearchList(String autocompleteText) {
		System.out.println("getUserSearchList:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("autocompleteText", autocompleteText);
		try {
			return sqlSession.selectList(namespace + ".getUserSearchList", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getFeedSearchList(String autocompleteText) {
		System.out.println("getFeedSearchList:");
		List<FeedDataBean> feedlist = null;
		sqlSession = sqlSession();
		List<ImgDataBean> tmp = null;
		HashMap map = new HashMap();
		map.put("autocompleteText", autocompleteText);
		try {
			feedlist = sqlSession.selectList(namespace + ".getFeedSearchList",
					map);
			for (int i = 0; i < feedlist.size(); i++) {
				map.clear();
				map.put("feed_id", feedlist.get(i).getFeed_id());
				feedlist.get(i).setImg_name(
						sqlSession.selectList(namespace + ".getImg_name", map));
				feedlist.get(i).setContent(
						sqlSession.selectList(namespace + ".getContent", map));
				feedlist.get(i).setReplelist(
						sqlSession.selectList(namespace + ".feedreple", map));
			}

			return feedlist;
		} finally {
			sqlSession.close();
		}
	}

	public List getFoodSearchList(String autocompleteText2) {
		System.out.println("getFoodSearchList:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("autocompleteText2", autocompleteText2);
		try {
			return sqlSession.selectList(namespace + ".getFoodSearchList", map);
		} finally {
			sqlSession.close();
		}
	}

	public List getUserSearchListWithFollow(String autocompleteText, String id) {
		System.out.println("getUserSearchListWithFollow:");
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("autocompleteText", autocompleteText);
		map.put("id", id);
		try {
			return sqlSession.selectList(namespace
					+ ".getUserSearchListWithFollow", map);
		} finally {
			sqlSession.close();
		}
	}

	public List<FeedDataBean> getTodayRecomendFeed() {
		List<FeedDataBean> feedlist = null;
		sqlSession = sqlSession();
		List<ImgDataBean> tmp = null;
		HashMap map = new HashMap();
		try {
			feedlist = sqlSession.selectList(namespace
					+ ".getTodayRecomendFeed");
			for (int i = 0; i < feedlist.size(); i++) {
				map.clear();
				map.put("feed_id", feedlist.get(i).getFeed_id());
				feedlist.get(i).setImg_name(
						sqlSession.selectList(namespace + ".getImg_name", map));
				feedlist.get(i).setContent(
						sqlSession.selectList(namespace + ".getContent", map));
				feedlist.get(i).setReplelist(
						sqlSession.selectList(namespace + ".feedreple", map));
			}

			return feedlist;
		} finally {
			sqlSession.close();
		}
	}

	public List getHashtagCnt() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".getHashtagCnt");
		} finally {
			sqlSession.close();
		}
	}

	public List getHashtagCnt2() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".getHashtagCnt2");
		} finally {
			sqlSession.close();
		}
	}

	public List getEditorFeed() {
		List<FeedDataBean> feedlist = null;
		sqlSession = sqlSession();
		List<ImgDataBean> tmp = null;
		try {
			HashMap map = new HashMap();
			feedlist = sqlSession.selectList(namespace + ".getEditorFeed", map);

			for (int i = 0; i < feedlist.size(); i++) {
				map.clear();
				map.put("feed_id", feedlist.get(i).getFeed_id());
				feedlist.get(i).setImg_name(
						sqlSession.selectList(namespace + ".getImg_name", map));
				feedlist.get(i).setContent(
						sqlSession.selectList(namespace + ".getContent", map));
				feedlist.get(i).setReplelist(
						sqlSession.selectList(namespace + ".feedreple", map));
				feedlist.get(i).setFood_id(
						sqlSession.selectList(namespace + ".editorfood", map));
			}

			return feedlist;

		} finally {

			sqlSession.close();
		}
	}

	public List selectUserIdDb() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserIdDb");
		} finally {
			sqlSession.close();
		}
	}

	public List selectHashDb() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectHashDb");
		} finally {
			sqlSession.close();
		}
	}

	public List selectFoodNameDb() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectFoodNameDb");
		} finally {
			sqlSession.close();
		}
	}

	public int getHashtagKeyCount(String please) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("please", please);
		try {
			return sqlSession.selectOne(namespace + ".getHashtagKeyCount", map);
		} finally {
			sqlSession.close();
		}
	}
}
