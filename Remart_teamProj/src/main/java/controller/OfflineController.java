package controller;

import javax.servlet.http.HttpSession;

import model.R_memberDataBean;

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
		dbPro.offlineLoginCheck(id, passwd);
		mv.clear();
		return mv;
	}
}
