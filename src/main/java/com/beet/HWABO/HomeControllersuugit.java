package com.beet.HWABO;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeControllersuugit {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeControllersuugit.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	 @RequestMapping("/test.do")
	    public String test() {
	        return "test";
	    }    
	    
	    
	     //tiles 테스트 (레이아웃 포함)
	             
	    @RequestMapping("/testpage.do")
	    public String testpage() {
	        return "test.page";
	    }
	    
	    //tiles 테스트 (레이아웃 없음)     
	    @RequestMapping("/testpart.do")
	    public String testpart() {
	        return "test.part";
	    }    
	    
	    //웰컴페이지 
	    @RequestMapping("/welcomepage.do")
	    public String welcomePage(){

	    return "welcome.page";
	    }

	    @RequestMapping("/welcomepart.do")
	    public String welcomePart(){

	    return "welcome.part";
	    }

    
	 
}
