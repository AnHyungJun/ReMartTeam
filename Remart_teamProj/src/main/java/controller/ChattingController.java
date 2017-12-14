package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.R_memberDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisChatDBBean;

@Controller
public class ChattingController {

	ModelAndView mv = new ModelAndView();
	
	R_memberDataBean member;
	
	@Autowired
	MybatisChatDBBean dbPro;
	
	@ModelAttribute
	public void addAttributes(HttpServletRequest request, HttpSession session) {
		try {
	         request.setCharacterEncoding("utf-8");
	         member = (R_memberDataBean) request.getSession().getAttribute("memberInfo");
	      }catch(UnsupportedEncodingException el) {
	         el.printStackTrace();
	      }
		mv.clear();
		mv.addObject("member",member);
		session.setAttribute("curPage", "chatting");
	}
	
	@RequestMapping(value="chat")
	public ModelAndView chat(HttpSession session) throws Exception {	
		mv.clear();
		
		System.out.println("chatting start:");
		
		if(session.getAttribute("memberInfo") == null){
			mv.setViewName("login/loginForm");
			session.setAttribute("prevPage", "/Remart_teamProj/chatting/chat");
	   }
	   else{
		   String id = member.getId();
		   
		   String content = dbPro.getChatMessage(id);
		   
		   mv.addObject("id",id);
		   mv.addObject("content",content);
		   mv.setViewName("chatting/chat");
	   }
		return mv;
	}
}
