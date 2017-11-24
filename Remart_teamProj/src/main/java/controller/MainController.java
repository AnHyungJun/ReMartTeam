package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.FeedDataBean;
import model.Likely_bookmarkDataBean;
import model.R_memberDataBean;

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

	@RequestMapping(value = "main")
	public ModelAndView main(HttpServletRequest request) {
		List<FeedDataBean> feeds = dbPro.getFeeds();
		try {
			request.setCharacterEncoding("utf-8");
			R_memberDataBean r_member = (R_memberDataBean) request.getSession()
					.getAttribute("memberInfo");
			if(r_member!=null){
			List<Likely_bookmarkDataBean> likeList = dbPro.getLikeList(r_member
					.getId());
			System.out.println(likeList);
			String like=likeList.toString();
			mv.addObject("LikeList", like);}
		} catch (UnsupportedEncodingException el) {
			el.printStackTrace();
		}

		System.out.println(feeds.toString());
		mv.clear();
		mv.addObject("Feeds", feeds);

		mv.setViewName("main/main");
		return mv;
	}

	@RequestMapping(value = "like")
	public ModelAndView like(String like) {
		System.out.println(like);

		mv.clear();
		mv.addObject("like", like);
		mv.setViewName("local/like");
		return mv;
	}

	@RequestMapping(value = "getFeed")
	public ModelAndView getFeed() {
		mv.clear();
		mv.setViewName("local/feed");
		return mv;
	}
}
