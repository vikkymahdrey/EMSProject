package com.unizen.dao.intrc;

import java.util.List;

import com.unizen.entities.EmsVotorData;

public interface EMSDao {
	List<EmsVotorData> fetchingEMSInfo() throws Exception;
	List<EmsVotorData> getEMSInfomation(String constituency, String part,String serial, String voterId) throws Exception;
	EmsVotorData getExistingUserData(String votorId)throws Exception;
	EmsVotorData updateEms(EmsVotorData ems)throws Exception;
	EmsVotorData getEMSAuthCode(String code)throws Exception;
	EmsVotorData getEmsById(String id)throws Exception;
}
