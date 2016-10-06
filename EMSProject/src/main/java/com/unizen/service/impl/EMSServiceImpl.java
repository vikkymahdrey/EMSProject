package com.unizen.service.impl;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unizen.dao.intrc.EMSDao;
import com.unizen.entities.EmsVotorData;
import com.unizen.services.EMSService;
@Service
public class EMSServiceImpl  implements EMSService {

	private static final Logger logger = Logger.getLogger(EMSServiceImpl.class);
	
	@Autowired
	private EMSDao empDao;
	
	public List<EmsVotorData> fetchingEMSInfo() throws Exception{
		return empDao.fetchingEMSInfo();
	}

	
	public List<EmsVotorData> getEMSInfomation(String constituency,	String part, String serial, String voterId) throws Exception {
			return empDao.getEMSInfomation(constituency,part,serial,voterId);
	}


	public EmsVotorData getExistingUserData(String votorId) throws Exception {
		return empDao.getExistingUserData(votorId);
	}


	public EmsVotorData updateEms(EmsVotorData ems) throws Exception {
		return empDao.updateEms(ems);
	}


	public EmsVotorData getEMSAuthCode(String code) throws Exception {
		
		return empDao.getEMSAuthCode(code);
	}


	public EmsVotorData getEmsById(String id) throws Exception {
		return empDao.getEmsById(id);
	}

}
