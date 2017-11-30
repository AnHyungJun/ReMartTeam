package dao;

import java.util.HashMap;
import java.util.List;

import model.BasketDataBean;
import model.Food_paymentDataBean;

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
   
   
   public void insertArticleBasket(BasketDataBean articleBasket) {
	   System.out.println("insertBasket");
	   sqlSession = sqlSession();
	   HashMap map = new HashMap();
	   map.put("articleBasket", articleBasket);
	   
	   try {
		   int number = sqlSession.selectOne(namespace + ".insertBasket_new");
		   if(number != 0)
			   number++;
		   else 
			   number = 1;
		  
		   articleBasket.setBasket_id(number);
		   System.out.println("insert : " + articleBasket);
		   int result = sqlSession.insert(namespace + ".insertBasket", articleBasket);
		   System.out.println("insert ok:" + result);
	   }finally {
		   sqlSession.commit();
		   sqlSession.close();
	   }   
   }
   
   public int getBasketCount(String id) throws Exception {
	      sqlSession = sqlSession();
	      
	      try{
	         HashMap map = new HashMap();
	         map.put("id", id);
	         System.out.println("getBasketCount");
	         return sqlSession.selectOne(namespace + ".getBasketCount", map);
	      } finally {
	         sqlSession.close();
	      }
	}
   
   public List getBaskets(String id) throws Exception {
	      sqlSession = sqlSession();
	      HashMap map = new HashMap();
	      map.put("id", id);
	      
	      try {
	         return sqlSession.selectList(namespace + ".getBaskets", map);
	      } finally {
	         sqlSession.close();
	      }
	}
   
   public void deleteArticle(String basket_id) {
	   System.out.println("delete");
	   sqlSession = sqlSession();
	   HashMap map = new HashMap();
	   map.put("basket_id", basket_id);
	   
	   try {
		   sqlSession.delete(namespace + ".deleteBasket", map);
		   System.out.println("delete ok:");
	   }finally {
		   sqlSession.commit();
		   sqlSession.close();
	   }   
   }
   
   public void updateFoodNum(int food_num, String basket_id) throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("food_num", food_num);
		map.put("basket_id", basket_id);
		
		try {
			sqlSession.update(namespace + ".updateFoodNum", map);
			
		} finally {
				sqlSession.commit();
				sqlSession.close();
		}			
   }	
	
   
   public void insertArticlePayment(Food_paymentDataBean articlePayment) {
	   System.out.println("insertPayment");
	   sqlSession = sqlSession();
	   HashMap map = new HashMap();
	   map.put("articlePayment", articlePayment);
	   
	   try {
		   int number = sqlSession.selectOne(namespace + ".insertPayment_new");
		   if(number != 0)
			   number++;
		   else 
			   number = 1;
		  
		   articlePayment.setPayment_id(number);
		   System.out.println("insert : " + articlePayment);
		   int result = sqlSession.insert(namespace + ".insertPayment", articlePayment);
		   System.out.println("insert ok:" + result);
	   }finally {
		   sqlSession.commit();
		   sqlSession.close();
	   }   
   }
   
   
   public void deleteBasketArticle(String id) {
	   System.out.println("delete");
	   sqlSession = sqlSession();
	   HashMap map = new HashMap();
	   map.put("id", id);
	   
	   try {
		   sqlSession.delete(namespace + ".deletePaidBasket", map);
		   System.out.println("delete ok:");
	   }finally {
		   sqlSession.commit();
		   sqlSession.close();
	   }   
   }
   
   public int getpaymentId() throws Exception{
	   sqlSession = sqlSession();
	   
	   try {
		   int payment_id = sqlSession.selectOne(namespace + ".selectPaymentid");
		   System.out.println("payment_id = " + payment_id);
		   return payment_id;
	   }finally {
		   sqlSession.commit();
			sqlSession.close();
	   }
   }
   
   public void updateHistoryArticle(int payment_id) throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		String order_state = "pay";
		
		map.put("payment_id", payment_id);
		map.put("order_state", order_state);
		
		try {
			sqlSession.update(namespace + ".updateHistory", map);
			
		} finally {
				sqlSession.commit();
				sqlSession.close();
		}			
   }
   
   public List getPaymentArticle(String id) throws Exception {
	      sqlSession = sqlSession();
	      HashMap map = new HashMap();
	      map.put("id", id);
	      
	      try {
	         return sqlSession.selectList(namespace + ".getPayment", map);
	      } finally {
	         sqlSession.close();
	      }
	}
   
   
   
   
   
}