package com.beet.HWABO.test.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beet.HWABO.test.model.service.TestService;
import com.beet.HWABO.test.model.vo.CryptoUser;
import com.beet.HWABO.test.model.vo.Sample;
import com.beet.HWABO.test.model.vo.User;


@Controller
public class TestController {
	//로그 출력용 객체를 의존성 주입함 
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	

	
	//암호화처리-------------------------------
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordencoder;
	
	@Autowired
	private TestService testService;
	
	//패스워드 암호화 처리 메소드 ----------
	@RequestMapping(value="bcrypto.do", method=RequestMethod.POST)
	public String testBCrypMethod(@RequestParam("userpwd") String userpwd) {
		logger.info("전송 온 암호" + userpwd); //기존에는 filter를 이용해서 wrapper를 이용해서 암호화처리
		
		//글자로 받은 다음 암호화처리
		String bcryptPwd =bcryptPasswordencoder.encode(userpwd);
		logger.info("암호화된 패스워드" + bcryptPwd + ", 글자수 : " + bcryptPwd.length());
		//암호화 처리되면 어떤 글자는 글자수가 동일해짐 -> 이거 확인해줘야함 
		//글자수 무조건 60글자로 동일해짐!
		return "common/main";
	}

	//암호화페이지로 이동
	@RequestMapping("moveCrypto.do")
	public String moveCryptoPage() {
		return "test/testCrypto";
	}
	
	//패스워드 암호화 회원가입 메소드 
	@RequestMapping(value="enrollBcrypto.do", method=RequestMethod.POST)
	public String enrollCryptMethod(CryptoUser user, Model model) {
		logger.info("user : " + user);
		
		//패스워드 암호화 처리
		user.setUserpwd(bcryptPasswordencoder.encode(user.getUserpwd()));
		
		//서비스로 전송하고 결과받기
		int result = testService.insertUser(user);
		
		if(result > 0) {
			return "common/main";
		}else {
			model.addAttribute("message", "암호화 회원가입 실패!");
			return "common/error";
		}
		
	}
	
	
	//암호회된 패스워드 로그인 처리 메소드
	@RequestMapping(value="loginBcrypto.do", method=RequestMethod.POST)
	public String testBCryptLogin(CryptoUser user, Model model) {
		logger.info("암호화 로그인 테스트");
		
		CryptoUser loginUser = testService.selectLogin(user);
		
		//전송온 패스워드(일반글자)와 db 에서 조회해 온 암호회된 패스워드 비교
		//matches() 사용함 

		String viewFileName = null;
		if(loginUser != null) {
			if(bcryptPasswordencoder.matches(user.getUserpwd(), loginUser.getUserpwd())) {
				viewFileName = "common/main";
			}else {
				model.addAttribute("message", "암호가 일치하지 않습니다.");
				viewFileName = "common/error";
			}
		}else {
			model.addAttribute("message", "회원정보가 존재하지 않습니다");
			viewFileName = "common/error";
		}
		return viewFileName; 
		//리턴은 한번만 쓰는걸 권하기 때문에 String에 담아뒀다가 처리 
	}
	
	//뷰페이지로 이동 처리용 메소드 -------
	@RequestMapping("moveAjax.do")
	public String moveTestAjaxPage() {
		return "test/testAjaxPage";
	}
	
	//파일 업로드 테스트 메소드 -----
	@RequestMapping(value="tinsert.do", method=RequestMethod.POST)
	public String testFileUpload(Sample sample, HttpServletRequest request, 
							@RequestParam(name="upfile", required=false) MultipartFile file) {
		//input typefile name 이 upfile , 마이바티스 나눠서 했는데 required false는 파일 전송 없는거 ㅇㅋ
		logger.info("sample : " + sample );
		logger.info("file : " + file.getOriginalFilename());
		
		//파일저장경로 
		String savePath = request.getSession().getServletContext().getRealPath("resources/test_files");
		
		//업로드 된 파일을 지정한 폴더로 올기기 
		try {
			file.transferTo(new File(savePath +"\\" + file.getOriginalFilename()));
			return "common/main"; //메인페이지 이동
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return "common/error";
		}

	}
	
	//파일다운------------------
	@RequestMapping("fdown.do")
	public ModelAndView fileDownloadMethod(HttpServletRequest request, 
			@RequestParam("fname") String fileName) {
		logger.info("fdown.do : " + fileName);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/test_files");
		
		File downFile = new File(savePath + "\\" + fileName);
		
		return new ModelAndView("filedown","downFile", downFile);
	
	}
	
	  //뷰페이지 이동 처리용 메소드 ------
	   @RequestMapping("moveFile.do")
	   public String moveFileUpDownPage() {
		   return "test/testFileUpDown";
	   }
}
