package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.FeedDataBean;
import model.R_memberDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;
import dao.MybatisMypageDBBean;

@Controller
public class MypageController {
	ModelAndView mv = new ModelAndView();
	String id;//파라 미터로 받은 아이디 세션에 올라간 아이디랑 같으면 내 정보 아니면 다른 정보
	R_memberDataBean member;
	@Autowired
	MybatisMypageDBBean dbPro;
	@ModelAttribute
	public void addAttributes(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			id = request.getParameter("id");
			member = (R_memberDataBean) request.getSession().getAttribute(
					"memberInfo");
			mv.clear();
			//서연아 여기가 사람 정보 불러 오는거 북마트 팔로우 이런거 다 공통으로 불러 오는거 
			// 같으면 checkpage 0 다르면 1 
			if(id.equals(member.getId())){
				mv.addObject("checkpage",0);
				member=dbPro.selectMember(member.getId());	
			}else{
				mv.addObject("checkpage",1);
				member=dbPro.selectMember(id);
			}
			mv.addObject("member",member);
		} catch (UnsupportedEncodingException el) {
			el.printStackTrace();
		}
	}
	@RequestMapping(value="myPageForm")
	public ModelAndView myPageForm(HttpSession session){
		List<FeedDataBean> feedlist=null;
		feedlist=dbPro.getFeedList(member.getId());
		for(int i=0;i<feedlist.get(18).getContent().size();i++){
			System.out.println(feedlist.get(18).getContent().get(i));
		}
		mv.addObject("feedlist",feedlist);
		mv.setViewName("mypage/myPageForm");
		
		return mv;
	}

	@RequestMapping(value="bookmarkForm")
	public ModelAndView bookmarkForm(){
		mv.clear();
		mv.setViewName("mypage/bookmarkForm");
		return mv;
	}
	@RequestMapping(value="updateForm")
	public ModelAndView updateForm(){
		mv.clear();
		mv.setViewName("mypage/updateForm");
		return mv;
	}
	@RequestMapping(value="likeForm")
	public ModelAndView likeForm(){
		mv.clear();
		mv.setViewName("mypage/likeForm");
		return mv;
	}
}
