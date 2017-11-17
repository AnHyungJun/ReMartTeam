package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="myPageForm")
	public ModelAndView myPageForm(){	
		System.out.println("Dd");
		mv.clear();
		mv.setViewName("myPage/myPageForm");
		return mv;
	}
}
