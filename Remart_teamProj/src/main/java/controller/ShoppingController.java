package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisShoppingDBBean;

@Controller
public class ShoppingController {
   
   ModelAndView mv = new ModelAndView();
   
   String category_id = "1";
   int pageNum = 1;
   
   @Autowired
   MybatisShoppingDBBean dbPro;
   
   @ModelAttribute
   public void addAttributes(HttpServletRequest request) {
      try {
         request.setCharacterEncoding("utf-8");
      }catch(UnsupportedEncodingException el) {
         el.printStackTrace();
      }
      
      HttpSession session = request.getSession();
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
      System.out.println(category_id);
   }
   
   
   
   @RequestMapping(value="shoppingMain")
   public ModelAndView shoppingMain() throws Exception{   
      int pageSize = 10;
      
      int currentPage = pageNum;
      int startRow = (currentPage - 1) * pageSize + 1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number = 0;
      
      List articleList = null;
      count = dbPro.getFoodCount(category_id);
      
      if (count > 0) {
         articleList = dbPro.getFoods(startRow, endRow, category_id);
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
      mv.addObject("articleList", articleList);
      mv.addObject("category_id", category_id);
      System.out.println(articleList);
      mv.setViewName("shopping/shoppingMain");
      return mv;
   }
   
   @RequestMapping(value="basket")
   public ModelAndView basket(){   
      mv.clear();
      mv.setViewName("shopping/basket");
      return mv;
   }
   
   @RequestMapping(value="paymentInfo")
   public ModelAndView paymentInfo(){   
      mv.clear();
      mv.setViewName("shopping/paymentInfo");
      return mv;
   }
   
   
}