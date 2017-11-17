package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WritepageController {
ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="writeForm")
	public ModelAndView writeForm(){	
		mv.clear();
		mv.setViewName("writepage/writeForm");
		return mv;
	}
}
