package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="main")
	public ModelAndView main(){	
		mv.clear();
		mv.setViewName("main");
		return mv;
	}
}
