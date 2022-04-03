package com.beet.HWABO.reply.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

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

import com.beet.HWABO.reply.model.service.ReplyService;
import com.beet.HWABO.reply.model.vo.Reply;

@Controller
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value = "insertreply.do", method = RequestMethod.POST)
	public void insertReply(Reply reply, HttpServletResponse response) throws IOException {
		 logger.info("insertReply.do run...");
	      logger.info("Reply controller : " + reply);
	      
	      response.setContentType("text/html; charset=utf-8");      
	      PrintWriter out = response.getWriter();      
	     
	      if(replyService.insertReply(reply) > 0) {
	    	  logger.info("댓글 인써트 성공!!!!");
	    	  out.append("ok");
	          out.flush();
	          

	      }else {
	          logger.info("cabinet 인서트 실패");
	          out.append("fail");
	          out.flush();
	       }
	       out.close();
	    
	     	
	}
	
	
	@RequestMapping(value= "insertRereply", method = RequestMethod.POST)
	public void insertRerely(Reply reply, HttpServletResponse response) throws IOException {
		 logger.info("답글.do run...");
	     logger.info("Reply controller : " + reply);
		
	     response.setContentType("text/html; charset=utf-8");      
	      PrintWriter out = response.getWriter();    
	      
	      if(replyService.insertRereply(reply) > 0) {
	    	  logger.info("댓글 인써트 성공!!!!");
	    	  out.append("ok");
	          out.flush();
	          

	      }else {
	          logger.info("cabinet 인서트 실패");
	          out.append("fail");
	          out.flush();
	       }
	       out.close();
	    
	     	
		
		
		
	}
	
	
	
	@RequestMapping(value = "replyList.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectListReply(HttpServletResponse response, Model m) throws UnsupportedEncodingException {
		
		logger.info("replyList.do run ........................");
		ArrayList <Reply> list = replyService.selectList();
		
		JSONObject sendJson = new JSONObject();

		// json 배열 객체 생성
		JSONArray jarr = new JSONArray();

		logger.info(list.toString());
		
		if (!list.isEmpty()) {
			for (Reply n : list) {
				JSONObject job = new JSONObject();
		
				job.put("replyno", n.getReplyno());
				job.put("no", n.getNo());
				job.put("content",URLEncoder.encode(n.getContent(), "utf-8"));
				job.put("ucode", n.getUcode());
				job.put("uname", URLEncoder.encode(n.getUname(), "utf-8"));
				job.put("enrolldate", n.getEnrolldate().toString());
				if(n.getSecondenroll() != null) {
				job.put("secondenroll", n.getSecondenroll().toString());
				}
				job.put("parent", n.getParent());
				job.put("kind", n.getKind());
				
				jarr.add(job);
			}
			sendJson.put("list", jarr);
			return sendJson.toJSONString(); // jsonView 로 리턴됨.
		} else {
			m.addAttribute("message", "댓글 리스트 가져오기 실패");
			return "common/error";
		}
	}
	
	
	  @RequestMapping(value="updatereply.do", method = RequestMethod.POST) //댓글 수정  
	  @ResponseBody
	    private int replyupdate(Reply reply) throws Exception{
	    logger.info("reply controller reply :"+ reply);
	        return replyService.updatereply(reply);
	    }
	

	  @RequestMapping("deletereply.do") //댓글 삭제  
	  @ResponseBody
	  private int replydelete(Reply reply) throws Exception{
		  logger.info("reply controller reply :"+ reply);
	      return replyService.deletereply(reply);
	    }
	    
	

	  
	@RequestMapping("selectOneReply.do")
    @ResponseBody
	public List<Reply> selectOneReply(@RequestParam("no") String no, Model model) throws Exception{

		
		return replyService.selectOneList(no);
	}
	
	
	
}



















