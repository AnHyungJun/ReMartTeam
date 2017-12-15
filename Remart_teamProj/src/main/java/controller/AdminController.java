package controller;

import hadoop1207.WebViewer;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FoodDataBean;
import model.R_memberDataBean;

import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisAdminDBBean;

@Controller
public class AdminController {
ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisAdminDBBean dbPro;
	WebViewer wv =new WebViewer();
	@ModelAttribute
	   public void addAttributes(HttpServletRequest request, HttpSession session) {
	      
	      session.setAttribute("curPage", "n");
	   }
	
	@RequestMapping(value="main")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("admin/main");
		return mv;
	}
	@RequestMapping(value="customForm")
	public ModelAndView customForm(HttpServletRequest request) throws Exception{	
		String searchOption = request.getParameter("searchOption");
		String searchWord = request.getParameter("searchWord");
		System.out.println("searchOption : " + searchOption);
		System.out.println("searchWord : " + searchWord);
		
		List articleMember = null;
		articleMember = dbPro.getMember();
		
		List articleFindMember = null;
		if(searchWord != null) {
			articleFindMember = dbPro.findMember(searchOption, searchWord);
			System.out.println("*articleFindMember : " + articleFindMember);
		}
		
		mv.clear();
		mv.addObject("articleMember", articleMember);
		mv.addObject("articleFindMember", articleFindMember);
		mv.setViewName("admin/customForm");
		return mv;
	}
	
	@RequestMapping(value="customPro")
	public ModelAndView customPro(HttpServletRequest request) throws Exception{	
		System.out.println("aaa");
		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		System.out.println(grade);
		String chagnegrade = "";
		if(grade.equals("nomal")) {
			System.out.println("bbb");
			chagnegrade = "editor";
			dbPro.chageGrade(chagnegrade, id);
		}else if(grade.equals("editor")) {
			System.out.println("bbb");
			chagnegrade = "nomal";
			dbPro.chageGrade(chagnegrade, id);
		}
	
		mv.clear();
		return customForm(request);
	}
	
	@RequestMapping(value="customInfo")
	public ModelAndView customInfo(String id){	
		System.out.println("customInfo start");
		System.out.println("id : " + id);
		
		List articleCustomInfo = null;
		articleCustomInfo = dbPro.getCustomInfo(id);
		System.out.println("articleCustomInfo : " + articleCustomInfo);
		
		mv.clear();
		mv.addObject("articleCustomInfo", articleCustomInfo);
		mv.setViewName("local/customInfo");
		return mv;
	}
	@RequestMapping(value="productForm")
	public ModelAndView productForm(){	

		String foods = null;
		List foodlist = dbPro.foodlist(foods);

		List allfoodlist = dbPro.allfoodlist();
		mv.clear();
		mv.addObject("foodlist", foodlist);
		mv.addObject("allfoodlist", allfoodlist);
		mv.setViewName("admin/productForm");
		return mv;
	}
	@RequestMapping(value="foodsearchPro")
	public ModelAndView foodsearchPro(String foods) {
		List foodlist = dbPro.foodlist(foods);
		
		mv.clear();
		mv.addObject("foodlist", foodlist);
		mv.setViewName("admin/productForm");
		return mv;
	}
	
	@RequestMapping(value="productWrite")
	public ModelAndView productWrite(){	
		mv.clear();
		mv.setViewName("local/productWrite");
		return mv;
	}
	
	@RequestMapping(value="productWritePro")
	public ModelAndView productWritePro(MultipartHttpServletRequest multipart,FoodDataBean foodDataBean) throws FileNotFoundException, IOException {
		MultipartFile multi = multipart.getFile("uploadfile");
		String filename = multi.getOriginalFilename();
		if(filename != null && !filename.equals("")){
			String uploadPath = multipart.getRealPath("/") + "fileSave";
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"\\"+multi.getOriginalFilename()));
			foodDataBean.setType(filename);;
		}else{
			foodDataBean.setType("");
		}
		System.out.println(foodDataBean + ":" + foodDataBean.getType());
		dbPro.insertFood(foodDataBean);
		mv.clear();
		mv.setViewName("local/productWrite");
		return mv;
	}
	@RequestMapping(value="foodUpdatePro")
	public ModelAndView foodUpdatePro(int food_id, int qty, int price){	
		FoodDataBean food = new FoodDataBean();
		food.setFood_id(food_id);
		food.setQty(qty);
		food.setPrice(price);
		
		dbPro.updateFood(food);
		
		return productForm();
	}
	@RequestMapping(value = "orderStatusForm")
	public ModelAndView orderStatusForm() {
		List orderList = null;
		List payList = null;
		orderList = dbPro.getOrderList();
		payList = dbPro.getPayList();
		mv.clear();
		mv.addObject("orderList", orderList);
		mv.addObject("payList", payList);
		mv.setViewName("admin/orderStatusForm");
		return mv;
	}

	@RequestMapping(value = "stchange")
	public ModelAndView stchange(int id, String status, String type) {
		if (type.equals("order"))
			dbPro.change(id, status);
		else if(type.equals("pay"))
			dbPro.change2(id, status);
		mv.clear();
		mv.setViewName("admin/orderStatusForm");
		return mv;
	}
	@RequestMapping(value="salesStatusForm")
	public ModelAndView salesStatusForm(HttpServletRequest request,
			HttpServletResponse response) throws Throwable{	
	

	      mv.clear();
	      String type=request.getParameter("type");
	      System.out.println(type);
	      if(type==null) type="t";
	      
	      
	      if(type.equals("t")){
	         
	         RConnection c = new RConnection();
	         
	         String path = request.getRealPath("/")+ "viewImg\\";
	      List<String> li = wv.toList("/ch01/Arr/part-r-00000");
	      PrintStream ps = null;
	      FileOutputStream fos = null;
	      fos = new FileOutputStream("C:/r_temp/tmp.csv");
	      ps = new PrintStream(fos);
	      Iterator it = li.iterator();
	         while(it.hasNext()) {
	            String line = (String) it.next();
	            line = line.replace(",", "-");
	            line = line.replace("\t", ",");
	            ps.print(line + "\r\n");
	         }
	         ps.flush();
	         ps.close();
	         path = path.replace("\\", "/");
	         c.parseAndEval("setwd('c:/r_temp')");
	         c.parseAndEval("library(KoNLP)");
	         c.parseAndEval("library(ggplot2)");
	         c.parseAndEval("data2 = read.csv('tmp.csv', header=F)");
	         c.parseAndEval(" month=data2[,1]");
	         c.parseAndEval("price=data2[,2]");
	         c.parseAndEval(" pp=ggplot(data2, aes(x=month, y=price,group =1))+geom_line(lwd=1,aes(color=5))+geom_point(size=3,shape=19,aes(color=1))+ggtitle(\"월별 매출현황\")");
	         c.parseAndEval("png(\"" + path + "p.png\", width=1300,    height=550,     pointsize=13 )");
	         c.parseAndEval("plot(pp)"); 
	         c.parseAndEval("dev.off()");
	         c.close();
	      }else if(type.equals("sex")){
	         RConnection c = new RConnection();
	         
	         String path = request.getRealPath("/")+ "viewImg\\";
	         List<String> li = wv.toList("/ch01/Member/part-r-00000");
	         PrintStream ps = null;
	         PrintStream ps2 = null;
	         FileOutputStream fos = null;
	         FileOutputStream fos2 = null;
	         fos = new FileOutputStream("C:/r_temp/membersex.csv");
	         
	         ps = new PrintStream(fos);
	      
	      
	         Iterator it = li.iterator();
	         while(it.hasNext()) {
	            String line = (String) it.next();
	            line = line.replace("\t", ",");   
	            ps.print(line + "\r\n");
	            
	         }
	      
	         ps.flush();
	         ps.close();
	         path = path.replace("\\", "/");
	         c.parseAndEval("setwd('c:/r_temp')");
	         c.parseAndEval("library(KoNLP)");
	         c.parseAndEval("library(ggplot2)");
	         c.parseAndEval("data2 = read.csv('membersex.csv', header=F,fileEncoding=\"UTF-8\")");
	         c.parseAndEval("sex=data2[,1]");
	         c.parseAndEval("num=data2[,2]");
	         c.parseAndEval("group = c(\"M\", \"F\")");
	         c.parseAndEval("bp<-ggplot(data2, aes(x=\"\", y=num, fill=group))+ geom_bar(width = 1, stat = \"identity\") + coord_polar(\"y\", start=0)+ggtitle(\"남녀성비\")");
	         c.parseAndEval("png(\"" + path + "p.png\", width=1300,    height=550,     pointsize=13 )");
	         c.parseAndEval("plot(bp)"); 
	         c.parseAndEval("dev.off()");
	         c.close();
	         }else{
	            mv.addObject("tt", 1);
	            RConnection c = new RConnection();
	         
	         String path = request.getRealPath("/")+ "viewImg\\";
	   /*      List<String> li = wv.toList("/ch01/Foodlowhigh1/part-r-00000");
	         PrintStream ps = null;
	         PrintStream ps2 = null;
	         FileOutputStream fos = null;
	         FileOutputStream fos2 = null;
	         fos = new FileOutputStream("C:/r_temp/foodhigh.csv");
	         fos2 = new FileOutputStream("C:/r_temp/foodlow.csv");
	         ps = new PrintStream(fos);
	         ps2 = new PrintStream(fos2);
	         li.sort(new Comparator<String>() {

	         @Override
	         public int compare(String o1, String o2) {
	            // TODO Auto-generated method stub
	            
	            String t1 = o1.substring(o1.lastIndexOf("\t") + 1, o1.length());
	            String t2 = o2.substring(o2.lastIndexOf("\t") + 1, o2.length());
	            if (t1.length() == 1)
	               t1 = "0" + t1;
	            if (t2.length() == 1)
	               t2 = "0" + t2;
	            return t1.compareTo(t2);
	         }
	      });
	      for(int i=li.size()-6;i>4;i--){
	         li.remove(i);
	      }
	      int cnt=0;
	      Iterator it = li.iterator();
	         while(it.hasNext()) {
	            
	            String line = (String) it.next();
	           
	            line = line.replace(",", " ");
	            line = line.replace("\t", ",");
	            if(cnt<5)
	               ps.print(line + "\r\n");
	            else
	               ps2.print(line + "\r\n");
	            cnt++;
	         }
	         ps2.flush();
	         ps2.close();
	         ps.flush();
	         ps.close();*/
	         path = path.replace("\\", "/");
	         c.parseAndEval("setwd('c:/r_temp')");
	         c.parseAndEval("library(KoNLP)");
	         c.parseAndEval("library(ggplot2)");
	         c.parseAndEval("data2 = read.csv('foodhigh.csv', header=F,fileEncoding=\"UTF-8\")");
	         c.parseAndEval(" food=data2[,1]");
	         c.parseAndEval("qty=data2[,2]");
	         c.parseAndEval("pp=ggplot(data=data2, aes(x=food, y=qty)) + geom_bar(stat='identity') +ggtitle(\"최저 판매 품목\")");
	         c.parseAndEval("png(\"" + path + "p.png\", width=1300,    height=550,     pointsize=13 )");
	         c.parseAndEval("plot(pp)"); 
	         c.parseAndEval("dev.off()");
	         
	         c.parseAndEval("data2 = read.csv('foodlow.csv', header=F,fileEncoding=\"UTF-8\")");
	         c.parseAndEval(" food=data2[,1]");
	         c.parseAndEval("qty=data2[,2]");
	         c.parseAndEval("pp=ggplot(data=data2, aes(x=food, y=qty)) + geom_bar(stat='identity') +ggtitle(\"최고 판매 품목\")");
	         c.parseAndEval("png(\"" + path + "k.png\", width=1300,    height=550,     pointsize=13 )");
	         c.parseAndEval("plot(pp)"); 
	         c.parseAndEval("dev.off()");
	         
	         c.close();
	      }
	      
	      
	      mv.setViewName("admin/salesStatusForm");
	      return mv;
	}
	
	/*@RequestMapping(value="makefile")
	public ModelAndView makefile(HttpServletRequest request,
			HttpServletResponse response) throws Throwable{	
		request.setCharacterEncoding("utf-8");
		
		String createfile="c:\\r_temp\\member.csv";
		FileWriter fw = new FileWriter(createfile);
		List<R_memberDataBean> list=dbPro.month();
		for(int i=0;i<list.size();i++){
			
			fw.append(""+list.get(i).getSex());
			fw.append('\n');
		}
		
		fw.flush();
		fw.close();
		
		mv.clear();
		mv.setViewName("admin/salesStatusForm");
		return mv;
	}*/
}
