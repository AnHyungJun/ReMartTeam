package controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.FoodDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	public ModelAndView customForm(HttpServletRequest request) throws Exception{	
		String searchOption = request.getParameter("searchOption");
		String searchWord = request.getParameter("searchWord");
		System.out.println("searchOption : " + searchOption);
		System.out.println("searchWord : " + searchWord);
		
		List articleMember = null;
		articleMember = dbPro.getMember();
		
		List articleFindMember = null;
		if(searchWord != null) {
			articleFindMember = dbPro.findMember(searchOption, searchWord);
			System.out.println("*articleFindMember : " + articleFindMember);
		}
		
		mv.clear();
		mv.addObject("articleMember", articleMember);
		mv.addObject("articleFindMember", articleFindMember);
		mv.setViewName("admin/customForm");
		return mv;
	}
	
	@RequestMapping(value="customPro")
	public ModelAndView customPro(HttpServletRequest request) throws Exception{	
		System.out.println("aaa");
		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		System.out.println(grade);
		String chagnegrade = "";
		if(grade.equals("nomal")) {
			System.out.println("bbb");
			chagnegrade = "editor";
			dbPro.chageGrade(chagnegrade, id);
		}else if(grade.equals("editor")) {
			System.out.println("bbb");
			chagnegrade = "nomal";
			dbPro.chageGrade(chagnegrade, id);
		}
	
		mv.clear();
		return customForm(request);
	}
	
	@RequestMapping(value="customInfo")
	public ModelAndView customInfo(String id){	
		System.out.println("customInfo start");
		System.out.println("id : " + id);
		
		List articleCustomInfo = null;
		articleCustomInfo = dbPro.getCustomInfo(id);
		System.out.println("articleCustomInfo : " + articleCustomInfo);
		
		mv.clear();
		mv.addObject("articleCustomInfo", articleCustomInfo);
		mv.setViewName("local/customInfo");
		return mv;
	}
	@RequestMapping(value="productForm")
	public ModelAndView productForm(){	

		String foods = null;
		List foodlist = dbPro.foodlist(foods);

		List allfoodlist = dbPro.allfoodlist();
		mv.clear();
		mv.addObject("foodlist", foodlist);
		mv.addObject("allfoodlist", allfoodlist);
		mv.setViewName("admin/productForm");
		return mv;
	}
	@RequestMapping(value="foodsearchPro")
	public ModelAndView foodsearchPro(String foods) {
		List foodlist = dbPro.foodlist(foods);
		
		mv.clear();
		mv.addObject("foodlist", foodlist);
		mv.setViewName("admin/productForm");
		return mv;
	}
	
	@RequestMapping(value="productWrite")
	public ModelAndView productWrite(){	
		mv.clear();
		mv.setViewName("local/productWrite");
		return mv;
	}
	
	@RequestMapping(value="productWritePro")
	public ModelAndView productWritePro(MultipartHttpServletRequest multipart,FoodDataBean foodDataBean) throws FileNotFoundException, IOException {
		MultipartFile multi = multipart.getFile("uploadfile");
		String filename = multi.getOriginalFilename();
		if(filename != null && !filename.equals("")){
			String uploadPath = multipart.getRealPath("/") + "fileSave";
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"\\"+multi.getOriginalFilename()));
			foodDataBean.setType(filename);;
		}else{
			foodDataBean.setType("");
		}
		System.out.println(foodDataBean + ":" + foodDataBean.getType());
		dbPro.insertFood(foodDataBean);
		mv.clear();
		mv.setViewName("local/productWrite");
		return mv;
	}
	@RequestMapping(value="foodUpdatePro")
	public ModelAndView foodUpdatePro(int food_id, int qty, int price){	
		FoodDataBean food = new FoodDataBean();
		food.setFood_id(food_id);
		food.setQty(qty);
		food.setPrice(price);
		
		dbPro.updateFood(food);
		
		return productForm();
	}
	@RequestMapping(value = "orderStatusForm")
	public ModelAndView orderStatusForm() {
		List orderList = null;
		List payList = null;
		orderList = dbPro.getOrderList();
		payList = dbPro.getPayList();
		mv.clear();
		mv.addObject("orderList", orderList);
		mv.addObject("payList", payList);
		mv.setViewName("admin/orderStatusForm");
		return mv;
	}

	@RequestMapping(value = "stchange")
	public ModelAndView stchange(int id, String status, String type) {
		if (type.equals("order"))
			dbPro.change(id, status);
		else if(type.equals("pay"))
			dbPro.change2(id, status);
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
