package controller;

import hadoop1207.WebViewer;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Food_numDataBean;
import model.Mart_orderDataBean;
import model.Offline_martDataBean;
import model.ProductDataBean;
import model.R_memberDataBean;
import model.SaleDataBean;
import model.StaffDataBean;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisLoginDBBean;
import dao.MybatisOfflineDBBean;

@Controller
public class OfflineController {
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisOfflineDBBean dbPro;
	
	Offline_martDataBean offlineInfo;
	String offline_mart_id;
	StaffDataBean staffInfo;
	String staff_id;
	
	@ModelAttribute
	public void addAttributes(HttpServletRequest request, HttpSession session){
		try{
			request.setCharacterEncoding("utf-8");
		}catch(UnsupportedEncodingException e1){
			e1.printStackTrace();
		}
		 offlineInfo = (Offline_martDataBean)(session.getAttribute("offlineInfo"));
		 if(offlineInfo != null)
			 offline_mart_id = offlineInfo.getOffline_mart_id();
		
		 staffInfo = (StaffDataBean)(session.getAttribute("staffInfo"));
		 if(staffInfo != null)
		 staff_id = staffInfo.getStaff_id();
		 
		 session.setAttribute("curPage", "n");
	}
	
	@RequestMapping(value="offline_loginForm")
	public ModelAndView loginForm(){	
		mv.clear();
		mv.setViewName("offline/offline_loginForm");
		return mv;
	}
	
	@RequestMapping(value="offline_loginPro")
	public ModelAndView loginPro(String id, String passwd, HttpSession session){	
		int check = dbPro.offlineLoginCheck(id, passwd);
		int check2 = dbPro.staffLoginCheck(id, passwd);
		mv.clear();
		mv.addObject("check",check);
		mv.addObject("check2",check2);
		if(check == 1){
			mv.setViewName("offline/offline_loginPro");
			Offline_martDataBean offlineInfo = dbPro.getOfflineInfo(id);
			session.setAttribute("offlineInfo", offlineInfo);
			return mv;
		}else if(check2 == 1){
			mv.setViewName("offline/staff_loginPro");
			StaffDataBean staffInfo = dbPro.getStaffInfo(id);
			session.setAttribute("staffInfo", staffInfo);
			return mv;
		}else{
			mv.setViewName("offline/offline_loginPro");
			return mv;
		}
	}
	
	@RequestMapping(value="product_orderForm")
	public ModelAndView product_orderForm(){	
		mv.clear();
		mv.setViewName("offline/product_orderForm");
		return mv;
	}
	
	@RequestMapping(value="saleForm")
	public ModelAndView saleForm(){	
		mv.clear();
		mv.setViewName("offline/saleForm");
		return mv;
	}
	
	@RequestMapping(value="loginOut")
	public ModelAndView loginOut(HttpSession session){	
		session.invalidate();

		return loginForm();
	}
	
	@RequestMapping(value="offlineSearch")
	public ModelAndView offlineSearch(){
		mv.clear();
		mv.setViewName("local/suggestclientSearch");
		return mv;
	}
	@RequestMapping(value="product_orderPro")
	public ModelAndView product_orderPro(Mart_orderDataBean mart_order, String or_date_before,HttpServletRequest request){
		mart_order.setOr_date(Timestamp.valueOf(or_date_before+" 00:00:00"));
		mart_order.setStatus("order");
		int mart_order_num = dbPro.getMart_order_num();
		mart_order_num ++;
		mart_order.setMart_order_id(mart_order_num);
		dbPro.insertMart_Order(mart_order);
		String[] food_id = request.getParameterValues("food_id");
		String[] qty = request.getParameterValues("qty");
		if(food_id != null)
			for(int i=0; i<food_id.length; i++){
				Food_numDataBean food_num = new Food_numDataBean();
				food_num.setFood_id(Integer.parseInt(food_id[i]));
				food_num.setQty(Integer.parseInt(qty[i]));
				food_num.setDiv("offline");
				food_num.setOrder_id(mart_order_num);
				dbPro.insertFood_num(food_num);
			}
		
		return product_orderForm();
	}
	
	@RequestMapping(value="order_status")
	public ModelAndView order_status( String date1,String date2){
		
		mv.clear();

		List mart_orderList = null;
		if(date1 == null)
			mart_orderList = dbPro.getMart_orders(offline_mart_id);
		else{
			mart_orderList = dbPro.getMart_ordersDate(offline_mart_id,date1,date2);
		}
		mv.addObject("mart_orderList",mart_orderList);
		mv.setViewName("offline/order_statusForm");
		return mv;
	}
	@RequestMapping(value="confirm")
	public ModelAndView confirm( String mart_order_id){
		
		List food_numList = null;
		food_numList = dbPro.getFood_nums(mart_order_id);
		for(int i=0; i<food_numList.size(); i++){
			ProductDataBean product = (ProductDataBean) food_numList.get(i);
			product.setOffline_mart_id(offline_mart_id);
			int cnt = dbPro.getProductCnt(product.getFood_id());
			if(cnt == 0){
				dbPro.insertProduct(product);
				
			}else{
				System.out.println(product);
				dbPro.updateProduct(product);
			}
			dbPro.updateMartOrderStatus(mart_order_id);
		}
		
		return order_status(null,null);
	}
	@RequestMapping(value="martStatusForm")
	public ModelAndView martStatusForm(HttpServletRequest request, HttpSession session) throws Throwable{
		
		/*List<SaleDataBean> list = dbPro.getMart();
		String createfile="c:\\r_temp\\mart.csv";
		FileWriter fw = new FileWriter(createfile);
		for(int i=0;i<list.size();i++){
			fw.append(""+list.get(i).getOffline_mart_id());
			fw.append(","+list.get(i).getQty());
			String S = new SimpleDateFormat("MM").format(list.get(i).getS_date());
			fw.append(","+S);
			fw.append('\n');
		}
		
		fw.flush();
		fw.close();*/
		System.out.println("qweqweqweqweqwe");
		WebViewer wv=new WebViewer();
		
		RConnection c = new RConnection();
		
		String path = request.getRealPath("/")+ "viewImg\\";
		List<String> li = wv.toList("/ch01/Mart1/part-r-00000");
		PrintStream ps = null;
		FileOutputStream fos = null;
		fos = new FileOutputStream("C:/r_temp/martmonth.csv");
		ps = new PrintStream(fos);
	
	
		Iterator it = li.iterator();
		while(it.hasNext()) {
			String line = (String) it.next();
			line = line.replace("/", ",");	
			line = line.replace("\t", ",");	
			ps.print(line + "\r\n");
			
		}
	
		ps.flush();
		ps.close();
		path = path.replace("\\", "/");
		c.parseAndEval("setwd('c:/r_temp')");
		c.parseAndEval("library(KoNLP)");
		c.parseAndEval("library(ggplot2)");
		c.parseAndEval("data2 = read.csv('martmonth.csv', header=F)");
		c.parseAndEval("month=data2[,2]");
		c.parseAndEval("price=data2[,3]");
		c.parseAndEval("mart=data2[,1]");
		c.parseAndEval("bar<-ggplot(data2, aes(x=month, y=price, fill=mart))+geom_bar(stat=\"identity\", position=\"dodge\")+ggtitle(\"매장 월별 매출\")");
		c.parseAndEval("png(\"" + path + "j.png\", width=1300,    height=550,     pointsize=13 )");
		c.parseAndEval("plot(bar)"); 
		c.parseAndEval("dev.off()");
		c.close();
		
		mv.clear();
		mv.setViewName("offline/martStatusForm");
		return mv;
	}
	@RequestMapping(value="detail")
	public ModelAndView detail(String mart_order_id){
		
		List food_numList = null;
		food_numList = dbPro.getFood_nums2(mart_order_id);
		
		mv.clear();
		mv.addObject("food_numList",food_numList);
		mv.setViewName("offline/detailForm");
		return mv;
	}
	@RequestMapping(value="salePro")
	public ModelAndView salePro(HttpServletRequest request, String pointUse, String userPhone){
		String[] product_id = request.getParameterValues("product_id");
		String[] qty = request.getParameterValues("qty");
		
		if(product_id != null)
		for(int i=0; i<product_id.length; i++){
			SaleDataBean sale = new SaleDataBean();
			sale.setProduct_id(Integer.parseInt(product_id[i]));
			sale.setStaff_id(staff_id);
			sale.setQty(Integer.parseInt(qty[i]));
			dbPro.insertSale(sale);
		}
		if(pointUse.equals("Y"))
			dbPro.updatePoint(userPhone);
		
		return saleForm();
	}
}
