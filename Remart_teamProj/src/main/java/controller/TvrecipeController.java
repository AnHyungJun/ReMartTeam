package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;

@Controller
public class TvrecipeController {
	ModelAndView mv = new ModelAndView();

	@ModelAttribute
	   public void addAttributes(HttpServletRequest request, HttpSession session) {
	      
	      session.setAttribute("curPage", "n");
	   }

	@RequestMapping(value="tvRecipe1")
	public ModelAndView tvRecipe1(){	
		mv.clear();
		mv.setViewName("tvrecipe/tvRecipe1");
		return mv;
	}
	@RequestMapping(value="tvRecipe2")
	public ModelAndView tvRecipe2(){	
		mv.clear();
		mv.setViewName("tvrecipe/tvRecipe2");
		return mv;
	}
	@RequestMapping(value="tvRecipe3")
	public ModelAndView tvRecipe3(){	
		mv.clear();
		mv.setViewName("tvrecipe/tvRecipe3");
		return mv;
	}
}
