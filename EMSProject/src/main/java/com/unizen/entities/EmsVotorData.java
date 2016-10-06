package com.unizen.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the ems_votor_data database table.
 * 
 */
@Entity
@Table(name="ems_votor_data")
@NamedQuery(name="EmsVotorData.findAll", query="SELECT e FROM EmsVotorData e")
public class EmsVotorData implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private int age;

	private int authCode;

	private String caste;

	private int constituencyNo;

	@Column(name="`Contact No`")
	private String contact_No;

	private String economicStatus;

	private String employedN;

	private String employedY;

	private String gender;

	private int partNo;

	private String proVoter;

	private String voterExpecationS;

	private String voterExpectionC;

	@Lob
	private byte[] voterICON;

	private String voterID;

	private int voterIndex;

	public EmsVotorData() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getAuthCode() {
		return this.authCode;
	}

	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}

	public String getCaste() {
		return this.caste;
	}

	public void setCaste(String caste) {
		this.caste = caste;
	}

	public int getConstituencyNo() {
		return this.constituencyNo;
	}

	public void setConstituencyNo(int constituencyNo) {
		this.constituencyNo = constituencyNo;
	}

	public String getContact_No() {
		return this.contact_No;
	}

	public void setContact_No(String contact_No) {
		this.contact_No = contact_No;
	}

	public String getEconomicStatus() {
		return this.economicStatus;
	}

	public void setEconomicStatus(String economicStatus) {
		this.economicStatus = economicStatus;
	}

	public String getEmployedN() {
		return this.employedN;
	}

	public void setEmployedN(String employedN) {
		this.employedN = employedN;
	}

	public String getEmployedY() {
		return this.employedY;
	}

	public void setEmployedY(String employedY) {
		this.employedY = employedY;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getPartNo() {
		return this.partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public String getProVoter() {
		return this.proVoter;
	}

	public void setProVoter(String proVoter) {
		this.proVoter = proVoter;
	}

	public String getVoterExpecationS() {
		return this.voterExpecationS;
	}

	public void setVoterExpecationS(String voterExpecationS) {
		this.voterExpecationS = voterExpecationS;
	}

	public String getVoterExpectionC() {
		return this.voterExpectionC;
	}

	public void setVoterExpectionC(String voterExpectionC) {
		this.voterExpectionC = voterExpectionC;
	}

	public byte[] getVoterICON() {
		return this.voterICON;
	}

	public void setVoterICON(byte[] voterICON) {
		this.voterICON = voterICON;
	}

	public String getVoterID() {
		return this.voterID;
	}

	public void setVoterID(String voterID) {
		this.voterID = voterID;
	}

	public int getVoterIndex() {
		return this.voterIndex;
	}

	public void setVoterIndex(int voterIndex) {
		this.voterIndex = voterIndex;
	}

}