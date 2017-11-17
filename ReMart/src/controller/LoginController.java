package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	ModelAndView mv = new ModelAndView();
	
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
	
}
