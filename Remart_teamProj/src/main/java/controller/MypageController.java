package controller;

import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.FeedDataBean;
import model.R_memberDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;
import dao.MybatisMypageDBBean;

@Controller
public class MypageController {
	ModelAndView mv = new ModelAndView();
	String id;//�Ķ� ���ͷ� ���� ���̵� ���ǿ� �ö� ���̵�� ������ �� ���� �ƴϸ� �ٸ� ����
	R_memberDataBean member;

	@Autowired
	MybatisMypageDBBean dbPro;

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, HttpSession session) {

		session.setAttribute("curPage", "n");
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			id = request.getParameter("id");
			member = (R_memberDataBean) request.getSession().getAttribute(
					"memberInfo");
			mv.clear();
			//������ ���Ⱑ ��� ���� �ҷ� ���°� �ϸ�Ʈ �ȷο� �̷��� �� �������� �ҷ� ���°� 
			// ������ checkpage 0 �ٸ��� 1 
			if( member == null){
				mv.addObject("checkpage",1);
				member=dbPro.selectMember(id);
			}else{
				if(id.equals(member.getId())){
					mv.addObject("checkpage",0);
					member=dbPro.selectMember(member.getId());	
				}else{
					mv.addObject("checkpage",1);
					member=dbPro.selectMember(id);
				}
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

		mv.addObject("feedlist",feedlist);
		mv.setViewName("mypage/myPageForm");

		return mv;
	}

	@RequestMapping(value="bookmarkForm")
	public ModelAndView bookmarkForm(){
		List<FeedDataBean> feedlist=null;
		feedlist=dbPro.getBookmarkFeedList(member.getId());

		mv.addObject("feedlist",feedlist);
		mv.setViewName("mypage/myPageForm");

		return mv;
	}

	@RequestMapping(value="pwdcheck")
	public ModelAndView pwdcheck() throws Exception{

		System.out.println("pwdcheck");
		mv.clear();
		mv.setViewName("mypage/pwdcheck");
		return mv;
	}

	@RequestMapping(value="updateForm")
	public ModelAndView updateForm() throws Exception{
		System.out.println("updateForm");

		mv.clear();

		mv.setViewName("mypage/updateForm");
		return mv;
	}

	@RequestMapping(value="updatePro")
	public ModelAndView updatePro(MultipartHttpServletRequest multipart, R_memberDataBean member) throws Exception{
		MultipartFile multi = multipart.getFile("uploadfile");
		String filename = multi.getOriginalFilename();
		if(filename != null && !filename.equals("")){
			String uploadPath = multipart.getRealPath("/") + "fileSave";
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
			member.setProfileImg(filename);;
		}else{
			member.setProfileImg("");
		}

		dbPro.updateMember(member);

		mv.clear();
		mv.setViewName("main/main");
		return mv;
	}

	@RequestMapping(value="likeForm")
	public ModelAndView likeForm(){
		List<FeedDataBean> feedlist=null;
		feedlist=dbPro.getLikeFeedList(member.getId());

		mv.addObject("feedlist",feedlist);
		mv.setViewName("mypage/myPageForm");

		return mv;
	}

	@RequestMapping(value="followForm")
	public ModelAndView followForm(){
		List<FeedDataBean> feedlist=null;
		feedlist=dbPro.getFollowFeedList(member.getId());

		mv.addObject("feedlist",feedlist);
		mv.setViewName("mypage/myPageForm");

		return mv;
	}

	@RequestMapping(value="following")
	public ModelAndView following(){
		mv.clear();
		List searchList = null;
		searchList = dbPro.getFollowingList(id);
		mv.addObject("searchList",searchList);
		mv.addObject("divi",1);
		mv.setViewName("main/userSearchForm");
		return mv;
	}

	@RequestMapping(value="follower")
	public ModelAndView follower(){
		mv.clear();
		List searchList = null;
		searchList = dbPro.getFollowerList(id);
		mv.addObject("searchList",searchList);
		mv.addObject("divi",2);
		mv.setViewName("main/userSearchForm");
		return mv;
	}
}

