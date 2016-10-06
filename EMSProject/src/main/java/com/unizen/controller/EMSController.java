package com.unizen.controller;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.unizen.entities.EmsVotorData;
import com.unizen.services.EMSService;


@Controller
public class EMSController{
	private static final Logger logger = Logger.getLogger(EMSController.class);
	
	@Autowired
	private EMSService emsService;
	
		
	@RequestMapping(value= {"/"}, method=RequestMethod.GET)
	public ModelAndView showIndexPage(){
		logger.debug("Default URL as '/'");
		return new ModelAndView("AuthPage");
	}
	
		
	@RequestMapping(value= {"/retrivingEmsInfo"},method={RequestMethod.POST,RequestMethod.GET})
	public String retrivingEmsInfoHandler(HttpServletRequest request,Map<String, Object> map) throws Exception{
		String constituency=request.getParameter("constituency");
		String part=request.getParameter("part");
		String serial=request.getParameter("serial");
		String voterId=request.getParameter("voterId");
		List<EmsVotorData> emsList=null;
		if(constituency!=null && part!=null && serial!=null && voterId!=null){
			emsList=emsService.getEMSInfomation(constituency,part,serial,voterId);
		}
		
		if(emsList==null || emsList.isEmpty()){
			map.put("emsRetriveStatus", "You entered Invalid Information.");
		}else{
			map.put("emsRetriveStatus", "EMS information fetched successfully.");
		}
		map.put("emsList", emsList);
			map.put("constituency", constituency);
				map.put("part", part);
					map.put("serial", serial);
						map.put("voterId", voterId);
		return "EMSView";
	}
	
	
	@RequestMapping(value= {"/emsView"},method={RequestMethod.POST,RequestMethod.GET})
	public String emsViewHandler(HttpServletRequest request,Map<String, Object> map) throws Exception{
			return "EMSView";
		}

	
	@RequestMapping(value= {"/updateEMSInfo"},method=RequestMethod.POST)
	public@ResponseBody String updateEMSInfoHandler(HttpServletRequest request,Map<String, Object> map) throws Exception{
		String returnVal="";
		String votorId=request.getParameter("vId");
		String age=request.getParameter("age");
		String gender=request.getParameter("gender");
		String contact=request.getParameter("contact");
		
		EmsVotorData ems=emsService.getExistingUserData(votorId);
						ems.setAge(Integer.valueOf(age));
							ems.setGender(gender);
								ems.setContact_No(contact);
									EmsVotorData	emsUpdated=emsService.updateEms(ems);	
									
									if(emsUpdated!=null)
									{
										returnVal="EMS information updated successfully.";
									}else{
										returnVal="EMS updatation failed.";
									}
		
				
		return returnVal;
	}
	
	@RequestMapping(value= {"/getVoterIcon/vImg/{vImg}"},method=RequestMethod.GET)
	public String displayVoterIcon(@PathVariable byte[] vImg,HttpServletRequest request,HttpServletResponse response,Map<String, Object> map) throws Exception{
		System.out.println("hiiiiiii");
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		OutputStream resp = response.getOutputStream();
			resp.write(vImg);
				resp.flush();
					resp.close();
					return "AuthView";
		
	}			
	
	@RequestMapping(value="/getImage",method={RequestMethod.POST,RequestMethod.GET})
	public void testHandler(HttpServletRequest request,HttpServletResponse response,Map<String, Object> map) throws Exception{
		//String id=request.getParameter("id");
		String id="4";
		EmsVotorData emsObj = emsService.getEmsById(id);        
	    response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
	    OutputStream resp = response.getOutputStream();
		resp.write(emsObj.getVoterICON());
			resp.flush();
				resp.close();
					
		}
	
	@RequestMapping(value= {"/authCodeSubmitted"},method={RequestMethod.POST,RequestMethod.GET})
	public String authCodeSubmittedHandler(HttpServletRequest request,Map<String, Object> map,RedirectAttributes redirectAttributes) throws Exception{
		String code=request.getParameter("code");
		EmsVotorData emsAuthCode=emsService.getEMSAuthCode(code);
		if(emsAuthCode!=null){
			return "redirect:/emsView";
		}else{
			map.put("status", "Invalid Auth code");
			return "AuthPage";	
		}
			
	}
	
	@RequestMapping(value= {"/EMSProject/id/{id}"},method={RequestMethod.POST,RequestMethod.GET})
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
