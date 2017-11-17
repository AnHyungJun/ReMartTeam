package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
ModelAndView mv = new ModelAndView();
	
	@RequestMapping(value="myPageForm")
	public ModelAndView myPageForm(){
		mv.clear();
		mv.setViewName("mypage/myPageForm");
		return mv;
	}
}
