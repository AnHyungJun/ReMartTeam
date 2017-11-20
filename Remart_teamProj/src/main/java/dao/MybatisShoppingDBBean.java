package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class MybatisShoppingDBBean extends MybatisConnector{

   private final String namespace = "shopping.mybatis";
   private static MybatisShoppingDBBean instance = new MybatisShoppingDBBean();
   SqlSession sqlSession;
   
   public static MybatisShoppingDBBean getInstance() {
      System.out.println("MybatisShoppingDBBean");
      return instance;
   }
   
   public int getFoodCount(String category_id) throws Exception {
      sqlSession = sqlSession();
      System.out.println("getFoodCount : " + category_id);
      
      try{
         HashMap map = new HashMap();
         map.put("category_id", category_id);
         
         return sqlSession.selectOne(namespace + ".getFoodCount", map);
      } finally {
         sqlSession.close();
      }
   }
   
   public List getFoods(int start, int end, String category_id) throws Exception {
      sqlSession = sqlSession();
      System.out.println("getFoods===old");
      
      HashMap map = new HashMap();
      map.put("start", start);
      map.put("end", end);
      map.put("category_id", category_id);
      
      try {
         return sqlSession.selectList(namespace + ".getFoods", map);
      } finally {
         sqlSession.close();
      }
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}