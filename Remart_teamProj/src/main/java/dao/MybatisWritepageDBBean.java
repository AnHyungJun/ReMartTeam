package dao;

import java.util.HashMap;

import model.FeedDataBean;
import model.R_memberDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisWritepageDBBean extends MybatisConnector{
	private final String namespace = "writepage.mybatis";
	private static MybatisWritepageDBBean instance = new MybatisWritepageDBBean();

	public static MybatisWritepageDBBean getInstance(){
		return instance;
	}
	SqlSession sqlSession;
	public int insertNFeed(FeedDataBean feed,String id) {
		System.out.println("insertMember:");
		sqlSession = sqlSession();
		int number=0;
		try{
			number = sqlSession.selectOne(namespace+".findfk");
			if(number != 0)
				number++;
			else 
				number = 1;
			HashMap map = new HashMap();
			map.put("feed",feed);
			map.put("number",number);
			map.put("id",id);
			int result = sqlSession.insert(namespace + ".insertNFeed",map);
			map.clear();
			for(int i=0;i<feed.getImg_name().size();i++){
				int inumber = sqlSession.selectOne(namespace+".findifk");
					if(inumber != 0)
						inumber++;
					else 
						inumber = 1;
				map.put("number", number);
				map.put("inumber", inumber);
				map.put("img_name", feed.getImg_name().get(i));
				map.put("content", feed.getContent().get(i));
				sqlSession.insert(namespace + ".insertFeedimg",map);
				map.clear();
			}
		}finally{
			sqlSession.commit();
			sqlSession.close();
			return number;
		}
	}
	public void insertEFeed(FeedDataBean feed,int feed_id) {
		System.out.println("insertMember:");
		sqlSession = sqlSession();
		try{
			int feed_food_id=sqlSession.selectOne(namespace+".findfoodfeedfk");
			System.out.println(feed_food_id);
			if(feed_food_id != 0)
				feed_food_id++;
			else 
				feed_food_id = 1;
			System.out.println(feed_food_id);
			HashMap map = new HashMap();
			for(int i=0;i<feed.getFood_id().size();i++){
				map.put("food_id",feed.getFood_id().get(i));
				map.put("feed_id",feed_id);
				map.put("feed_food_id",feed_food_id);
				System.out.println(feed_food_id);
				sqlSession.insert(namespace + ".insertFeedFood",map);
				map.clear();
				feed_food_id++;
			}
			
		}finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
