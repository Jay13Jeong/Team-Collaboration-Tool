package com.beet.HWABO.abc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beet.HWABO.abc.model.service.LoveService;
import com.beet.HWABO.abc.model.service.PostreplyService;
import com.beet.HWABO.abc.model.vo.Bkindup;
import com.beet.HWABO.abc.model.vo.Love;
import com.beet.HWABO.bpost.model.service.BpostService;
import com.beet.HWABO.bpost.model.vo.Bpost;
import com.beet.HWABO.cpost.model.service.CpostService;
import com.beet.HWABO.cpost.model.vo.AddOn;
import com.beet.HWABO.cpost.model.vo.Cpost;
import com.beet.HWABO.member.model.service.MemberService;
import com.beet.HWABO.member.model.vo.Member;
import com.beet.HWABO.member.model.vo.PjMember;
import com.beet.HWABO.red.model.service.RedService;
import com.beet.HWABO.red.model.vo.MemberProject;
import com.beet.HWABO.spost.model.service.SpostService;
import com.beet.HWABO.spost.model.vo.Bpostchk;
import com.beet.HWABO.spost.model.vo.Post;
import com.beet.HWABO.spost.model.vo.Spost;
import com.fasterxml.jackson.annotation.JsonAlias;

@Controller
public class abcController {

	@Autowired
	private SpostService spostService;

	@Autowired
	private BpostService bpostService;

	@Autowired
	private CpostService cservice;

	@Autowired
	private RedService redService;
	
	@Autowired
	private MemberService mservice;

	@Autowired
	private LoveService loveService;

	@Autowired
	private PostreplyService postreplyService;

	private static final Logger logger = LoggerFactory.getLogger(abcController.class);

//========== 페이지 이동 ==================================================	
	@RequestMapping("tabtest.do")
	public String selectPostTest() {
		return "abc/myBPOST2";
	}

	
	
	
	// 입력, 출력, 수정 합친것
	@RequestMapping("tables.do")
	public String moveTables() {
		return "abc/tables";
	}

	
	@RequestMapping("moveMyBpost.do")
	public String moveMyBpost(Model m) {
		
		return "abc/myBPOST";
	}
	
	@RequestMapping("insertspost.do")
	public String moveInsertSpostPage() {
		return "abc/insertSpost";
	}

	@RequestMapping("updatespost.do")
	public String moveUpdateSpostPage() {
		return "abc/updateSpost";
	}

//========== Spost (일정) 관련 메소드 ==================================================	

	// 일정 selectOne 메소드
	@RequestMapping("selectonespost.do")
	public String moveSelectOneSpostPage(Model m, String sno) {
		// 수정하기 버튼 클릭시 sno 가지고 온다. 쿼리스트링이랑 매개변수에 추가해야한다.
		sno = "s2";
		Spost spost = spostService.selectOneSpost(sno);
		String startday = spost.getSstartday().toString();
		String endday = spost.getSendday().toString();

		SimpleDateFormat recvSimpleFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		SimpleDateFormat format2 = new SimpleDateFormat("HH:mm", Locale.ENGLISH);

		try {
			java.util.Date startdate = recvSimpleFormat.parse(startday);
			java.util.Date enddate = recvSimpleFormat.parse(endday);

			startday = format1.format(startdate) + "T" + format2.format(startdate);
			endday = format1.format(enddate) + "T" + format2.format(enddate);

			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		m.addAttribute("spost", spost);
		m.addAttribute("startday", startday);
		m.addAttribute("endday", endday);
		return "abc/selectSpost";
	}

	// 일정 selectOne 메소드
		@RequestMapping("onespostup.do")
		public ModelAndView SelectOneSpost1(ModelAndView mv, String sno) {
			
			Spost spost = spostService.selectOneSpost(sno);
			mv.setViewName("abc/mainNewup");
			mv.addObject("post", spost);
			return mv;
		}
		
		// 일정 selectOne 메소드
		@RequestMapping("onespostse.do")
		public ModelAndView SelectOneSpost2(ModelAndView mv, String sno) {

			Spost spost = spostService.selectOneSpost(sno);
			mv.setViewName("abc/mainNewse");
			mv.addObject("post", spost);
			return mv;
		}
		
	
	// 일정 등록 메소드
	@RequestMapping("sinsert.do")
	public ModelAndView insertSpost(Spost spost, ModelAndView mav, @RequestParam("beforesstartday") String start,
			@RequestParam("beforesendday") String end) {
		
		logger.info("insert spost start1 : " +start);
		
		String Sstart = start.replace("T", " ");
		String Send = end.replace("T", " ");

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
			java.util.Date startdate = transFormat.parse(Sstart);
			java.util.Date enddate = transFormat.parse(Send);

			
			logger.info("insert spost start2 : " +startdate);
			
			spost.setSstartday(startdate);
			spost.setSendday(enddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		spost.setStitle(spost.getStitle().replace(" ", "&nbsp;"));
		spost.setScontent(spost.getScontent().replace("\r\n", "<br>"));
		;
		spost.setScontent(spost.getScontent().replace(" ", "&nbsp;"));
		;

		if (spostService.insertSpost(spost) > 0) {
			mav.addObject("spost", spost);
			mav.setViewName("abc/insertTest");
		} else {
			mav.addObject("spost", spost);
			mav.setViewName("abc/insertTest");
		}
		return mav;
	}

	// 일정 수정 메소드
	@RequestMapping(value = "supdate.do1", method = RequestMethod.POST)
	public String updateSpost1(Spost spost, Model m, HttpServletResponse response,
			@RequestParam("beforesstartday") String start, @RequestParam("beforesendday") String end)
			throws IOException, UnsupportedEncodingException {
		// 업데이트하면 에이작스로 이것만 보내서 표시한다.
		logger.info("supdate.do 들어옴");


		// where sno = #{sno}로 처리
		// 제목, 시작날짜, 끝날짜, 장소, 알람, 컨텐츠, 공개여부 변경
		String Sstart = start.replace("T", " ");
		String Send = end.replace("T", " ");

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
			java.util.Date startdate = transFormat.parse(Sstart);
			java.util.Date enddate = transFormat.parse(Send);

			spost.setSstartday(startdate);
			spost.setSendday(enddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		spost.setStitle(spost.getStitle().replace(" ", "&nbsp;"));
		spost.setScontent(spost.getScontent().replace("\r\n", "<br>"));
		;
		spost.setScontent(spost.getScontent().replace(" ", "&nbsp;"));
		;

		if (spostService.updateSpost(spost) > 0) {
			return "redirect:/selectonespost.do?sno=" + spost.getSno();

			// 좋아요랑 댓글 셀렉트 다시해오기 ?

		} else {

			// 실패해도 spost의 값 가지고 가고, alert창 띄우기
			return "redirect:/selectonespost.do?sno=" + spost.getSno();
		}

	}

	// 일정 수정 메소드
	@RequestMapping(value = "supdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateSpostAjax(Spost spost, Model m, HttpServletResponse response,
			@RequestParam("beforesstartday") String start, @RequestParam("beforesendday") String end)
			throws IOException, UnsupportedEncodingException {
		// 업데이트하면 에이작스로 이것만 보내서 표시한다.
		logger.info("supdate.do 들어옴");

		// where sno = #{sno}로 처리
		// 제목, 시작날짜, 끝날짜, 장소, 알람, 컨텐츠, 공개여부 변경
		String Sstart = start.replace("T", " ");
		String Send = end.replace("T", " ");

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
			java.util.Date startdate = transFormat.parse(Sstart);
			java.util.Date enddate = transFormat.parse(Send);

			spost.setSstartday(startdate);
			spost.setSendday(enddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		spost.setStitle(spost.getStitle().replace(" ", "&nbsp;"));
		spost.setScontent(spost.getScontent().replace("\r\n", "<br>"));
		;
		spost.setScontent(spost.getScontent().replace(" ", "&nbsp;"));
		;

		int result = spostService.updateSpost(spost);
		Spost returnSpost = null;
		if (result > 0) {
			returnSpost = spostService.selectOneSpost(spost.getSno());
		}
		
		JSONObject j = new JSONObject();
		
		
		j.put("sno", returnSpost.getSno());
		j.put("stitle", URLEncoder.encode(returnSpost.getStitle(), "utf-8"));
		j.put("sucode", returnSpost.getSucode());
		j.put("swriter", URLEncoder.encode(returnSpost.getSwriter(), "utf-8"));
		j.put("sstartday", returnSpost.getSstartday().toString());
		j.put("sendday", returnSpost.getSendday().toString());
		if(returnSpost.getSplace() != null) {
		j.put("splace", URLEncoder.encode(returnSpost.getSplace(), "utf-8"));
		}
		if(returnSpost.getScontent() != null) {
		j.put("scontent", URLEncoder.encode(returnSpost.getScontent(), "utf-8"));
		}
		j.put("senrolldate", returnSpost.getSenrolldate().toString());
		j.put("spnum", returnSpost.getSpnum().toString());
		j.put("stringstart", returnSpost.getStringstart().toString());
		j.put("stringend", returnSpost.getStringend().toString());

		return j.toJSONString();
	}
	
	// 일정 삭제 메소드
	@RequestMapping(value="sdelete.do", method = RequestMethod.POST )
	@ResponseBody
	public String deleteSpost(HttpServletResponse response, String sno) {

		spostService.deleteSpost(sno);

		//JSONObject json = new JSONObject();
		//json.put("sno",sno);
		//return json.toJSONString();
		return sno;
		
	}

//========== Bpost 조회 업무모아보기페이지 관련 메소드 ==================================================	

	// 원하는 업무글 유형만 보기 메소드
	@RequestMapping(value = "chooseBpost.do", method = RequestMethod.POST)
	@ResponseBody
	public String chooseBpostMethod(HttpServletResponse response, @RequestParam("ucode") String ucode,
			@RequestParam("pnum") String pnum, @RequestParam(name="types", required = false) List<String> types, Model m)
			throws UnsupportedEncodingException {

		
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();

		// json 배열 객체 생성
		JSONArray jarr = new JSONArray();
		
		if(types != null) {
			Bpostchk chk = new Bpostchk(ucode, pnum, types);

			ArrayList<Bpost> list = spostService.chooseBpost(chk);
			// list 를 jarr 로 옮겨담기 (일종의 복사)
			for (Bpost bpost : list) { // user 객체 저장용 json 객체
				JSONObject job = new JSONObject();
				job.put("bno",bpost.getBno());
				job.put("bkind", URLEncoder.encode(bpost.getBkind(), "utf-8"));
				job.put("btitle", URLEncoder.encode(bpost.getBtitle(), "utf-8"));
	
				if (bpost.getBcontent() != null) {
					job.put("bcontent", URLEncoder.encode(bpost.getBcontent(), "utf-8"));
				} else {
					job.put("bcontent", URLEncoder.encode(" ", "utf-8"));
				}
				job.put("benrolldate", bpost.getBenrolldate().toString());
	
				// jarr에 json 객체 저장
				jarr.add(job);
			}

		}
		return jarr.toJSONString();

	}
	
	//업무 모아보기 list load용 메소드
	@RequestMapping(value = "bpostload.do", method = RequestMethod.POST)
	@ResponseBody
	public String BpostPageLoad(HttpServletResponse response, PjMember pmember)	throws UnsupportedEncodingException {

		ArrayList<Bpost> list = spostService.selectMyBPOST(pmember);
		
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();

		// json 배열 객체 생성
		JSONArray jarr = new JSONArray();

		// list 를 jarr 로 옮겨담기 (일종의 복사)
		for (Bpost bpost : list) { // user 객체 저장용 json 객체
			JSONObject job = new JSONObject();
			job.put("bno",bpost.getBno());
			job.put("bkind", URLEncoder.encode(bpost.getBkind(), "utf-8"));
			job.put("btitle", URLEncoder.encode(bpost.getBtitle(), "utf-8"));
			job.put("bucode", bpost.getBucode());

			if (bpost.getBstartday() != null) {
				job.put("bstartday", bpost.getBstartday().toString());
			}
			
			if (bpost.getBendday() != null) {
				job.put("bendday", bpost.getBendday().toString());
			}
			
			if (bpost.getBcontent() != null) {
				job.put("bcontent", URLEncoder.encode(bpost.getBcontent(), "utf-8"));
			}else {
				job.put("bcontent", URLEncoder.encode("", "utf-8"));
			}
			
			if (bpost.getBchargename() != null) {
				job.put("bcharge", URLEncoder.encode(bpost.getBcharge(), "utf-8"));
				job.put("bchargename", URLEncoder.encode(bpost.getBchargename(), "utf-8"));
			}

			job.put("benrolldate", bpost.getBenrolldate().toString());

			// jarr에 json 객체 저장
			jarr.add(job);
		}
		
		return jarr.toJSONString();

	}
	
	//업무 모아보기중에 요청받은 업무 list load용 메소드
		@RequestMapping(value = "bpostload2.do", method = RequestMethod.POST)
		@ResponseBody
		public String BpostPageLoad2(HttpServletResponse response, PjMember pmember)	throws UnsupportedEncodingException {

			ArrayList<Bpost> list = spostService.selectMyRequestedBPOST(pmember);
			
			// 전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();

			// json 배열 객체 생성
			JSONArray jarr = new JSONArray();

			// list 를 jarr 로 옮겨담기 (일종의 복사)
			for (Bpost bpost : list) { // user 객체 저장용 json 객체
				JSONObject job = new JSONObject();
				job.put("bno",bpost.getBno());
				job.put("bkind", URLEncoder.encode(bpost.getBkind(), "utf-8"));
				job.put("btitle", URLEncoder.encode(bpost.getBtitle(), "utf-8"));
				job.put("bucode", bpost.getBucode());

				if (bpost.getBstartday() != null) {
					job.put("bstartday", bpost.getBstartday().toString());
				}
				
				if (bpost.getBendday() != null) {
					job.put("bendday", bpost.getBendday().toString());
				}
				
				if (bpost.getBcontent() != null) {
					job.put("bcontent", URLEncoder.encode(bpost.getBcontent(), "utf-8"));
				}else {
					job.put("bcontent", URLEncoder.encode("", "utf-8"));
				}
				
				if (bpost.getBchargename() != null) {
					job.put("bcharge", URLEncoder.encode(bpost.getBcharge(), "utf-8"));
					job.put("bchargename", URLEncoder.encode(bpost.getBchargename(), "utf-8"));
				}

				job.put("benrolldate", bpost.getBenrolldate().toString());

				// jarr에 json 객체 저장
				jarr.add(job);
			}
			
			return jarr.toJSONString();

		}
	
	
	
	@RequestMapping(value="bkindupdate.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String bkindUpdate(Bkindup bk) {
		logger.info(bk.toString());

		if(spostService.bkindUpdate(bk) > 0) {
			logger.info("상태 업데이트 성공 !!!!!!!!!!!!!!!!!!!!!!!");
		}
		return "success";
		
	}
	
	
	
	// 업무 모아보기 페이지 조회용
	@RequestMapping("mybpost.do")
	public String selectMyBPOST(Model model, PjMember pmember) {
		logger.info(pmember.toString());
		// sesison 에서 작성자 아이디, pnum 받아오기.
		// 작성자인 글
		ArrayList<Bpost> list = spostService.selectMyBPOST(pmember);

		if (list != null) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("message", "업무모아보기 페이지 조회에 실패하였습니다.");
		}
		return "abc/myBPOST";
	}
	
	// 업무 게시글 상세보기용 메소드
	@RequestMapping(value="bpostOne.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String select1Bpost(HttpServletResponse response, Model model, @RequestParam("bno") String bno) throws UnsupportedEncodingException {
		
		Bpost bpost = spostService.selectOneBpost(bno);
		model.addAttribute("post", bpost);
		return "post/bpostOneview";
	}
	
	

	// 업무 게시글 상세보기용 메소드
	@RequestMapping(value="detailview.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectOneBpost(HttpServletResponse response, Model model, @RequestParam("bno") String bno) throws UnsupportedEncodingException {

		Bpost bpost = spostService.selectOneBpost(bno);
		
		response.setContentType("application/json;charset=utf-8"); //어플리케이션이 나갈건데  json이라는 의미
		  
		JSONObject job = new JSONObject();
		  
		job.put("bno",bpost.getBno());
		job.put("bucode",bpost.getBucode());
		job.put("bkind", URLEncoder.encode(bpost.getBkind(), "utf-8"));
		job.put("btitle", URLEncoder.encode(bpost.getBtitle(), "utf-8"));
		job.put("bwriter", URLEncoder.encode(bpost.getBwriter(), "utf-8"));

		if (bpost.getBstartday() != null) {
			job.put("bstartday", bpost.getBstartday().toString());
		}
		
		if (bpost.getBendday() != null) {
			job.put("bendday", bpost.getBendday().toString());
		}
		
		if (bpost.getBcontent() != null) {
			job.put("bcontent", URLEncoder.encode(bpost.getBcontent(), "utf-8"));
		}
		
		if (bpost.getBchargename() != null) {
			job.put("bchargename", URLEncoder.encode(bpost.getBchargename(), "utf-8"));
		}
		
		if (bpost.getBrenamefile() != null) {
			job.put("brenamefile", URLEncoder.encode(bpost.getBrenamefile(), "utf-8"));
		}
		
		if (bpost.getBoriginfile() != null) {
			job.put("boriginfile", URLEncoder.encode(bpost.getBoriginfile(), "utf-8"));
		}

		job.put("benrolldate", bpost.getBenrolldate().toString());
					  
		return job.toJSONString(); //뷰 리졸버로 리턴함

	}

	// 업무 게시글 수정페이지로 이동용 메소드
	@RequestMapping("moveBpostUpdate.do")
	public String moveBpostUpdatePage(@RequestParam("bno") String bno, Model m) {
		Bpost bpost = bpostService.selectBpost(bno);
		m.addAttribute("post", bpost);
		return "post/bpostUpdatepage";
	}
	
	// 업무 게시글 수정페이지로 이동용 메소드
	@RequestMapping("moveUpdateModal.do")
	@ResponseBody
	public String moveBpostUpdateAjax(HttpServletResponse response, @RequestParam("bno") String bno, @RequestParam("pnum") String pnum,Model m) throws UnsupportedEncodingException {

		logger.info("!!!@@@@@@@@@@@@@@@@@@@@@!!!!!!!!!!!! 업데이트 모달 조회용");
		Bpost bpost = spostService.selectOneBpost(bno);
		ArrayList<MemberProject> projectMemberList = redService.selectMemberList(pnum);
		
		
		response.setContentType("application/json;charset=utf-8"); //어플리케이션이 나갈건데  json이라는 의미
		  
		JSONObject job = new JSONObject();
		
		job.put("bno",bpost.getBno());
		job.put("bucode",bpost.getBucode());
		job.put("bkind", URLEncoder.encode(bpost.getBkind(), "utf-8"));
		job.put("btitle", URLEncoder.encode(bpost.getBtitle(), "utf-8"));
		job.put("bwriter", URLEncoder.encode(bpost.getBwriter(), "utf-8"));

		if (bpost.getBstartday() != null) {
			job.put("bstartday", bpost.getBstartday().toString());
		}
		
		if (bpost.getBendday() != null) {
			job.put("bendday", bpost.getBendday().toString());
		}
		
		if (bpost.getBcontent() != null) {
			job.put("bcontent", URLEncoder.encode(bpost.getBcontent(), "utf-8"));
		}
		
		if (bpost.getBchargename() != null) {
			job.put("bchargename", URLEncoder.encode(bpost.getBchargename(), "utf-8"));
		}
		
		if (bpost.getBrenamefile() != null) {
			job.put("brenamefile", URLEncoder.encode(bpost.getBrenamefile(), "utf-8"));
		}
		
		if (bpost.getBoriginfile() != null) {
			job.put("boriginfile", URLEncoder.encode(bpost.getBoriginfile(), "utf-8"));
		}

		job.put("benrolldate", bpost.getBenrolldate().toString());
					  
		return job.toJSONString(); //뷰 리졸버로 리턴함
	}
	
	

	// 업무 게시글 수정용 메소드
	@RequestMapping(value = "bpostup.do", method = RequestMethod.POST)
	public String updatebpost(Bpost bpost, HttpServletRequest request,HttpServletResponse response,
			@RequestParam(name = "upfile", required = false) MultipartFile file,
			@RequestParam(name = "deleteFlag", required = false) String deleteFlag, PjMember pmember) throws IOException {
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");

	
		logger.info(bpost.getBkind());
		String savePath = request.getSession().getServletContext().getRealPath("resources/bupfile");
		String returnView = null;

		if (bpost.getBoriginfile() != null) {
			if (deleteFlag != null && deleteFlag.equals("yes")) {
				if (new File(savePath + "\\" + bpost.getBrenamefile()).delete()) {
					logger.info("파일 삭제 ");
					bpost.setBoriginfile(null);
					bpost.setBrenamefile(null);
				} else {
					logger.info("파일 삭제 안됨 originfile : " + bpost.getBoriginfile());
				}
			}
		}

		if (file != null && file.getOriginalFilename().length() > 0) {
			if (file != null) {
				if (!file.getOriginalFilename().equals(bpost.getBoriginfile())
						&& (new File(savePath + "\\" + bpost.getBrenamefile())
								.length() != new File(savePath + "\\" + file.getOriginalFilename()).length())) {
					if ((new File(savePath + "\\" + bpost.getBrenamefile()).delete())) {
						logger.info("파일 삭제 성공 !");
						bpost.setBoriginfile(null);
						bpost.setBrenamefile(null);
					} else {
						logger.info("파일 삭제 실패 131!");
					}
					bpost.setBoriginfile(file.getOriginalFilename());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // java.text.SimpleDateFormat
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					renameFileName += "."
							+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					bpost.setBrenamefile(renameFileName);
					try {
						file.transferTo(new File(savePath + "\\" + renameFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				} else {
					bpost.setBoriginfile(file.getOriginalFilename());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					renameFileName += "."
							+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					bpost.setBrenamefile(renameFileName);
					try {
						file.transferTo(new File(savePath + "\\" + renameFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

		bpostService.updateBpost(bpost);
		
		return "redirect:/moveMyBpost.do";
	}

	// 업무 삭제용 메소드
	@RequestMapping(value = "bpostdel.do")
	public String bpostDelete(Bpost bpost, Model model, HttpServletRequest request, PjMember pmember) {
		if (bpostService.deleteBpost(bpost) > 0) {
			String brenamefilename = bpost.getBrenamefile();
			
			if (brenamefilename != null && !brenamefilename.isEmpty()) {

				String savePath = request.getSession().getServletContext().getRealPath("resources/bupfile");
				new File(savePath + "\\" + brenamefilename).delete();
			}
		}
		return "redirect:/moveMyBpost.do";
	}

//========== 나의 화보, 너의 화보 Post 관련 메소드 ==================================================	

	// 나의 화보. 나와 관련된 게시글 목록 조회용
	@RequestMapping("myhwabo.do")
	public String myHWABO(Model m, PjMember pmember) {

		// 매개변수랑, where 절에 session에서 받아온 ucode랑 pnum 추가 해야한다.
		// Pjmember 에 ucode랑 pnum 필드 있어서 그걸로 이용해서 2개 값 담아서 이동 !

		ArrayList<Post> list = spostService.selectMyPost(pmember);
		if (list != null) {
			m.addAttribute("list", list);
		} else {
			m.addAttribute("message", "나의 화보 페이지 조회에 실패하였습니다.");
		}
		return "abc/myhwabo";
	}
	
	// 나의 화보. 나와 관련된 S게시글 목록 조회용
	@RequestMapping("myhwaboS.do")
	public String myHWABOspost(Model m, PjMember pmember) {
		ArrayList<Post> list = spostService.selectMyPOSTspost(pmember);
		if (list != null) {
			m.addAttribute("list", list);
		} else {
			m.addAttribute("message", "나의 화보 페이지 조회에 실패하였습니다.");
		}
		return "abc/myhwabo";
	}
	// 나의 화보. 나와 관련된 S게시글 목록 조회용
	@RequestMapping("myhwaboStest.do")
	@ResponseBody
	public ArrayList<Post> myHWABOsposttest(Model m, PjMember pmember) {
		ArrayList<Post> list = spostService.selectMyPOSTspost(pmember);
		if (list != null) {
			m.addAttribute("list", list);
		} else {
			m.addAttribute("message", "나의 화보 페이지 조회에 실패하였습니다.");
		}
		logger.info("list !!!!!!!!!!!!!!@@@@@#$$@#@#$%#$%" + list.toString());
		return list;
	}
	
	// 나의 화보. 나와 관련된 C게시글 목록 조회용
	@RequestMapping("myhwaboC.do")
	public String myHWABOcpost(Model m, PjMember pmember) {
		ArrayList<Post> list = spostService.selectMyPOSTcpost(pmember);
		if (list != null) {
			m.addAttribute("list", list);
		} else {
			m.addAttribute("message", "나의 화보 페이지 조회에 실패하였습니다.");
		}
		return "abc/myhwabo";
	}
	
	// 나의 화보. 나와 관련된 B게시글 목록 조회용
	@RequestMapping("myhwaboB.do")
	public String myHWABObpost(Model m, PjMember pmember) {
		ArrayList<Post> list = spostService.selectMyPOSTbpost(pmember);
		if (list != null) {
			m.addAttribute("list", list);
		} else {
			m.addAttribute("message", "나의 화보 페이지 조회에 실패하였습니다.");
		}
		return "abc/myhwabo";
	}

	// 팀원의 화보
	@RequestMapping("yourhwabo.do")
	public String yourHWABO(Model m, PjMember pmember) {
		// 팀원과 관련된 게시글을 전부 긁어와야함.

		ArrayList<Post> list = spostService.selectMyPost(pmember);
		Member teammember = mservice.selectMember(pmember.getUcode());
		if (list != null) {
			m.addAttribute("list", list);
			m.addAttribute("teammember", teammember);
		} else {
			m.addAttribute("message", "팀원의 화보 페이지 조회에 실패하였습니다.");
		}
		return "abc/yourhwabo";
	}

//3 게시글 관련 상세보기, 수정, 삭제 메소드	

	// 1. bpost
	// 업무 게시글 수정용 메소드
	@RequestMapping(value = "HBupdate.do")
	public String hwaboupdatebpost(Bpost bpost, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile file,
			@RequestParam(name = "deleteFlag", required = false) String deleteFlag, PjMember pmember) {

		logger.info(bpost.getBkind());
		String savePath = request.getSession().getServletContext().getRealPath("resources/bupfile");
		String returnView = null;

		if (bpost.getBoriginfile() != null) {
			if (deleteFlag != null && deleteFlag.equals("yes")) {
				if (new File(savePath + "\\" + bpost.getBrenamefile()).delete()) {
					logger.info("파일 삭제 ");
					bpost.setBoriginfile(null);
					bpost.setBrenamefile(null);
				} else {
					logger.info("파일 삭제 안됨 originfile : " + bpost.getBoriginfile());
				}
			}
		}

		if (file != null && file.getOriginalFilename().length() > 0) {
			if (file != null) {
				if (!file.getOriginalFilename().equals(bpost.getBoriginfile())
						&& (new File(savePath + "\\" + bpost.getBrenamefile())
								.length() != new File(savePath + "\\" + file.getOriginalFilename()).length())) {
					if ((new File(savePath + "\\" + bpost.getBrenamefile()).delete())) {
						logger.info("파일 삭제 성공 !");
						bpost.setBoriginfile(null);
						bpost.setBrenamefile(null);
					} else {
						logger.info("파일 삭제 실패 131!");
					}
					bpost.setBoriginfile(file.getOriginalFilename());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // java.text.SimpleDateFormat
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					renameFileName += "."
							+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					bpost.setBrenamefile(renameFileName);
					try {
						file.transferTo(new File(savePath + "\\" + renameFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				} else {
					bpost.setBoriginfile(file.getOriginalFilename());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					renameFileName += "."
							+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					bpost.setBrenamefile(renameFileName);
					try {
						file.transferTo(new File(savePath + "\\" + renameFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if (bpostService.updateBpost(bpost) > 0) {
			// 성공하면 bno가지고 selectOne 한번 실행
			request.setAttribute("bno", bpost.getBno());
			return "redirect:/bpostOne.do?bno=" + bpost.getBno() + "&ucode=" + pmember.getUcode() + "&pnum="
					+ pmember.getPnum();
		} else {
			// 수정실패하면 list로
			request.setAttribute("message", "업무 게시글 수정에 실패하였습니다.");
			return "redirect:/mybpost.do?ucode=" + pmember.getUcode() + "&pnum=" + pmember.getPnum();
		}
	}

	// 업무 삭제용 메소드
	@RequestMapping(value = "HBdelete.do")
	public String hwabobpostDelete(Bpost bpost, Model model, HttpServletRequest request, PjMember pmember) {
		if (bpostService.deleteBpost(bpost) > 0) {
			String brenamefilename = bpost.getBrenamefile();
			logger.info("controller brenamefilename : " + brenamefilename);

			if (brenamefilename != null && !brenamefilename.isEmpty()) {

				String savePath = request.getSession().getServletContext().getRealPath("resources/bupfile");
				new File(savePath + "\\" + brenamefilename).delete();
			}
			return "redirect:/mybpost.do?ucode=" + pmember.getUcode() + "&pnum=" + pmember.getPnum();
		} else {
			model.addAttribute("message", "업무 게시글 삭제에 실패하였습니다.");
			return "redirect:/mybpost.do?ucode=" + pmember.getUcode() + "&pnum=" + pmember.getPnum();
		}
	}

	// 2. spost
	// 일정 selectOne 메소드
	@RequestMapping("HSOne.do")
	public String hwaboselectSpost(Model m, String sno) {
		// 수정하기 버튼 클릭시 sno 가지고 온다. 쿼리스트링이랑 매개변수에 추가해야한다.
		Spost spost = spostService.selectOneSpost(sno);
		String startday = spost.getSstartday().toString();
		String endday = spost.getSendday().toString();

		SimpleDateFormat recvSimpleFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		SimpleDateFormat format2 = new SimpleDateFormat("HH:mm", Locale.ENGLISH);

		try {
			java.util.Date startdate = recvSimpleFormat.parse(startday);
			java.util.Date enddate = recvSimpleFormat.parse(endday);

			startday = format1.format(startdate) + "T" + format2.format(startdate);
			endday = format1.format(enddate) + "T" + format2.format(enddate);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		m.addAttribute("spost", spost);
		m.addAttribute("startday", startday);
		m.addAttribute("endday", endday);
		return "abc/selectSpost";
	}

	// 일정 수정 메소드
	@RequestMapping(value = "HSupdate.do", method = RequestMethod.POST)
	public String hwaboupdateSpost(Spost spost, Model m, HttpServletResponse response,
			@RequestParam("beforesstartday") String start, @RequestParam("beforesendday") String end)
			throws IOException, UnsupportedEncodingException {
		// 업데이트하면 에이작스로 이것만 보내서 표시한다.

		// where sno = #{sno}로 처리
		// 제목, 시작날짜, 끝날짜, 장소, 알람, 컨텐츠, 공개여부 변경
		String Sstart = start.replace("T", " ");
		String Send = end.replace("T", " ");

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
			java.util.Date startdate = transFormat.parse(Sstart);
			java.util.Date enddate = transFormat.parse(Send);

			spost.setSstartday(startdate);
			spost.setSendday(enddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		spost.setStitle(spost.getStitle().replace(" ", "&nbsp;"));
		spost.setScontent(spost.getScontent().replace("\r\n", "<br>"));
		;
		spost.setScontent(spost.getScontent().replace(" ", "&nbsp;"));
		;

		if (spostService.updateSpost(spost) > 0) {
			return "redirect:/selectonespost.do?sno=" + spost.getSno();

			// 좋아요랑 댓글 셀렉트 다시해오기 ?

		} else {

			// 실패해도 spost의 값 가지고 가고, alert창 띄우기
			return "redirect:/selectonespost.do?sno=" + spost.getSno();
		}

	}

	// 일정 삭제 메소드
	@RequestMapping("HSdelete.do")
	public String hwabodeleteSpost(HttpServletResponse response, String sno) throws IOException {
		response.setCharacterEncoding("UTF-8"); response.setContentType("text/html; charset=UTF-8");

		
		PrintWriter out = response.getWriter();

		if (spostService.deleteSpost(sno) > 0) {
			out.println("<script>alert('일정 게시글 삭제가 완료되었습니다.');</script>");

			out.flush();
			out.close();
			return "redirect:/myhwabo.do";
		} else {
			out.println("<script>alert('일정 게시글 삭제에 실패하였습니다.');</script>");

			out.flush();
			out.close();
			return "redirect:/myhwabo.do";
		}
	}

	// 3. cpost
	// 글 상세보기용 메소드
	@RequestMapping("HCOne.do")
	public ModelAndView selectCpOne(HttpServletRequest request, ModelAndView mv) {

		logger.info(request.getParameter("cno"));
		Cpost cpost = cservice.selectCpOne(request.getParameter("cno"));

		if (cpost != null) {
			mv.addObject("post", cpost);
			mv.setViewName("suugit/tables2");
		} else {
			mv.addObject("message", "글을 조회할 수 없습니다!");
			mv.setViewName("common/error");
		}
		return mv;
	}

	@RequestMapping("moveHCUpdate.do")
	public String moveUpdateCpost(Cpost cpost, Model model) {
		model.addAttribute("cpost", cpost);
		return "suugit/cpostUpdateForm";

	}

	@RequestMapping("HCupdate.do")
	public void updateCpost(Cpost cpost, AddOn addon, MultipartHttpServletRequest request, ModelAndView mav) {
		// 다중파일이라 완성되면 옮겨오기

	}

	@RequestMapping("HCdelete.do")
	public String deleteCpost(@RequestParam("cno") String cno, AddOn addon, Model model, HttpServletRequest request) {

		File f = new File(request.getSession().getServletContext().getRealPath("resources/bupfile"));
		if (f.isDirectory()) {
			File[] fList = f.listFiles();
			for (int i = 0; i < fList.length; i++)
				if (fList[i].getName().contains(cno)) {
					System.out.println(fList[i].getName());
					fList[i].delete();
				}
		}

		if (cservice.deleteCpost(cno) > 0) {
			return "suugit/tables";
		} else {
			return "common/error";
		}

	}

//========== 좋아요 관련 메소드 ==================================================	

	// 좋아요 카운트 조회
	@RequestMapping("slovecount.do")
	public String selectCountLove(String no, Model m) {

		return "";
	}

	// 좋아요 눌렀던 글인지 조회
	@RequestMapping("slovecheck.do")
	public String selectDuplicationChk(Love love, Model m) {

		return "";
	}

	// 일정 좋아요 증가
	@RequestMapping("slove.do")
	public String insertSpostLove(Love love, Model m) {
		String result = "";
		if (loveService.selectDuplicationChk(love) > 0) {
			m.addAttribute("dupli");// 이미 좋아요 누른 글일 때
		} else {
			if (loveService.insertSpostLove(love) > 0) {
				m.addAttribute("success");
				result = "redirect:/myhwabo.do";
			} else {
				m.addAttribute("fail");
				result = "redirect:/myhwabo.do";
			}
		}
		return "redirect:/myhwabo.do";
	}

	// 일정 좋아요 취소
	@RequestMapping("sunlove.do")
	public String deleteSpostLove() {
		return "";
	}

//========== 좋아요 관련 메소드 ==================================================	

	// 게시글에 댓글 조회
	@RequestMapping("ssereply.do")
	public String selectPostReply() {

		return "";
	}

	// 게시글에 댓글 등록
	@RequestMapping("sinreply.do")
	public String insertPostReply() {

		return "";
	}

	// 게시글에 댓글 수정
	@RequestMapping("supreply.do")
	public String updatePostReply() {
		return "";
	}

	// 게시글에 댓글 삭제
	@RequestMapping("sdereply.do")
	public String deletePostReply() {
		return "";
	}

}
