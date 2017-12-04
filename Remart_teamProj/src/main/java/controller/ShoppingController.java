package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.BasketDataBean;
import model.Food_numDataBean;
import model.Food_paymentDataBean;
import model.R_memberDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisShoppingDBBean;

@Controller
public class ShoppingController {
   
   ModelAndView mv = new ModelAndView();
   R_memberDataBean r_member;
   
   
   String category_id = "1";
   int pageNum = 1;
   
   @Autowired
   MybatisShoppingDBBean dbPro;
   
   @ModelAttribute
   public void addAttributes(HttpServletRequest request, HttpSession session) {
      try {
         request.setCharacterEncoding("utf-8");
         r_member = (R_memberDataBean) request.getSession().getAttribute("memberInfo");
      }catch(UnsupportedEncodingException el) {
         el.printStackTrace();
      }
      
      String reqcategory_id = request.getParameter("category_id");
      
      try{
         pageNum = Integer.parseInt(request.getParameter("pageNum"));
      }catch (Exception e) {
         pageNum = 1;
      }
      
      if(reqcategory_id != null) {
         session.setAttribute("category_id", reqcategory_id);
      }
      
      if(session.getAttribute("category_id") == null) {
         category_id = "1";
      }else {
         category_id = (String) session.getAttribute("category_id");
      }
      
      session.setAttribute("curPage", "shopping");
   }
   
   
   @RequestMapping(value="shoppingMain")
   public ModelAndView shoppingMain() throws Exception{   
      int pageSize = 10;
      
      int currentPage = pageNum;
      int startRow = (currentPage - 1) * pageSize + 1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number = 0;
      
      List articleFoodList = null;
      count = dbPro.getFoodCount(category_id);
      
      if (count > 0) {
    	  articleFoodList = dbPro.getFoods(startRow, endRow, category_id);
      }
     
      number = count - (currentPage - 1) * pageSize;   
      
      int bottomLine = 3;
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
      int endPage = startPage + bottomLine - 1;
      if (endPage > pageCount) endPage = pageCount;
      
      mv.clear();
      
      mv.addObject("startPage", startPage);
      mv.addObject("endPage", endPage);
      mv.addObject("pageCount", pageCount);
      mv.addObject("bottomLine", bottomLine);
      mv.addObject("count", count);
      mv.addObject("currentPage", currentPage);
      mv.addObject("pageSize", pageSize);
      mv.addObject("number", number);
      mv.addObject("articleFoodList", articleFoodList);
      mv.addObject("category_id", category_id);
      
      mv.setViewName("shopping/shoppingMain");
      return mv;
   }
   
   @RequestMapping(value="shoppingPro")
   public ModelAndView shoppingPro(HttpServletRequest request, BasketDataBean articleBasket, HttpSession session) 
		   throws Exception {
	   if(session.getAttribute("memberInfo") == null) {
			mv.setViewName("login/loginForm");
	   		return mv;
	   }
	   else{
		   mv.clear();
		   return basket(session);
	   }
   }
   
   
   @RequestMapping(value="basket")
   public ModelAndView basket(HttpSession session) throws Exception {
	   int count = 0;
	   
	   if(session.getAttribute("memberInfo") == null)
			mv.setViewName("login/loginForm");
	   
	   else {
		   String id = r_member.getId();
		   System.out.println(id);
		   
		   List articleBasketList = null;
		   
		   count = dbPro.getBasketCount(id);
		   System.out.println(count);
		  
		   if (count > 0) {
			   articleBasketList = dbPro.getBaskets(id);
			   System.out.println("getBaskets" + articleBasketList);
		   }
		   
		   mv.clear();
		   mv.addObject("articleBasketList", articleBasketList);
		   mv.addObject("count", count);
		   mv.setViewName("shopping/basket");
		   
	   }
	   
      return mv;
   }
   
   
   @RequestMapping(value="deleteBasket")
   public ModelAndView deleteBasket(HttpServletRequest request, HttpSession session) throws Exception{   
	   String basket_id = request.getParameter("basket_id");
	   System.out.println("basket_id = " + basket_id);
	   
	   dbPro.deleteArticle(basket_id);
	   System.out.println("deleteArticle");
	   
      mv.clear();
      return basket(session);
   }
   
   @RequestMapping(value="updateNumPro")
   public ModelAndView shoppingPro(HttpSession session, HttpServletRequest request) throws Exception {
	   String basket_id = request.getParameter("basket_id");
	   System.out.println("basket_id = " + basket_id);
	   
	   int food_num = Integer.parseInt(request.getParameter("food_num"));
	   System.out.println("food_num=" + food_num);
	   
	   dbPro.updateFoodNum(food_num, basket_id);
	   System.out.println("updateNumPro :");
	   
	   mv.clear();
	   return basket(session);
	  
   }
   

   @RequestMapping(value="paymentInfo")
   public ModelAndView paymentInfo(HttpSession session) throws Exception{   
	   String id = r_member.getId();
	   String name = r_member.getName();
	   String phone = r_member.getPhone();
	   String address1 = r_member.getAddress1();
	   String address2 = r_member.getAddress2();
	   String zip1 = r_member.getZip1();
	   String zip2 = r_member.getZip2();
	   String email = r_member.getEmail();
	   
	   List articleBasketList = null;
	   articleBasketList = dbPro.getBaskets(id);
	   System.out.println("getBaskets" + articleBasketList);

	   mv.clear();
	   mv.addObject("articleBasketList", articleBasketList);
	   mv.addObject("name", name);
	   mv.addObject("phone", phone);
	   mv.addObject("address1", address1);
	   mv.addObject("address2", address2);
	   mv.addObject("zip1", zip1);
	   mv.addObject("zip2", zip2);
	   mv.addObject("email", email);
	   
	   mv.setViewName("shopping/paymentInfo");
	   return mv;
   }
   
   
   @RequestMapping(value="paymentPro")
   public ModelAndView paymentPro(HttpServletRequest request, Food_paymentDataBean articlePayment) throws Exception {
	   
	   String id = r_member.getId();
	   articlePayment.setId(id);
	   System.out.println("paymentPro :" + articlePayment);
	   
	   int count = dbPro.getBasketCount(id);
	   
	   String name = request.getParameter("name");
	   String phone = request.getParameter("phone");
	   String address1 = request.getParameter("address1");
	   String address2 = request.getParameter("address2");
	   String zip1 = request.getParameter("zip1");
	   String zip2 = request.getParameter("zip2");
	   String email = request.getParameter("email");
	   int all_price = Integer.parseInt(request.getParameter("all_price"));
	   String pay_method = request.getParameter("pay_method");
	   String pro_name = request.getParameter("pro_name");
	   
	   // 결제 테이블 삽입
	   dbPro.insertArticlePayment(articlePayment, pro_name, count);
	   System.out.println("articlePayment");
	   
	   int payment_id = dbPro.getpaymentId();
	   System.out.println("payment_id =" + payment_id);
	   
	   // 
	   String[] food_id = request.getParameterValues("food_id");
	   String[] qty = request.getParameterValues("food_num");
	   if(food_id != null)
		   for(int i=0; i<food_id.length; i++){
				Food_numDataBean food_num = new Food_numDataBean();
				food_num.setFood_id(Integer.parseInt(food_id[i]));
				food_num.setQty(Integer.parseInt(qty[i]));
				food_num.setDiv("offline");
				food_num.setOrder_id(payment_id);
				dbPro.insertFood_num(food_num);
				System.out.println("food_id[]");
				
				//구매한 상품 수량 감소
				dbPro.updateFoodQty(food_id[i], qty[i]);
			}

	   mv.clear();
	   mv.addObject("id", id);
	   mv.addObject("name", name);
	   mv.addObject("phone", phone);
	   mv.addObject("address1", address1);
	   mv.addObject("address2", address2);
	   mv.addObject("zip1", zip1);
	   mv.addObject("zip2", zip2);
	   mv.addObject("all_price", all_price);
	   mv.addObject("pay_method", pay_method);
	   mv.addObject("count", count);
	   mv.addObject("pro_name", pro_name);
	   mv.setViewName("shopping/paymentPro");
	   return mv;
	  
   }
   
   
   @RequestMapping(value="orderFinish")
   public ModelAndView orderFinish() throws Exception {
	   String id = r_member.getId();
	   
	   dbPro.deleteBasketArticle(id);
	   System.out.println("deleteBasketArticle");
	   
	   int payment_id = dbPro.getpaymentId();
	   
	   dbPro.updateHistoryArticle(payment_id);
	   System.out.println("updateHistoryArticle");
	   
	   mv.clear();
	   mv.addObject("payment_id", payment_id);
	   mv.setViewName("shopping/orderFinish");
	   return mv;
	  
   }
   
   @RequestMapping(value="historyPayment")
   public ModelAndView historyPayment(HttpServletRequest request) throws Exception {
	   
	   String id = r_member.getId();
	   System.out.println(id);
	   
	   List articlePaymentInfoList = null;
	   articlePaymentInfoList = dbPro.getPaymentArticle(id);
	   System.out.println("articlePaymentInfoList");
	   
	   List articleFoodNumList = null;
	   articleFoodNumList = dbPro.getFoodNumArticle();
	   System.out.println("articleFoodNumList");
	   
	   mv.clear();
	   mv.addObject("articlePaymentInfoList", articlePaymentInfoList);
	   mv.addObject("articleFoodNumList", articleFoodNumList);
	   mv.setViewName("shopping/historyPayment");
	   return mv;
   }
   
}