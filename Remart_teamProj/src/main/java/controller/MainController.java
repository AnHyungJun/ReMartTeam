package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;


@Controller
public class MainController {
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisMainDBBean dbPro;
	
	@RequestMapping(value="main")
	public ModelAndView main(){	
		mv.clear();
		mv.setViewName("main");
		return mv;
	}
}
