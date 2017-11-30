package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.FeedDataBean;
import model.Likely_bookmarkDataBean;
import model.R_memberDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;

@Controller
public class MainController {
	ModelAndView mv = new ModelAndView();

	@Autowired
	MybatisMainDBBean dbPro;
	String curPage;
	R_memberDataBean memberInfo;
	String id;
	
	@ModelAttribute
	   public void addAttributes(HttpServletRequest request, HttpSession session) {
	      
	      session.setAttribute("curPage", "n");
	      
	      memberInfo = (R_memberDataBean) session.getAttribute("memberInfo");
	      if(memberInfo != null) id = memberInfo.getId();
	   }

	@RequestMapping(value = "main")
	public ModelAndView main(HttpServletRequest request) throws UnsupportedEncodingException {
	
			request.setCharacterEncoding("utf-8");
			R_memberDataBean r_member = (R_memberDataBean) request.getSession()
					.getAttribute("memberInfo");
			
		List<FeedDataBean> feeds = dbPro.getFeeds(r_member);
		System.out.println("�ٲ������Ʈ�ѷ�");
		System.out.println(feeds.toString());
		mv.clear();
		mv.addObject("Feeds", feeds);

		mv.setViewName("main/main");
		return mv;
	}

	@RequestMapping(value = "like")
	public ModelAndView like(String like) {
		System.out.println("ff");

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
	@RequestMapping(value = "searchForm")
	public ModelAndView searchForm(String autocompleteText, String autocompleteText2) {
		mv.clear();
		List searchList = null;
		if(autocompleteText2 != null){ //쇼핑서치
			searchList = dbPro.getFoodSearchList(autocompleteText2);
			mv.setViewName("main/foodSearchForm");
		}else{
			
			if(autocompleteText.contains("#")){ // 글 서치
				autocompleteText = autocompleteText.replace("#", "");
				searchList = dbPro.getFeedSearchList(autocompleteText);
				mv.setViewName("main/feedSearchForm");
			}else{ //사용자 서치
				
				if(memberInfo == null) //로그인 안했을때
					searchList = dbPro.getUserSearchList(autocompleteText);
				else //로그인 했을때
					searchList = dbPro.getUserSearchListWithFollow(autocompleteText,id );
				mv.setViewName("main/userSearchForm");
			}
		}
		mv.addObject("searchList",searchList);
		return mv;
	}
}
