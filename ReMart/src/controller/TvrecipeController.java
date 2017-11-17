package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TvrecipeController {
ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="tv")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("tvrecipe/tv");
		return mv;
	}
}
