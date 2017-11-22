package controller;

import java.io.FileNotFoundException;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMainDBBean;
import dao.MybatisWritepageDBBean;
import model.FeedDataBean;
import model.R_memberDataBean;

@Controller
public class WritepageController {
	ModelAndView mv = new ModelAndView();
	R_memberDataBean r_member;
	@Autowired
	MybatisWritepageDBBean dbPro;

	@ModelAttribute
	public void addAttributes(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			r_member = (R_memberDataBean) request.getSession().getAttribute(
					"memberInfo");
		} catch (UnsupportedEncodingException el) {
			el.printStackTrace();
		}
	}

	@RequestMapping(value = "writeForm")
	public ModelAndView writeForm() {

		mv.clear();

		mv.setViewName("writepage/writeForm");
		return mv;
	}

	@RequestMapping(value = "editorsearch")
	public ModelAndView editorsearch() {

		mv.clear();

		mv.setViewName("local/editorsearch");
		return mv;
	}

	@RequestMapping(value = "writePro")
	public ModelAndView writePro(MultipartHttpServletRequest multipart,
			FeedDataBean feed) throws FileNotFoundException, IOException {
		List<MultipartFile> multi = null;

		multi = (List<MultipartFile>) multipart.getFiles("img_name");

		for (int i = multi.size() - 1; i > -1; i--) {
			String filename = multi.get(i).getOriginalFilename();
			if (filename != null && !filename.equals("")) {
				String uploadPath = multipart.getRealPath("/") + "fileSave";
				System.out.println(uploadPath);

				FileCopyUtils.copy(multi.get(i).getInputStream(),
						new FileOutputStream(uploadPath + "/"
								+ multi.get(i).getOriginalFilename()));

				feed.getImg_name().set(i, filename);

			} else {
				feed.getImg_name().remove(i);
				feed.getContent().remove(i);
			}
		}
		Collections.reverse(feed.getImg_name());
		Collections.reverse(feed.getContent());
		System.out.println(feed.getRecipe_name());
		if (r_member.getGrade().equals("nomal"))
			dbPro.insertNFeed(feed, r_member.getId());
		else

			/*
			 * String filename = multi.getOriginalFilename(); if(filename !=
			 * null && !filename.equals("")){ String uploadPath =
			 * multipart.getRealPath("/") + "fileSave";
			 * System.out.println(uploadPath);
			 * FileCopyUtils.copy(multi.getInputStream(), new
			 * FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
			 * member.setProfileImg(filename);; }else{ member.setProfileImg("");
			 * }
			 * 
			 * dbPro.insertMember(member); mv.clear();
			 */
		mv.clear();
		mv.setViewName("main");
		return mv;
	}

}
