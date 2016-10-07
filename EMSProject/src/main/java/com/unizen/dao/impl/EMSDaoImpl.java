package com.unizen.dao.impl;
import java.util.List;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import com.unizen.config.files.AbstractDao;
import com.unizen.dao.intrc.EMSDao;
import com.unizen.entities.EmsVotorData;
@Repository
public class EMSDaoImpl extends AbstractDao implements EMSDao {

	private static final Logger logger = Logger.getLogger(EMSDaoImpl.class);
	
	public List<EmsVotorData> fetchingEMSInfo() throws Exception {
		List<EmsVotorData> emsList=getEntityManager().createQuery("from EmsVotorData").getResultList();
			return emsList;
	}

	public List<EmsVotorData> getEMSInfomation(String constituency,	String part, String serial, String voterId) throws Exception {
		
		String query="from EmsVotorData where constituencyNo=:constituency and partNo=:part and voterIndex=:voterIndex and voterID=:voterId";
		Query q=getEntityManager().createQuery(query);
			q.setParameter("constituency", Integer.valueOf(constituency));
				q.setParameter("part", Integer.valueOf(part));
					q.setParameter("voterIndex", Integer.valueOf(serial));
						q.setParameter("voterId", voterId);
		
		List<EmsVotorData> emsList=q.getResultList();
		return emsList;
	}

	
	public EmsVotorData getExistingUserData(String vId) throws Exception {
		String query="from EmsVotorData where voterID=:voterID";
		Query q=getEntityManager().createQuery(query);
			q.setParameter("voterID", vId);
				List<EmsVotorData> emsList=q.getResultList();
				if(emsList!=null && !emsList.isEmpty()){
					return emsList.get(0);
					}else{
						return null;
					}
				
	}

	
	public EmsVotorData updateEms(EmsVotorData ems) throws Exception {
		update(ems);
			flush();
		return ems;
	}

	
	public EmsVotorData getEMSAuthCode(String code) throws Exception {
		System.out.println("codeeee"+code);
		String query="from EmsVotorData where authCode='"+code+"'";
		Query q=getEntityManager().createQuery(query);
			//q.setParameter("authCode", Integer.valueOf(code));
				List<EmsVotorData> emsList=q.getResultList();
				if(emsList!=null && !emsList.isEmpty()){
					return emsList.get(0);
				}else{
					return null;
				}
	}

	
	public EmsVotorData getEmsById(String id) throws Exception {
		String query="from EmsVotorData where id=:emsId";
		Query q=getEntityManager().createQuery(query);
			q.setParameter("emsId", Integer.valueOf(id));
				List<EmsVotorData> emsList=q.getResultList();
				if(emsList!=null && !emsList.isEmpty()){
					return emsList.get(0);
				}else{
					return null;
				}
	}

}
