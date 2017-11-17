package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TvRecipeController {
ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="tv")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("tvRecipe/tv");
		return mv;
	}
}
