package com.beet.HWABO.filebox.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.beet.HWABO.filebox.model.service.FileboxService;
import com.beet.HWABO.filebox.model.vo.Filebox;

@Controller
public class FileboxController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileboxController.class);
	
	
	@Autowired
	private FileboxService fileboxService;
	
	@RequestMapping("Fileboxlist.do")
	public String selectListFilebox(@RequestParam("pnum") String pnum, Model model) {
		logger.info("전달 온 pnum 값 : " + pnum);
		
		ArrayList<Filebox> list = fileboxService.selectList(pnum);
		
		if(list != null) {
			
			logger.info("파일박스 리스트 성공");
			logger.info("파일박스 list"+list);
			model.addAttribute("list", list);
			return "kyukyu/fileboxpage";
		}else {
			
			 model.addAttribute("message", "filebox 리스트 실패");
			 return "comm/error";
		}
		
	}
	
	
	@RequestMapping("FileboxTxtlist.do")
	public String selectListFileboxTxt(@RequestParam("pnum") String pnum, Model model) {
		logger.info("전달 온 pnum 값 : " + pnum);
		
		ArrayList<Filebox> list = fileboxService.selectTxtList(pnum);
		
		if(list != null) {
			
			logger.info("파일박스 Txt 리스트 성공");
			logger.info("파일박스 Txt list"+list);
			model.addAttribute("list", list);
			
			
			return "kyukyu/fileboxTxt";
		}else {
			
			 model.addAttribute("message", "filebox 리스트 실패");
			 return "comm/error";
		}
		
	}
	
	@RequestMapping("FileboxZiplist.do")
	public String selectListFileboxZip(@RequestParam("pnum") String pnum, Model model) {
		logger.info("전달 온 pnum 값 : " + pnum);
		
		ArrayList<Filebox> list = fileboxService.selectZipList(pnum);
		
		if(list != null) {
			
			logger.info("파일박스 zip 리스트 성공");
			logger.info("파일박스 zip list"+list);
			model.addAttribute("list", list);
			

			return "kyukyu/fileboxZip";
		}else {
			
			 model.addAttribute("message", "filebox 리스트 실패");
			 return "comm/error";
		}
		
	}
	
	
	@RequestMapping("FileboxPptlist.do")
	public String selectListFileboxPpt(@RequestParam("pnum") String pnum, Model model) {
		logger.info("전달 온 pnum 값 : " + pnum);
		
		ArrayList<Filebox> list = fileboxService.selectPptList(pnum);
		
		if(list != null) {
			
			logger.info("파일박스 zip 리스트 성공");
			logger.info("파일박스 zip list"+list);
			model.addAttribute("list", list);
			

			return "kyukyu/fileboxPpt";
		}else {
			
			 model.addAttribute("message", "filebox 리스트 실패");
			 return "comm/error";
		}
		
	}
	
	
	@RequestMapping("FileboxEtclist.do")
	public String selectListFileboxEtc(@RequestParam("pnum") String pnum, Model model) {
		logger.info("전달 온 pnum 값 : " + pnum);
		
		ArrayList<Filebox> list = fileboxService.selectEtcList(pnum);
		
		if(list != null) {
			
			logger.info("파일박스 zip 리스트 성공");
			logger.info("파일박스 zip list"+list);
			model.addAttribute("list", list);
			

			return "kyukyu/fileboxEtc";
		}else {
			
			 model.addAttribute("message", "filebox 리스트 실패");
			 return "comm/error";
		}
		
	}
	
	
	@RequestMapping("download.do")
	public void imageDownload(@RequestParam Map<String,Object> param, HttpServletResponse response, HttpServletRequest request){
        
		
        String originname = (String) param.get("ofile"); //full경로
        String rename = (String) param.get("rfile"); //파일명
        logger.info("ofile"+ originname +", rfile :" +rename);
		
        
        BufferedInputStream buffer = null;
		ServletOutputStream serout = null;

		logger.info("originname" + originname);
		logger.info("rename" + rename);

		String dir = request.getSession().getServletContext().getRealPath("resources/bupfile");
		File savedFile = new File(dir + "/" + rename);
		try {
			FileInputStream fis = new FileInputStream(savedFile);
			buffer = new BufferedInputStream(fis);
			serout = response.getOutputStream();

			String resFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			if (isMSIE) {
				resFilename = URLEncoder.encode(originname, "UTF-8");
				resFilename = resFilename.replaceAll("\\+", "%20");
			} else {
				resFilename = new String(originname.getBytes("UTF-8"), "ISO-8859-1");

			}
			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition", "attachment;filename=\"" + resFilename + "\"");
			// 파일길이 설정
			response.setContentLength((int) savedFile.length());

			int read = 0;
			while ((read = buffer.read()) != -1) {
				serout.write(read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				serout.close();
				buffer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
























