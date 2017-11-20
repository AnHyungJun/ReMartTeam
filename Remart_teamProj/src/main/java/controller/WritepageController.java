package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;
import dao.MybatisWritepageDBBean;

@Controller
public class WritepageController {
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisWritepageDBBean dbPro;

	@RequestMapping(value="writeForm")
	public ModelAndView writeForm(){	
		mv.clear();
		mv.setViewName("writepage/writeForm");
		return mv;
	}
}
