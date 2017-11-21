package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;
import dao.MybatisWritepageDBBean;
import model.R_memberDataBean;

@Controller
public class WritepageController {
	ModelAndView mv = new ModelAndView();
	String reqcategory_id;
	@Autowired
	MybatisWritepageDBBean dbPro;

	@ModelAttribute
	public void addAttributes(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException el) {
			el.printStackTrace();
		}
		System.out.println(request.getParameter("grade"));
		
	
	}

	@RequestMapping(value = "writeForm")
	public ModelAndView writeForm() {
		
		mv.clear();

		mv.setViewName("writepage/writeForm");
		return mv;
	}
}
