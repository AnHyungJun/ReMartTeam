package controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import model.R_memberDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisLoginDBBean;

@Controller
public class LoginController {
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisLoginDBBean dbPro;
	
	@RequestMapping(value="loginForm")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("login/loginForm");
		return mv;
	}
	
	@RequestMapping(value="joinForm")
	public ModelAndView joinForm(){	
		mv.clear();
		mv.setViewName("login/joinForm");
		return mv;
	}
	
	@RequestMapping(value="forgotForm")
	public ModelAndView forgotForm(){	
		mv.clear();
		mv.setViewName("login/forgotForm");
		return mv;
	}
	@RequestMapping(value="confirmId")
	public ModelAndView confirmId(String id) throws Exception{
		int check = dbPro.comfirmId(id);
		mv.clear();
		mv.addObject("id",id);
		mv.addObject("check",check);
		mv.setViewName("local/confirmId");
		return mv; 
	}
	
	@RequestMapping(value="joinPro")
	public ModelAndView joinPro(MultipartHttpServletRequest multipart, R_memberDataBean member) throws Exception{	
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
		
		dbPro.insertMember(member);
		
		return loginForm();
	}
}
