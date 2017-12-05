package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisAdminDBBean;

@Controller
public class AdminController {
ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisAdminDBBean dbPro;
	
	@ModelAttribute
	   public void addAttributes(HttpServletRequest request, HttpSession session) {
	      
	      session.setAttribute("curPage", "n");
	   }
	
	@RequestMapping(value="main")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("admin/main");
		return mv;
	}
	@RequestMapping(value="customForm")
	public ModelAndView customForm(){	
		mv.clear();
		mv.setViewName("admin/customForm");
		return mv;
	}
	@RequestMapping(value="productForm")
	public ModelAndView productForm(){	
		mv.clear();
		mv.setViewName("admin/productForm");
		return mv;
	}
	@RequestMapping(value="orderStatusForm")
	public ModelAndView orderStatusForm(){	
		List orderList = null;
		orderList=dbPro.getOrderList();
		mv.clear();
		mv.addObject("orderList",orderList);
		mv.setViewName("admin/orderStatusForm");
		return mv;
	}
	@RequestMapping(value="stchange")
	public ModelAndView stchange(int mart_order_id,String status){
		dbPro.change(mart_order_id,status);
		mv.clear();
		mv.setViewName("admin/orderStatusForm");
		return mv;
	}
	@RequestMapping(value="salesStatusForm")
	public ModelAndView salesStatusForm(){	
		mv.clear();
		mv.setViewName("admin/salesStatusForm");
		return mv;
	}
}
