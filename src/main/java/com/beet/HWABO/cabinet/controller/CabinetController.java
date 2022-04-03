package com.beet.HWABO.cabinet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beet.HWABO.cabinet.model.service.CabinetService;
import com.beet.HWABO.cabinet.model.vo.Cabinet;

import com.beet.HWABO.cabinet.model.vo.realpost;



@Controller
public class CabinetController {

   private static final Logger logger = LoggerFactory.getLogger(CabinetController.class);
   
   @Autowired
   private CabinetService cabinetService;
   

   
   @RequestMapping("cabinetList.do")
//   @RequestParam("pnum") String pnum, @RequestParam("ucode") String ucode,
   public String cabinetListselect(realpost realpost, Model model) {
	   
	   logger.info("cabinetKK 객체" + realpost);
	   ArrayList<realpost> list = cabinetService.selectCabinetList(realpost);
	   
	   if(list != null) {
			logger.info("캐비넷 리스트 성공");
			logger.info("캐비넷 list" + list);
		
			
			model.addAttribute("list", list);
			return "kyukyu/cabinetpage";	   
		   
	   }else {
		   model.addAttribute("message", "업무게시글 리스트 실패");
			return "comm/error"; 
	   }
	   
	   
   }
   
   
   
   
   






@RequestMapping(value="deletecabinet.do", method=RequestMethod.POST)
   public void deletecabinet(Cabinet cabinet, HttpServletResponse response)throws Exception {
	   logger.info("deletecabinet.do run...");
	      logger.info("cabinet : " + cabinet);
	     
	      response.setContentType("text/html; charset=utf-8");      
	      PrintWriter out = response.getWriter();      
	     
	     
	   
	   if(cabinetService.deleteCabinet(cabinet) > 0) {
		   logger.info("보관함 삭제 성공!");
		   out.append("ok");
	       out.flush();
	   
	       
	   }else {
	        logger.info("cabinet 삭제 실패");
	        out.append("fail");
	        out.flush();
	        }
	        out.close();
		   
		   
	   }
	   
   

   
   @RequestMapping(value="insertcabinet.do", method=RequestMethod.POST)
   //ajax는 뷰 리졸버를 거치지 않고 바로 통로를 만들어 보내므로 보이트처리
   public void insertCabinet(Cabinet cabinet, HttpServletResponse response) throws Exception{
      logger.info("insertcabinet.do run...");
      logger.info("cabinet : " + cabinet);
     
      response.setContentType("text/html; charset=utf-8");      
      PrintWriter out = response.getWriter();      
     
      
      
      if(cabinetService.insertCabinet(cabinet) > 0) {
          logger.info("cabinet 인서트 성공");
          out.append("ok");
          out.flush();
          

          
      }else {
         logger.info("cabinet 인서트 실패");
         out.append("fail");
         out.flush();
      }
      out.close();
   
   }
   
   
   @RequestMapping(value="cabinetList.do", method = RequestMethod.POST)
   @ResponseBody 
   public String cabinetList(Cabinet cabinet, HttpServletResponse response) throws IOException{
	 
		logger.info("cabinetk : "+ cabinet);
	  
	   ArrayList<Cabinet> list = cabinetService.selectUser(cabinet);
	
	   JSONObject sendJson = new JSONObject();

		JSONArray jarr = new JSONArray();
		
		
		for(Cabinet c : list) {
			JSONObject job = new JSONObject();
			job.put("no", URLEncoder.encode(c.getNo(), "utf-8"));
			
			jarr.add(job);
			
		}
		sendJson.put("list", jarr);
		return sendJson.toString();
   }
   
   
   
}







































