package controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
	public ModelAndView main(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		List<String> userHashList = new ArrayList<String>();
		List<String> foodSearchList = new ArrayList<String>();
		
		
		List a = dbPro.selectUserIdDb();
		List b = dbPro.selectHashDb();
		List c = dbPro.selectFoodNameDb();
		
		for(int i=0; i<a.size(); i++)
			userHashList.add((String) a.get(i));
		for(int i=0; i<b.size(); i++)
			userHashList.add("#"+(String) b.get(i));
		for(int i=0; i<c.size(); i++)
			foodSearchList.add((String) c.get(i));
		
		session.setAttribute("userHashList", userHashList);
		session.setAttribute("foodSearchList", foodSearchList);
		
			request.setCharacterEncoding("utf-8");
			R_memberDataBean r_member = (R_memberDataBean) request.getSession()
					.getAttribute("memberInfo");
			
		List<FeedDataBean> feeds = dbPro.getFeeds(r_member);
		//System.out.println(feeds.toString());
		List<FeedDataBean> todayRecomendFeed = dbPro.getTodayRecomendFeed();
		
		List hashtagCnt = dbPro.getHashtagCnt();
		session.setAttribute("hashtagCnt", hashtagCnt);
		
		List hashtagCnt2 = dbPro.getHashtagCnt2();
		session.setAttribute("hashtagCnt2", hashtagCnt2);
		
		mv.clear();
		mv.addObject("Feeds", feeds);
		mv.addObject("todayRecomendFeed", todayRecomendFeed);
		mv.setViewName("main/main");
		return mv;
	}

	@RequestMapping(value = "like")
	public ModelAndView like(HttpServletRequest request, int feed_id,
			String action) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		R_memberDataBean r_member = (R_memberDataBean) request.getSession()
				.getAttribute("memberInfo");
		String id = r_member.getId();
		System.out.println("====");
		System.out.println(action);
		if (action.equals("like"))
			dbPro.like(id, feed_id,"LIKE");
		if (action.equals("bookmark"))
			dbPro.like(id, feed_id,"BOOKMARK");
		if (action.equals("unlike"))
			dbPro.unlike(id, feed_id,"LIKE");
		if (action.equals("unbookmark"))
			dbPro.unlike(id, feed_id,"BOOKMARK");

		mv.clear();
		mv.addObject("action",action);
		mv.addObject("feed_id", feed_id);
		// mv.addObject(attributeValue)
		mv.setViewName("local/like");
		return mv;
	}

	@RequestMapping(value = "getFeed")
	public ModelAndView getFeed(int index,String id) throws UnsupportedEncodingException {
		System.out.println(index);
		System.out.println(id);
		List<FeedDataBean> feeds = dbPro.getFeeds(id);
		System.out.println(feeds.toString());
		mv.clear();
		mv.addObject("index",index);
		mv.addObject("Feeds",feeds);
		mv.setViewName("local/feed");
		return mv;
	}
	@RequestMapping(value = "popup2")
	public ModelAndView popup2(int feed_id, String id)
			throws UnsupportedEncodingException {
		mv.clear();
		FeedDataBean feed = null;
		
		if (id.equals(""))
			feed = dbPro.getFeed(feed_id);
		else
			feed = dbPro.getFeed(feed_id, id);
		mv.addObject("feed", feed);
		mv.addObject("id", id);
		mv.setViewName("local/popup2");
		
		return mv;
	}
	@RequestMapping(value = "searchForm")
	public ModelAndView searchForm(String please,String please2, String autocompleteText, String autocompleteText2, HttpSession session) {
		mv.clear();
		List searchList = null;
		if(please2==null) please2="";
		if(please2 != "" ){ 
			please2 = please2.replace(" ", "");
			searchList = dbPro.getFoodSearchList(please2);
			session.setAttribute("curPage", "shopping");
			mv.setViewName("main/foodSearchForm");
		}else{
			
			if(please.contains("#")){ 
				please = please.replace("#", "");
				please = please.replace(" ", "");
				searchList = dbPro.getFeedSearchList(please);
				int hashcnt = dbPro.getHashtagKeyCount(please);
				mv.addObject("hashcnt",hashcnt);
				mv.setViewName("main/feedSearchForm");
			}else{ 
				please = please.replace(" ", "");
				if(memberInfo == null) 
					searchList = dbPro.getUserSearchList(please);
				else 
					searchList = dbPro.getUserSearchListWithFollow(please,id );
				mv.setViewName("main/userSearchForm");
			}
		}
		mv.addObject("divi",0);
		mv.addObject("searchList",searchList);
		return mv;
	}
	@RequestMapping(value = "editorRecommandForm")
	public ModelAndView editorRecommandForm() {
		List<FeedDataBean> feedlist=null;
		mv.clear();
		feedlist = dbPro.getEditorFeed();
		mv.addObject("feedlist",feedlist);
		mv.setViewName("main/editorRecommandForm");
		return mv;
	}
}
