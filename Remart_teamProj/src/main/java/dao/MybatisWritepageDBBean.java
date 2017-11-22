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
	public void insertNFeed(FeedDataBean feed,String id) {
		System.out.println("insertMember:");
		sqlSession = sqlSession();
		
		try{
			int number = sqlSession.selectOne(namespace+".findfk");
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
			
			System.out.println(feed.getImg_name().size());
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
		}
	}
}
