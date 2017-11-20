package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;
import dao.MybatisShoppingDBBean;

@Controller
public class ShoppingController {
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisShoppingDBBean dbPro;

	@RequestMapping(value="shoppingMain")
	public ModelAndView shoppingMain(){	
		mv.clear();
		mv.setViewName("shopping/shoppingMain");
		return mv;
	}

	@RequestMapping(value="basket")
	public ModelAndView basket(){	
		mv.clear();
		mv.setViewName("shopping/basket");
		return mv;
	}

	@RequestMapping(value="paymentInfo")
	public ModelAndView paymentInfo(){	
		mv.clear();
		mv.setViewName("shopping/paymentInfo");
		return mv;
	}
}
