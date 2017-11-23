package controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Food_numDataBean;
import model.Mart_orderDataBean;
import model.Offline_martDataBean;
import model.R_memberDataBean;
import model.StaffDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisLoginDBBean;
import dao.MybatisOfflineDBBean;

@Controller
public class OfflineController {
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisOfflineDBBean dbPro;
	
	@RequestMapping(value="offline_loginForm")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("offline/offline_loginForm");
		return mv;
	}
	
	@RequestMapping(value="offline_loginPro")
	public ModelAndView loginPro(String id, String passwd, HttpSession session){	
		int check = dbPro.offlineLoginCheck(id, passwd);
		int check2 = dbPro.staffLoginCheck(id, passwd);
		mv.clear();
		mv.addObject("check",check);
		mv.addObject("check2",check2);
		if(check == 1){
			mv.setViewName("offline/offline_loginPro");
			Offline_martDataBean offlineInfo = dbPro.getOfflineInfo(id);
			session.setAttribute("offlineInfo", offlineInfo);
			return mv;
		}else if(check2 == 1){
			mv.setViewName("offline/staff_loginPro");
			StaffDataBean staffInfo = dbPro.getStaffInfo(id);
			session.setAttribute("staffInfo", staffInfo);
			return mv;
		}else{
			mv.setViewName("offline/offline_loginPro");
			return mv;
		}
	}
	
	@RequestMapping(value="product_orderForm")
	public ModelAndView product_orderForm(){	
		mv.clear();
		mv.setViewName("offline/product_orderForm");
		return mv;
	}
	
	@RequestMapping(value="saleForm")
	public ModelAndView saleForm(){	
		mv.clear();
		mv.setViewName("offline/saleForm");
		return mv;
	}
	
	@RequestMapping(value="loginOut")
	public ModelAndView loginOut(HttpSession session){	
		session.invalidate();

		return loginForm();
	}
	
	@RequestMapping(value="offlineSearch")
	public ModelAndView offlineSearch(HttpServletRequest request){
		mv.clear();
		mv.setViewName("local/suggestclientSearch");
		return mv;
	}
	@RequestMapping(value="product_orderPro")
	public ModelAndView product_orderPro(Mart_orderDataBean mart_order, String or_date_before,HttpServletRequest request){
		mart_order.setOr_date(Timestamp.valueOf(or_date_before+" 00:00:00"));
		mart_order.setStatus("order");
		int mart_order_num = dbPro.getMart_order_num();
		mart_order_num ++;
		mart_order.setMart_order_id(mart_order_num);
		dbPro.insertMart_Order(mart_order);
		String[] food_id = request.getParameterValues("food_id");
		String[] qty = request.getParameterValues("qty");
		if(food_id != null)
			for(int i=0; i<food_id.length; i++){
				Food_numDataBean food_num = new Food_numDataBean();
				food_num.setFood_id(Integer.parseInt(food_id[i]));
				food_num.setQty(Integer.parseInt(qty[i]));
				food_num.setDiv("offline");
				food_num.setOrder_id(mart_order_num);
				dbPro.insertFood_num(food_num);
			}
		
		return product_orderForm();
	}
}
