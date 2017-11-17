package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="loginForm")
	public ModelAndView main(){	
		System.out.println("??");
		mv.clear();
		mv.setViewName("login/loginForm");
		return mv;
	}
	
}
