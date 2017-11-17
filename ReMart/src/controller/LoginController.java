package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisLoginDBBean;

@Controller
public class LoginController {
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisLoginDBBean dbPro;
	
	@RequestMapping(value="loginForm")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("login/loginForm");
		return mv;
	}
	
	@RequestMapping(value="joinForm")
	public ModelAndView joinForm(){	
		mv.clear();
		mv.setViewName("login/joinForm");
		return mv;
	}
	
	@RequestMapping(value="forgotForm")
	public ModelAndView forgotForm(){	
		mv.clear();
		mv.setViewName("login/forgotForm");
		return mv;
	}
	@RequestMapping(value="confirmId")
	public ModelAndView confirmId(String id) throws Exception{
		System.out.println("호잉" + id);
		System.out.println(dbPro.comfirmId(id));
		int check = dbPro.comfirmId(id);
		mv.clear();
		mv.addObject("check",check);
		mv.setViewName("local/confirmId");
		return mv; 
	}
}
