package controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.FeedDataBean;
import model.Likely_bookmarkDataBean;
import model.R_memberDataBean;
import model.Restaurant_recommandDataBean;
import model.Star_contentDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	int pageNum = 1;
	
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
		System.out.println(feeds.toString());
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
		if (action.equals("like"))
			dbPro.like(id, feed_id,"L");
		if (action.equals("bookmark"))
			dbPro.like(id, feed_id,"B");
		if (action.equals("unlike"))
			dbPro.unlike(id, feed_id,"L");
		if (action.equals("unbookmark"))
			dbPro.unlike(id, feed_id,"B");

		mv.clear();
		mv.addObject("action",action);
		//mv.addObject("feed_id", feed_id);
		// mv.addObject(attributeValue)
		mv.setViewName("local/like");
		return mv;
	}
		@RequestMapping(value = "getFeed")
		public ModelAndView getFeed(int index,String id) throws UnsupportedEncodingException {
			int start = 6 + (6 * index);
			int end = 11 + (6 * index);
			System.out.println(start + "/" + end);
			List<FeedDataBean> feeds = dbPro.getFeeds(id);
			mv.clear();
			if (feeds.size() < start) {
				// System.out.println("feeds.size() < start");
				// System.out.println("�����Ͱ� �����ϴ�.");
				mv.addObject("dataEmpty", true);
			} else if (feeds.size() > start && feeds.size() < end) {
				// System.out.println("feeds.size() > start && feeds.size() < end");
				// System.out.println("start=" + start + ",end=" + feeds.size());
				mv.addObject("start", start);
				mv.addObject("end", feeds.size());
			} else {
				// System.out.println("else");
				// System.out.println("start=" + start + ",end=" + end);
				mv.addObject("start", start);
				mv.addObject("end", end);

			}
			mv.addObject("Feeds", feeds);
			mv.setViewName("local/feed");
			return mv;
		
		}
	@RequestMapping(value = "popup2")
	public ModelAndView popup2(int feed_id, String id)
			throws UnsupportedEncodingException {
		mv.clear();
		FeedDataBean feed = null;
		
		if (id.equals("id_not_exist"))
			feed = dbPro.getFeed(feed_id);
		else
			feed = dbPro.getFeed(feed_id, id);
		System.out.println(feed.toString());
		mv.addObject("feed", feed);
		mv.addObject("id", id);
		mv.setViewName("local/popup2");
		
		return mv;
	}
	@RequestMapping(value = "searchForm")
	public ModelAndView searchForm(String please,String please2, String autocompleteText, String autocompleteText2, HttpSession session) {
		System.out.println(please);
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
	
	@RequestMapping(value = "coding")
	public ModelAndView coding(Model model) {
		mv.clear();
		mv.setViewName("main/coding");
		return mv;
	}

	@RequestMapping(value = "insertBoard", method = RequestMethod.POST)
	public ModelAndView insertBoard(Restaurant_recommandDataBean restaurant_recommand, Star_contentDataBean starcontent) {
		starcontent.setId(id);
		restaurant_recommand.setId(id);
		dbPro.insertRestaurant_recommand(restaurant_recommand,starcontent);
		
		mv.clear();
		mv.setViewName("main/coding");
		return mv;
	}
	
	
	@RequestMapping(value = "file_uploader_html5", method = RequestMethod.POST)
	@ResponseBody
	public String multiplePhotoUpload(HttpServletRequest request) {
		StringBuffer sb = new StringBuffer();
		try {
			String oldName = request.getHeader("file-name");
			String filePath = request.getRealPath("/") + "resources/photoUpload/";
			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
								.append(UUID.randomUUID().toString())
								.append(oldName.substring(oldName.lastIndexOf("."))).toString();
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(filePath + saveName);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			sb = new StringBuffer();
			sb.append("&bNewLine=true")
			  .append("&sFileName=").append(oldName)
			  .append("&sFileURL=").append(request.getContextPath()+"/resources/photoUpload/").append(saveName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	@RequestMapping(value="list")
	public ModelAndView list(String editorid) throws Exception{	
		
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List articleList = null;

		count = dbPro.getArticleCount();
		if (count > 0) {
			articleList = dbPro.getArticles(startRow, endRow,editorid);
		}
		number = count - (currentPage - 1) * pageSize;
		//==================================page	
		int bottomLine = 3;

		int pageCount = count / pageSize
				+ (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 +(currentPage - 1)/bottomLine *bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount) endPage = pageCount;

		mv.clear();
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCount", pageCount);
		mv.addObject("bottomLine", bottomLine);
		//============================		
		mv.addObject("count", count);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pageSize", pageSize);
		mv.addObject("number", number);
		mv.addObject("articleList", articleList);

		mv.setViewName("main/list");
		return mv;
	}
	
	@RequestMapping(value="content")
	public ModelAndView content(int num) throws Exception{	
		Restaurant_recommandDataBean article = dbPro.getRestaurant_recommand(num);
		List starcontentList = dbPro.getStarcontentList(num);

		mv.clear();
		mv.addObject("pageNum", pageNum);
		mv.addObject("article", article); 
		mv.addObject("starcontentList", starcontentList); 

		mv.setViewName("main/content");
		return mv;
	}
	
	@RequestMapping(value="restaurant_recommandForm")
	public ModelAndView restaurant_recommandForm() throws Exception{	
		List editorList = dbPro.getEditorList();
		System.out.println(editorList);
		mv.clear();
		mv.addObject("editorList", editorList);
		mv.setViewName("main/restaurant_recommandForm");
		return mv;
	}
	
	@RequestMapping(value="contentPro")
	public ModelAndView contentPro(Star_contentDataBean starcontent, int pageNum, int num) throws Exception{	
		Restaurant_recommandDataBean article = dbPro.getRestaurant_recommand(num);
		
		
		starcontent.setRestaurant_recommand_id(num);
		starcontent.setId(id);
		dbPro.insertStar_content(starcontent);
		
		List starcontentList = dbPro.getStarcontentList(num);
		
		mv.addObject("starcontent", starcontent);
		mv.addObject("pageNum", pageNum);
		mv.addObject("article", article);
		mv.addObject("starcontentList", starcontentList); 
		mv.setViewName("main/content");
		return mv;
	}
}
