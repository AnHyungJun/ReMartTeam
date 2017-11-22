package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OfflineController {
	ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="offline_loginForm")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("offline/offline_loginForm");
		return mv;
	}
}
