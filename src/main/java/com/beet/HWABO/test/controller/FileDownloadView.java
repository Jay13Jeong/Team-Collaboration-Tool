package com.beet.HWABO.test.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//스프링에서 뷰리졸버에 의해실행되는 뷰클래스가 되려면 반드시 AbstractView를 상속받는  후손클래스여야함 
//일반 클래스 
@Component("filedown") //stereotype component
public class FileDownloadView extends AbstractView{
	
	private static final Logger logger = LoggerFactory.getLogger(FileDownloadView.class);
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//컨트롤러에서 뷰 리졸버로 리턴한 model 정보가 이쪽으로 자동 전달됨 
		File downFile = (File)model.get("downFile");
		
		logger.info("다운파일"+downFile.getName());
		//한글파일명인코딩처리 파일명만추출
		String fileName = downFile.getName();
		//plain해야파일다운
		response.setContentType("text/plain; charset=utf-8");

				response.addHeader("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\""); // 안의	값은 정해져있다. 마음대로 쓰면 안된다.
				response.setContentLength((int)downFile.length());
				
				OutputStream out = response.getOutputStream();
				FileInputStream fin = null;
				
				try { //fin.close를 위해 별도로 예외처리함 
					fin = new FileInputStream(downFile);
					FileCopyUtils.copy(fin, out);
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					if(fin != null) {
						try {
							fin.close();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
				}
				out.flush();
				out.close();
				
	}

}
