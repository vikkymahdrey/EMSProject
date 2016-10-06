package com.unizen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.unizen.entities.EmsVotorData;
import com.unizen.services.EMSService;

@Controller
@RequestMapping("/myImage")
public class ImageViewerController {
	private static final Logger logger = Logger.getLogger(ImageViewerController.class);
	
	@Autowired
	private EMSService emsService;
	
	
	@RequestMapping(value= {"/getVoterIcon"},method={RequestMethod.POST,RequestMethod.GET})
	public void getVoterIconHandler(@PathVariable String id,HttpServletRequest request,HttpServletResponse response) throws Exception{
		logger.debug("hiiiii getVoterIcon Controller");
		//String id=request.getParameter("id");
		logger.debug("ID value"+id);
		EmsVotorData emsObj = emsService.getEmsById(id);        
	    response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
	    response.getOutputStream().write(emsObj.getVoterICON());
	    response.getOutputStream().close();
			
		}
}
