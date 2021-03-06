package com.beet.HWABO.suugit.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.catalina.Session;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beet.HWABO.cpost.model.service.CpostService;
import com.beet.HWABO.cpost.model.vo.AddOn;
import com.beet.HWABO.cpost.model.vo.Cpost;
import com.beet.HWABO.invite.model.vo.Invite;
import com.beet.HWABO.member.model.service.MailSendService;
import com.beet.HWABO.member.model.service.MemberService;
import com.beet.HWABO.member.model.vo.GoogleLoginUtil;
import com.beet.HWABO.member.model.vo.MailUtils;
import com.beet.HWABO.member.model.vo.Member;
import com.beet.HWABO.member.model.vo.NaverLoginUtil;
import com.beet.HWABO.member.model.vo.PjMember;
import com.beet.HWABO.red.model.vo.Project;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class SuugitController {

	private static final Logger logger = LoggerFactory.getLogger(SuugitController.class);
	
	
	@Autowired
	private void setNaverLoginUtil(NaverLoginUtil NaverLoginUtil) {
		this.NaverLoginUtil = NaverLoginUtil;
		
	}
	
	@Autowired
	private void setGoogleLoginUtil(GoogleLoginUtil GoogleLoginUtil) {
		this.GoogleLoginUtil = GoogleLoginUtil;
	}

	@Autowired
	private CpostService cservice;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	private MailSendService msserivce;

	@Autowired
	private MemberService mservice;

	@Autowired
	private BCryptPasswordEncoder bcryptPwdEncoder;

//????????????
	@RequestMapping("/welcome.do")
	public String Indexpage() {
		logger.info("????????? ??????!");
		return "welcome";
	}

//???????????? ????????? ?????? 
	@RequestMapping("/mvsign.do")
	public String moveSign() {
		return "suugit/sign";
	}

	@RequestMapping("/terms.do")
	public String openTerms() {
		return "suugit/";
	}

	@RequestMapping(value = "/sign.do", method = RequestMethod.POST)
	public ModelAndView insertUser(@Valid Member member, Errors errors, ModelAndView mav,Invite invt) {
		logger.info("sign.do ??????...");
		if (errors.hasErrors()) {
			mav.addObject("message", errors.getFieldError().getDefaultMessage());
			mav.setViewName("suugit/sign");
			return mav;
		}
		member.setSigntype("h");
		Member loginUser = mservice.selectLogin(member);
		if (loginUser != null) {
			mav.addObject("message", "?????? ????????? ???????????????");
			mav.setViewName("suugit/sign");
			return mav;
		}
		if(invt.getInvtkey() != null) {
			logger.info("???????????? ???????????????");
		}

		// ???????????? ?????????
		member.getUemail();
		member.setUpwd(bcryptPwdEncoder.encode(member.getUpwd()));
		logger.info("??????????????? ?????? ?????? : " + member.getUemail());
		member.setAccesstoken(msserivce.sendAuthMail(member.getUemail()));
		member.setUimg("resources/profileImg/default.png");
		
		int result = mservice.insertUser(member);
		logger.info("member ??? " + member);
		if (result > 0) {
			mav.addObject("message", "?????? ????????? ?????????????????????!");
		} else {
			mav.addObject("message", "??????????????? ??????????????????");
		}
		mav.setViewName("suugit/login");
		return mav;
	}
	
	
	@RequestMapping("invtsign.do")
	public ModelAndView inserInvtUser(ModelAndView mav) {
	//??????
		
		
		mav.setViewName("redirect:/ftables?do=" );
		return mav;
		
		
	}


	@GetMapping("/terms.do")
	public String TermsPage() {
		return "suugit/hwaboTerms";
	}

	@GetMapping("/signConfirm.do")
	public ModelAndView signUpConfirm(HttpServletRequest request, ModelAndView mv, Member member) {
		// email, authKey ??? ??????????????? authStatus ????????????
		
		member.setUemail(request.getParameter("uemail"));
		member.setAccesstoken(request.getParameter("accesstoken"));
		int result = mservice.updateUst(member);

		if (result > 0) {
			mv.addObject("member", member);
			mv.setViewName("redirect:/cards.do");
		} else {
			mv.addObject("message", "??????????????? ???????????? ????????????!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	private NaverLoginUtil NaverLoginUtil;
	private GoogleLoginUtil GoogleLoginUtil;
	private String apiResult = null;

//??????????????? 
	@RequestMapping("/mvlogin.do")
	public String moveLogin(Model model, HttpSession session) {
		String naverAuthUrl = NaverLoginUtil.getAuthorizationUrl(session);
		String googleAuthUrl = GoogleLoginUtil.getAuthorizationUrl(session);
		System.out.println("?????????:" + naverAuthUrl);
		System.out.println("??????:" + googleAuthUrl);
		// ?????????
		model.addAttribute("naverUrl", naverAuthUrl);
		model.addAttribute("googleUrl", googleAuthUrl);

		return "suugit/login";
	}

	/*
	 * @RequestMapping(value="/idchk.do", method=RequestMethod.POST)
	 * 
	 * @RequestBody public String selectEmailCheck(@RequestParam("uemail") String
	 * uemail) { int result = mservice.selectEmailCheck(uemail);
	 * 
	 * if(result > 0) { return } }
	 */

	@PostMapping
	public String submit(@ModelAttribute @Valid Member member, Errors errors) {
		if (errors.hasErrors())
			return "form";
		return "submit";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String selectLogin(@Valid Member member, BindingResult theBindingResult, Model model,
			HttpServletRequest request, SessionStatus status) {
		logger.info("?????????");
		member.setSigntype("h");
		Member loginUser = mservice.selectLogin(member);
		
		String returnPage = "suugit/login";

		if (loginUser != null) {

			if (bcryptPwdEncoder.matches(member.getUpwd(), loginUser.getUpwd())) {
				System.out.println(loginUser.getUst());
				if (loginUser.getUst().equals("Y")) {
					logger.info("???????????? ????????? ?????? : " + loginUser.getUcode());

					HttpSession session = request.getSession();
					session.setAttribute("uuser", loginUser);
					session.setAttribute("uimg", loginUser.getUimg());
					session.setAttribute("ucode", loginUser.getUcode());
					session.setAttribute("uname", loginUser.getUname());
					session.setAttribute("signtype", loginUser.getSigntype());
					request.setAttribute("uname", loginUser.getUname());
					status.setComplete(); // ????????????, 200 ??????
					
					returnPage = "redirect:/cards.do";
				} else {
					model.addAttribute("message", "???????????? ?????? ??????????????????.<br>???????????? ??????????????????");
					returnPage = "suugit/login";
					return returnPage;
				}

			} else {
				model.addAttribute("message", "????????? ???????????? ????????????.");
			}
		} else {
			model.addAttribute("message", "??????????????? ???????????? ????????????");

		}
		
		return returnPage;
	}

//snsObject 
	@RequestMapping("mvsnslogin.do")
	public String snsloginResult() {
		logger.info("???????????????1");
		return "suugit/loginResult";
	}

	
	
	/* NaverLoginUtil */

	/*
	 * //????????? ??? ?????? ?????? ?????????
	 * 
	 * @RequestMapping(value = "/snslogin.do", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String login(Model model, HttpSession session) {
	 * ????????????????????? ?????? URL??? ???????????? ????????? NaverLoginUtil???????????? getAuthorizationUrl????????? ?????? String
	 * naverAuthUrl = NaverLoginUtil.getAuthorizationUrl(session);
	 * //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***
	 * ************&
	 * //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&
	 * state=e68c269c-5ba9-4c31-85da-54c16c658125 System.out.println("?????????:" +
	 * naverAuthUrl); //????????? model.addAttribute("url", naverAuthUrl); return
	 * "suugit/login"; }
	 */
	// ????????? ????????? ????????? callback?????? ?????????

	@RequestMapping(value = "/ncallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("????????? ???????????????!");
		OAuth2AccessToken oauthToken;
		oauthToken = NaverLoginUtil.getAccessToken(session, code, state);
		// 1. ????????? ????????? ????????? ????????????.
		apiResult = NaverLoginUtil.getUserProfile(oauthToken); // String????????? json?????????

		// 2. String????????? apiResult??? json????????? ??????
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. ????????? ??????
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		Member member = new Member();

		member.setUemail((String) response_obj.get("email"));
		member.setUname((String) response_obj.get("nickname"));
		member.setUimg((String) response_obj.get("profile_image"));
		member.setSigntype("n");

		int result1 = mservice.insertSnsUser(member);

		member = mservice.selectLogin(member);
		session.setAttribute("ucode", member.getUcode());
		session.setAttribute("uname", member.getUname());
		session.setAttribute("uimg", member.getUimg());
		session.setAttribute("signtype", member.getSigntype());
		return "redirect:/cards.do";
	}

	
	@RequestMapping(value = "/gcallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("?????? ???????????????!");
		OAuth2AccessToken oauthToken;
		oauthToken = GoogleLoginUtil.getAccessToken(session, code, state);
		// 1. ????????? ????????? ????????? ????????????.
		apiResult = GoogleLoginUtil.getUserProfile(oauthToken); // String????????? json?????????
		System.out.println("api" + apiResult);
		// 2. String????????? apiResult??? json????????? ??????
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. ????????? ??????
		
		Member member = new Member();
		member.setUemail((String) jsonObj.get("email"));
		member.setUname((String)jsonObj.get("name"));
		member.setUimg((String)jsonObj.get("picture"));
		member.setSigntype("g");

		int result1 = mservice.insertSnsUser(member);

		member = mservice.selectLogin(member);
		session.setAttribute("ucode", member.getUcode());
		session.setAttribute("uname", member.getUname());
		session.setAttribute("uimg", member.getUimg());
		session.setAttribute("signtype", member.getSigntype());	
		return "redirect:/cards.do";
	}

//????????????
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest request, Model model) {
		logger.info("??????????????????  ?????? ?????? : " + session.getAttribute("uname"));
		String returnPage = "";
		if (session != null) {
			session.invalidate();
			returnPage = "welcome";
		} else {
			model.addAttribute("message", "????????? ????????? ???????????? ????????????!");
			returnPage = "common/error";
		}
		return returnPage;
	}

//????????????
	@RequestMapping("/mvforgotpwd.do")
	public String forgotPwdPage() {

		return "suugit/forgotpwd";
	}

	@RequestMapping("/forgotpwd.do")
	public void updatefotgotpwd(@RequestParam String uemail, Member member, ModelAndView mav) {
		logger.info("???????????? ?????? ??????...");
		int result = mservice.selectEmailCheck(uemail);

		if (result > 0) {
			// member.setAccesstoken(msserivce.sendAuthMail(uemail));
			SecureRandom random = new SecureRandom();
			StringBuffer sbf = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				if (random.nextBoolean()) {
					sbf.append((char) ((int) (random.nextInt(26)) + 97));
				} else {
					sbf.append(random.nextInt(10));
				}
			}
			try {
				MailUtils sendMail = new MailUtils(mailSender);
				sendMail.setSubject("[HWABO] ?????? ???????????? ??????");
				sendMail.setText(new StringBuffer().append("<h1>[HWABO] ?????? ???????????? </h1><br><br>")
						.append("<p>????????? ??????????????? ???????????? ????????? ??? ??????????????? ??????????????????.</p>")
						.append("<br><br><h3> ?????? ???????????? : " + sbf + "</h3><br><br><br>").append("??? ??????????????? ???????????? ?????????????????????")
						.append("<a href='http://localhost:8282/hwabo/mvlogin.do'")
						.append(" target='_blenk'><img src='https://files.slack.com/files-pri/T01724B8QMC-F01BR631W2C/______2.png'/></a>")
						.toString());
				sendMail.setFrom("hwabo49@gmail.com", "HWABO");
				sendMail.setTo(uemail);
				sendMail.send();
			} catch (Exception e) {
				e.printStackTrace();

			}
			member.setUpwd(bcryptPwdEncoder.encode(sbf));

			if (mservice.updateTmpPwd(member) > 0) {
				logger.info(uemail + "?????????????????? ?????? ??????");
			} else {
				logger.info(uemail + "?????? ???????????? ?????? ??????");
			}

		} else {
			mav.addObject("message", "???????????? ????????? ???????????? ????????????");
		}
	}

//??? ??????
	@RequestMapping("/myinfo1.do")
	public String myinfoPag1e() {

		return "suugit/tables2";
	}

	@RequestMapping("/myinfo.do")
	public ModelAndView myinfoPage(@RequestParam("ucode") String ucode, ModelAndView mav) {
		logger.info("???????????? ??????...");
		Member member = mservice.selectMember(ucode);
		if (member != null) {
			System.out.println(member);
			mav.addObject("member", member);
			mav.setViewName("suugit/myinfo");
		} else {
			mav.addObject("message", ucode + "??? ?????? ???????????? ??????");
			mav.setViewName("common/error");
		}
		return mav;
	}

	@RequestMapping(value = "/upinfo.do", method = RequestMethod.POST)
	public ModelAndView updateInfo(Member member, ModelAndView mav) {

		int result = mservice.updateInfo(member);

		if (member != null) {
			mav.addObject("member", member);
			mav.addObject("message", "??????????????? ??????????????? ?????????????????????");
			mav.setViewName("redirect:/myinfo.do?ucode=" + member.getUcode());
		} else {
			mav.addObject("message", "???????????? ?????? ??????");
			mav.setViewName("common/error");
		}
		return mav;
	}

	@RequestMapping(value = "/upuimg.do", method = RequestMethod.POST)
	public ModelAndView updateUimg(Member member, MultipartHttpServletRequest request, ModelAndView mav) {
		logger.info("?????? ??????~");

		MultipartFile file = request.getFile("file");
		String ucode = request.getParameter("ucode");
		String savePath = request.getSession().getServletContext().getRealPath("resources/profileImg");

		if (file.getSize() > 0) {

			File originFile = new File(file.getOriginalFilename());
			originFile.delete();

			member.setUimg("resources/profileImg/" + ucode + file.getOriginalFilename());

			try {
				file.transferTo(new File(savePath + "\\" + ucode + file.getOriginalFilename()));
				mav.setViewName("redirect:/myinfo.do?ucode=" + ucode);

			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("common/error");
			}
		} else {
			member.setUimg("resources/profileImg/default.png");
			mav.setViewName("redirect:/myinfo.do?ucode=" + ucode);
		}

		int result = mservice.updateImg(member);

		return mav;
	}
	
	@RequestMapping(value = "/uppimg.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updatePimg(@RequestParam(name="upfile", required = false) MultipartFile file, HttpSession session, ModelAndView mav) {
		logger.info("?????? ??????~");

		Project project = new Project();
		String pnum = (String)session.getAttribute("pnum");
		System.out.println(pnum);
		project.setProject_num(pnum);
		String savePath = session.getServletContext().getRealPath("resources/projectImg");
		if (file.getSize() > 0) {
			File originFile = new File(file.getOriginalFilename());
			originFile.delete();
			project.setOpen("resources/projectImg/" + pnum + file.getOriginalFilename());
			mav.setViewName("redirect:/invtadmin.do");
			try {
				file.transferTo(new File(savePath + "\\" + pnum + file.getOriginalFilename()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			project.setOpen("resources/projectImg/default.png");
		}

		int result = mservice.updatePjImg(project);
		mav.setViewName("redirect:/invtadmin.do");
		return mav;

	}
	
	@RequestMapping(value = "/uppjdetail.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updatePjDetail(HttpServletRequest request,HttpSession session) {
		logger.info("???????????? ?????? ??????...");
	System.out.println(request.getParameter("keyword"));
	JSONObject json = new JSONObject();
		String keyword = request.getParameter("keyword");
		Project project = new Project();
		project.setProject_num((String)session.getAttribute("pnum"));
		if(keyword.equals("name")) {
			project.setName(request.getParameter("keyvalue"));
			int r = mservice.updatePjDetail(project);
		}else {
			project.setExplain(request.getParameter("keyvalue"));
			int r = mservice.updatePjDetail(project);
		}
		
		project = mservice.selectPjdetail((String)session.getAttribute("pnum"));
		json.put("name", project.getName());
		json.put("explain",project.getExplain());
		
		return json;
	}
	
	@RequestMapping(value = "/uppwd.do", method = RequestMethod.POST)
	public ModelAndView updatePwd(HttpServletRequest request, ModelAndView mav, HttpServletResponse response) {
		String ucode = request.getParameter("ucode");
		Member member = mservice.selectMember(ucode);
		if (bcryptPwdEncoder.matches(request.getParameter("oldpwd"), member.getUpwd())) {
			logger.info("???????????? ??????! ???????????? ?????? ??????...");
			member.setUpwd(bcryptPwdEncoder.encode(request.getParameter("newpwd")));
			int result = mservice.updatePwd(member);
			if (result > 0) {
				mav.addObject("message", "??????????????? ??????????????????");
			} else {
				mav.addObject("message", "???????????? ????????? ??????????????????!");
			}
		} else {
			logger.info("?????? ?????????!");
			mav.addObject("message", "?????? ??????????????? ???????????? ????????????!");
		}
		mav.setViewName("redirect:/myinfo.do?ucode=" + ucode);
		return mav;
	}

	@RequestMapping("deluser.do")
	public String deleteUser(@RequestParam("ucode") String ucode, Model model) {
		if (mservice.deleteUser(ucode) > 0) {
			return "redirect:/logout.do";
		} else {
			model.addAttribute("message", "????????? ??????????????????");
			return "common/error";
		}
	}

//??????
	@RequestMapping("/modal.do")
	public String ModalPage() {

		return "suugit/modal.page";
	}

	@RequestMapping("/top1.do")
	public String testpage2() {
		return "suugit/topbar";
	}

//???????????? ???????????? ( ????????????) 
	@RequestMapping("/invtnew.do")
	@ResponseBody
	public JSONObject invtNew(HttpSession session, HttpServletRequest request, @RequestBody String param, Invite invt)
			throws ParseException {
		logger.info("?????? ??????!");
		JSONParser jparse = new JSONParser();
		String pnum = (String) session.getAttribute("pnum");
		JSONArray fileData = (JSONArray) jparse.parse(param);
		invt.setUcode((String) session.getAttribute("ucode"));
		invt.setPnum(pnum);

		ArrayList<Member> pchklist = mservice.selectPMember(pnum);
		String referer = request.getHeader("Referer");

		JSONObject json = new JSONObject();

		for (int i = 0; i < fileData.size(); i++) {
			invt.setInvtkey("i" + Integer.toString((int) Math.floor(Math.random() * 100000 + 1)));
			invt.setInvtemail((String) fileData.get(i));
			System.out.println(pchklist);
			for (Member m : pchklist) {
				System.out.println(fileData.get(i) + "??????" + m.getUemail());

				if (fileData.get(i).toString().trim().equals(m.getUemail())) {
					json.put("message", (String) fileData.get(i) + "??? ?????? ???????????? ???????????????");
					return json;
				}
			}

			Project p = mservice.selectPjdetail(pnum);

			try {
				MailUtils sendMail = new MailUtils(mailSender);
				sendMail.setSubject("HWABO??? ???????????????");
				sendMail.setText(new StringBuffer().append("<h1>[HWABO ????????? ??????]</h1><h3>").append(p.getName()).append(
						"</h3>?????? ???????????? ??????????????????!<div style='border:1px solid; padding:10px;width:50%;float:center;margin:30px;'>")
						.append(p.getExplain()).append("</div><p>?????? ????????? ???????????? ??????????????? ???????????????.</p>")
						.append("<a href='http://localhost:8282/hwabo/invtConfirm.do?uemail=")
						.append(invt.getInvtemail()).append("&pnum=").append(invt.getPnum()).append("&invtkey=")
						.append(invt.getInvtkey()).append("' target='_blenk'>????????? ?????? ??????</a>").toString());
				sendMail.setFrom("hwabo49@gmail.com", "HWABO");
				sendMail.setTo(invt.getInvtemail());
				sendMail.send();
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			int result = mservice.insertInvtNew(invt);
		}

		json.put("message", "????????? ?????????????????????");
		return json;
	}

	@RequestMapping("/invtConfirm.do")
	public ModelAndView invtConfirm(HttpServletRequest request, ModelAndView mv, Member member, Invite invt,
			PjMember pjmember, HttpSession session) {
		String uemail = request.getParameter("uemail");
		String pnum = request.getParameter("pnum");
		invt = mservice.selectInvtChk(request.getParameter("invtkey"));
		Date today = new Date();
		
		if (invt == null) {
			mv.addObject("message", "???????????? ?????? ????????? ?????????");
			mv.setViewName("suugit/login");
		} else if(invt.getExprtdate().compareTo(today) < 0){
				logger.info("1");
				mv.addObject("message", "?????? ??????????????? ???????????????!");
				mv.setViewName("suugit/login");
		} else if(invt.getInvtuse().equals("Y")) {
				logger.info("2");
				mv.addObject("message", "?????? ????????? ?????????????????????");
				mv.setViewName("suugit/login");
		}else { //??????????????????
			member = mservice.selectEmailMember(uemail);
			
			if(member != null) {
				logger.info("????????????");
				pjmember.setUcode(member.getUcode());
				pjmember.setPnum(pnum);
				if (mservice.insertPjMember(pjmember) > 0) {
					logger.info(pnum +"???????????? ??? ?????? : " +member.getUname());
					mservice.deleteInvt(invt.getInvtkey());
					mv.addObject("ucode", member.getUcode());
					mv.addObject("pnum", pnum);
					mv.setViewName("redirect:/ftables2.do");
				} else {
					mv.addObject("message", "???????????? ????????? ??????????????????");
					mv.setViewName("redirect:/cards.do");
				}
			}else {
				logger.info("????????????");
				mv.addObject("message", "???????????? ??? ????????? ??? ????????????");
				mv.addObject("uemail", uemail);
				mv.addObject("invite", invt);
				mv.setViewName("suugit/sign");
			}
		}
		return mv; 
	}
	
	@PostMapping("/invtee.do")
	@ResponseBody
	public JSONArray selectNmList(HttpSession session, ModelAndView mav) {
		String pnum = (String) session.getAttribute("pnum");
		ArrayList<Member> nmlist = mservice.selectNotMember(pnum);

		JSONObject obj = new JSONObject();

		JSONArray jarr = new JSONArray();

		try {

			for (int i = 0; i < nmlist.size(); i++) {
				System.out.println(nmlist.get(i));
				JSONObject job = new JSONObject();
				job.put("uemail",nmlist.get(i).getUemail());
				job.put("ucode", nmlist.get(i).getUcode());
				job.put("uname", nmlist.get(i).getUname());
				job.put("ugroup", nmlist.get(i).getUgroup());
				job.put("urole", nmlist.get(i).getUrole());
				job.put("uimg", nmlist.get(i).getUimg());

				jarr.add(job);
			}
			mav.addObject("nmlist", jarr);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return jarr;
	}

	@PostMapping("/pmlist.do")
	@ResponseBody
	public JSONArray selectpmlist(HttpSession session, ModelAndView mav) {
		String pnum = (String) session.getAttribute("pnum");
		System.out.println(pnum);
		ArrayList<Member> nmlist = mservice.selectPMember(pnum);

		JSONObject obj = new JSONObject();

		JSONArray jarr = new JSONArray();

		try {

			for (int i = 0; i < nmlist.size(); i++) {
				JSONObject job = new JSONObject();
				job.put("ucode", nmlist.get(i).getUcode());
				job.put("uname", nmlist.get(i).getUname());
				job.put("uemail", nmlist.get(i).getUemail());
				job.put("uphone", nmlist.get(i).getUphone());
				job.put("ugroup", nmlist.get(i).getUgroup());
				job.put("urole", nmlist.get(i).getUrole());
				job.put("uimg", nmlist.get(i).getUimg());
				job.put("pjadmin", nmlist.get(i).getPjadmin());

				jarr.add(job);
			}
			mav.addObject("nmlist", jarr);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return jarr;
	}

//????????????
//	selectInvtList	
	@PostMapping("invtlist.do")
	@ResponseBody
	public JSONArray selectInvtList(HttpSession session, ModelAndView mav) {
		ArrayList<Invite> invtlist = mservice.selectInvtList((String) session.getAttribute("pnum"));
		JSONObject obj = new JSONObject();

		JSONArray jarr = new JSONArray();

		try {

			for (int i = 0; i < invtlist.size(); i++) {
				JSONObject job = new JSONObject();

				job.put("invtkey", invtlist.get(i).getInvtkey());
				job.put("invtemail", invtlist.get(i).getInvtemail());
				job.put("invtuse", invtlist.get(i).getInvtuse());
				job.put("exprtdate", invtlist.get(i).getExprtdate().toString());

				jarr.add(job);
			}
			mav.addObject("invtlist", jarr);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return jarr;
	}

//?????????????????????
	@RequestMapping("/invtadmin.do")
	public ModelAndView InviteManage(HttpSession session, ModelAndView mav) {
		Project project = mservice.selectPjdetail((String)session.getAttribute("pnum"));
		mav.addObject("p",project);
		mav.setViewName("suugit/invtmanage");
		return mav;
	}

//?????? ?????? ?????? 
	@PostMapping("/chnrole.do")
	public void updateProle(PjMember pjm, HttpSession session, HttpServletResponse response) throws IOException {
		pjm.setPnum((String) session.getAttribute("pnum"));
		int r = mservice.updatepjadmin(pjm);

	}

	@RequestMapping("invtcancle.do")
	public void deleteInvt(@RequestParam("invtkey") String invtkey) {
		int r = mservice.deleteInvt(invtkey);
	}

//????????? ?????? ====================================================================================================================================================================
//????????? ?????? ====================================================================================================================================================================
//????????? ?????? ====================================================================================================================================================================
//????????? ?????? ====================================================================================================================================================================
	@RequestMapping("/mvcpost.do")
	public String testpage() {
		return "suugit/tables";
	}

	@RequestMapping("/incp.do")
	public ModelAndView insertCpost(Cpost cpost, AddOn addon, ModelAndView mv, MultipartHttpServletRequest request) {
		logger.info("incp.do run....");

		System.out.println(cpost.getCpnum());
		System.out.println(cpost.getCwriter());
		System.out.println(cpost.getCucode());
		System.out.println(cpost.getCcontent());
		System.out.println(cpost.getCtitle());
		int result2 = cservice.insertCpost(cpost);
		if (result2 > 0) {
			mv.setViewName("redirect:/ftables.do?project_num=" + cpost.getCpnum());
		} else {
			mv.addObject("message", "?????????????????????");
			mv.setViewName("common/error");
		}

		Iterator<String> files = request.getFileNames();
		MultipartFile mpf = request.getFile(files.next());

		if (mpf.getSize() > 0) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/bupfile");
			String oFileName = "";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

//		Iterator<String> files = request.getFileNames();
//		MultipartFile mpf = request.getFile(files.next());

			int i = 0;
			List<MultipartFile> fileList = request.getFiles("file");

			if (fileList.size() > 3) {
				System.out.println("???????????? ??????!");
				mv.setViewName("suugit/tables");
				return mv;
			}
			String cno = cservice.selectCno();
			addon.setCno(cno);

			for (MultipartFile filePart : fileList) {

				if (!fileList.get(i).isEmpty()) {
					String rfileName = cno + sdf.format(new java.sql.Date(System.currentTimeMillis()));
					oFileName = filePart.getOriginalFilename();
					rfileName += i + "." + oFileName.substring(oFileName.lastIndexOf(".") + 1);

					if (i == 0) {
						addon.setOfile1(oFileName);
						addon.setRfile1(rfileName);
						System.out.println("?????????" + oFileName + rfileName);
					} else if (i == 1) {
						addon.setOfile2(oFileName);
						addon.setRfile2(rfileName);
						System.out.println("?????????" + oFileName + rfileName);
					} else if (i == 2) {
						addon.setOfile3(oFileName);
						addon.setRfile3(rfileName);
						System.out.println("?????????" + oFileName + rfileName);
					} else {
						mv.addObject("message", "??????????????????");
						mv.setViewName("suugit/tables");
						return mv;
					}

					if (!oFileName.equals("")) {
						try {
							FileOutputStream fs = new FileOutputStream(savePath + "\\" + rfileName);
							fs.write(filePart.getBytes());
							fs.close();
						} catch (Exception e) {
							e.printStackTrace();
						}

					}
					logger.info("?????? ?????? " + oFileName);
					logger.info("?????? ??????" + rfileName);
				}
				i++;
			}

			int result1 = cservice.updateCfile(addon);

			if (result1 > 0) {
				
				mv.setViewName("redirect:/ftables.do?project_num=" + cpost.getCpnum());
			} else {
				mv.addObject("message", "????????????????????????");
				mv.setViewName("common/error");
			}
		}

		return mv;
	}

	@RequestMapping("selcplist.do")
	public String selectCpList(Model model) {

		ArrayList<Cpost> list = cservice.selectCpList();

		if (list != null) {
			model.addAttribute("list", list);
			return "suugit/tables";
		} else {
			model.addAttribute("message", "????????? ?????? ??????!");
			return "comm/error";
		}

	}

	@RequestMapping("selcpone.do")
	public ModelAndView selectCpOne(HttpServletRequest request, ModelAndView mv) {

		logger.info(request.getParameter("cno"));
		Cpost cpost = cservice.selectCpOne(request.getParameter("cno"));

		if (cpost != null) {
			mv.addObject("c", cpost);
			mv.setViewName("suugit/tables2");
		} else {
			mv.addObject("message", "?????? ????????? ??? ????????????!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	

	@RequestMapping("selcpnew.do")
	public ModelAndView selectCpNew(HttpServletRequest request, ModelAndView mv) {

		logger.info(request.getParameter("cno"));
		Cpost cpost = cservice.selectCpOne(request.getParameter("cno"));

		if (cpost != null) {
			mv.addObject("c", cpost);
			mv.setViewName("suugit/cpnew");
		} else {
			mv.addObject("message", "?????? ????????? ??? ????????????!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	

	@RequestMapping("mvupcp.do")
	public String moveUpdateCpost(Cpost cpost, Model model) {
		model.addAttribute("cpost", cpost);
		return "suugit/cpostUpdateForm";

	}

	@PostMapping("upcp.do")
	@ResponseBody
	public JSONObject updateCpost(Cpost cpost, AddOn addon, ModelAndView mav, 
			MultipartHttpServletRequest request,@RequestParam(value="dellist") List<String> dellist) throws UnsupportedEncodingException {
		String cno = cpost.getCno();
		logger.info(cno + "????????? ??????");

		String savePath = request.getSession().getServletContext().getRealPath("resources/bupfile");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		ArrayList<String> darr = (ArrayList<String>)dellist;
		List<MultipartFile> fileList = request.getFiles("file");
		JSONObject obj = new JSONObject();
		//?????????
		if(cservice.updateCpost(cpost) > 0) {
			obj.put("cno", cpost.getCno());
			obj.put("ctitle", cpost.getCtitle());
			obj.put("ccontent", cpost.getCcontent());
		}else {
			obj.put("message","??? ???????????? ??????");	
		}
		
		System.out.println(cpost);
		System.out.println(addon);
		//??????????????????
		if(dellist.size() > 0) {
			for(String k : dellist) {
				System.out.println("????????????" + k);
				switch(k){
				case "0" : System.out.println("1??????");addon.setOfile1(null); addon.setRfile1(null); break;
				case "1" : System.out.println("2??????");addon.setOfile2(null); addon.setRfile2(null); break;
				case "2" : System.out.println("3??????");addon.setOfile3(null); addon.setRfile3(null); break;
				}
				cservice.updateCfileAll(addon);
			}
		}
		
		//?????????????????? 
			String oFileName = "";
			int i = 0;
			if(fileList.size()==0) {
				System.out.println("????????????");
				return obj;
			}
			for (MultipartFile filePart : fileList) {
				System.out.println(filePart);
				System.out.println(filePart.isEmpty());
				
				while(!filePart.isEmpty()) {
					System.out.println("??????");
					
					String rfileName = cno + sdf.format(new java.sql.Date(System.currentTimeMillis()));
					oFileName = filePart.getOriginalFilename();
					rfileName += i + "." + oFileName.substring(oFileName.lastIndexOf(".") + 1);

					logger.info("?????? ?????? " + oFileName);
					logger.info("?????? ??????" + rfileName);

					if (!oFileName.equals("")) {
						try {
							FileOutputStream fs = new FileOutputStream(savePath + "\\" + rfileName);
							fs.write(filePart.getBytes());
							fs.close();
							System.out.println("????????????");
						} catch (Exception e) {
							e.printStackTrace();
						}

					}
					if (addon.getRfile1() == null) {
						addon.setOfile1(oFileName);
						addon.setRfile1(rfileName);
					
						logger.info("????????? ?????? ");
						System.out.println("?????????" + oFileName + rfileName);
						i++;
						break;
					}
					if (addon.getRfile2() == null) {
						addon.setOfile2(oFileName);
						addon.setRfile2(rfileName);
							
						logger.info("????????? ??????");
						System.out.println("e??????" + oFileName + rfileName);
						break;
					} 
					if (addon.getRfile3() == null) {
						addon.setOfile3(oFileName);
						addon.setRfile3(rfileName);
						System.out.println("3??????" + oFileName + rfileName);
						logger.info("????????? ??????");
						break;
					}


				}
			}
			int result1 = cservice.updateCfileAll(addon);
			
			cpost = cservice.selectCpOne(request.getParameter("cno"));
			obj.put("ofile1", cpost.getOfile1());
			obj.put("rfile1", cpost.getRfile1());
			obj.put("ofile2", cpost.getOfile2());
			obj.put("rfile2", cpost.getRfile2());
			obj.put("ofile3", cpost.getOfile3());
			obj.put("rfile3", cpost.getRfile3());
		
		return obj;
	}
	
	@RequestMapping(value = "cfiledown.do")
	public void cFileDown(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String oName = request.getParameter("ofile");
		String rName = request.getParameter("rfile");
		
		BufferedInputStream buffer = null;
		ServletOutputStream serout = null;

		logger.info(oName+ " ?????????????????? ??????" );

		String dir = request.getSession().getServletContext().getRealPath("resources/bupfile");
		File savedFile = new File(dir + "/" + rName);
		try {
			FileInputStream fis = new FileInputStream(savedFile);
			buffer = new BufferedInputStream(fis);
			serout = response.getOutputStream();

			String resFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			if (isMSIE) {
				resFilename = URLEncoder.encode(oName, "UTF-8");
				resFilename = resFilename.replaceAll("\\+", "%20");
			} else {
				resFilename = new String(oName.getBytes("UTF-8"), "ISO-8859-1");

			}
			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition", "attachment;filename=\"" + resFilename + "\"");
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
	
		
	@RequestMapping("delcp.do")
	public ResponseEntity<String>  deleteCpost(@RequestParam("cno") String cno, AddOn addon, Model model, HttpServletRequest request) {
		logger.info("???????????? ??????...");
		File f = new File(request.getSession().getServletContext().getRealPath("resources/bupfile"));
		if (f.isDirectory()) {
			File[] fList = f.listFiles();
			for (int i = 0; i < fList.length; i++)
				if (fList[i].getName().contains(cno)) {
					System.out.println(fList[i].getName());
					fList[i].delete();
				}
		}
		cservice.deleteCpost(cno);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
//		return "redirect:/ftables2.do?ucode=" + request.getSession().getAttribute("ucode") + "&pnum="
//				+ request.getSession().getAttribute("pnum");
	}

	@RequestMapping("/pjdetail.do")
	@ResponseBody
	public Project selectPjdetail(HttpSession session) {
		Project p = mservice.selectPjdetail((String) session.getAttribute("pnum"));

		return p;
	}

}
