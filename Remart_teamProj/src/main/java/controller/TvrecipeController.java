package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;
import dao.MybatisTvrecipeDBBean;

@Controller
public class TvrecipeController {
	ModelAndView mv = new ModelAndView();

	@Autowired
	MybatisTvrecipeDBBean dbPro;

	@RequestMapping(value="tv")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("tvrecipe/tv");
		return mv;
	}
}
