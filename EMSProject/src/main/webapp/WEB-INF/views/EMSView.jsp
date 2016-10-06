<%@page import="com.unizen.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Election Management System</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<link rel="stylesheet" href="css/EMSstyle.css"> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/validation.js"></script>

<script type="text/javascript">
/* $(document).ready(function () {
    $('#nobox').hide();
      $('#yesbox').show();
	$('#Radio1').click(function () {
      $('#nobox').hide();
      $('#yesbox').show();
});
$('#Radio2').click(function () {
     $('#yesbox').hide();
     $('#nobox').show();
});
});	 */

function LoadMyJs() {
	var emsRetriveStatus=document.getElementById("emsRetriveStatus").value;
	if(emsRetriveStatus=="null" || emsRetriveStatus==""){
		return true;
	}else{
		alert(emsRetriveStatus);
	}
}

function clearFields() {
		
	$("#constituency").val("");
	$("#part").val("");
	$("#serial").val("");
	$("#voterId").val("");
	
}

function validate() {

	var constituency = document.getElementById("constituency").value;
	var part = document.getElementById("part").value;
	var serial = document.getElementById("serial").value;
	var voterId = document.getElementById("voterId").value;
	if (constituency == null || constituency == "") {
		alert("Choose constituency#");
		return false;
	} else if (part == null || part == "") {
		alert("Choose part#");
		return false;
	} else if (serial == null || serial == "") {
		alert("Choose serial#");
		return false;
	} else if (voterId == null || voterId == "") {
		alert("Choose voterId#");
		//  date.focus();
		return false;

	} else{
    	return true;
    	}
   
}

function updateEMSAjax(votorId){
	alert("hiii");
	var votorId = document.getElementById("voterId").value;
	var age = document.getElementById("age").value;
	var gender = document.getElementById("genderId").value;
	var contact = document.getElementById("contactId").value;
	//var contact = document.getElementById("radiobtn").value;
	
	
			$.ajax(
			 {			         
			        type: "POST",
			        url: "updateEMSInfo",
			        processData: true,
			         data:{vId:""+votorId,age:""+age,gender:""+gender,contact:""+contact,}
			         
			 
			} 		
		).done(function(msg) {
			alert(msg);
		});	
			 				 
	
}
</script>
</head>
<body onLoad="LoadMyJs()">
			<%
			String constituency=request.getParameter("constituency");
			String part=request.getParameter("part");
			String serial=request.getParameter("serial");
			String voterId=request.getParameter("voterId");
			List<EmsVotorData> emsList=(List<EmsVotorData>)request.getAttribute("emsList");
			System.out.println("SIze of emsList"+emsList);
			
			String constiNo=(String)request.getAttribute("constituency");
			String pNo=(String)request.getAttribute("part");
			String sNo=(String)request.getAttribute("serial");
			String vNo=(String)request.getAttribute("voterId");
			
			if(constiNo==null){
				constiNo="";
				}
			if(pNo==null){
				pNo="";
				}
			if(sNo==null){
				sNo="";
				}
			if(vNo==null){
				vNo="";
				} 
			%>

<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
				 <a class="navbar-brand" href="#">Election Management System</a>               
            </div>        
        </div>
	</nav>
<!-- Form Start's here -->	
<form name="emsForm"  method="post" action="retrivingEmsInfo"  enctype="multipart/form-data" onsubmit="return validate()"> 
<div class="container">
	<%String emsRetriveStatus=(String)request.getAttribute("emsRetriveStatus");
            		System.out.println("Status value "+emsRetriveStatus);%>     		
          	 <input type="hidden" id="emsRetriveStatus" value="<%=emsRetriveStatus%>">
	<div class="jumbotron">   
		<hr>

		<table class="table-condensed">
			<tr style="padding: 5px;">
				<td><b>Constituency#</b></td>
				<td><input class="form-control" type="text" name="constituency" id="constituency" value="<%=constiNo %>" maxlength="3" pattern="\d{3}" title="Please enter exactly 3 digits Constituency#"  >	</td>
				<td><b>Part#</b> </td>
				<td><input class="form-control" type="text"  name="part" id="part"  value="<%=pNo %>" maxlength="3" pattern="\d{3}" title="Please enter exactly 3 digits Part#"></td>
				<td><b>Serial#</b></td>
				<td><input class="form-control" type="text" name="serial" id="serial" value="<%=sNo %>"  maxlength="4" pattern="\d{4}" title="Please enter exactly 4 digits Serial#"></td>
				<td style="white-space: nowrap;"><b>Voter Id#</b></td>
				<td><input class="form-control" type="text" name="voterId" id="voterId" value="<%=vNo %>"></td>
			</tr>
		</table>
		<br>
		<center>
			<p>
				<input type="submit" class="btn btn-lg btn-default" name="retrivebtn" value="Retrieve" />
				<input type="button" class="btn btn-lg btn-default" onclick="clearFields()" value="Clear" />
				
			</p>
		</center>
	</div>
 <%if(emsList!=null && !emsList.isEmpty()) {
 for(EmsVotorData ems : emsList){
	
 %>
 <input type="hidden" name="constituency#" id="constituency#" value="<%=ems.getConstituencyNo()%>">
  <input type="hidden" name="part#" id="part#" value="<%=ems.getPartNo()%>">
   <input type="hidden" name="serial#" id="serial#" value="<%=ems.getVoterIndex()%>">
    <input type="hidden" name="voter#" id="voter#" value="<%=ems.getVoterID()%>">
	<div class="jumbotron">  
		<div class="row">
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Age</label>
				<div class="col-xs-8">
					<input class="form-control" type="text" name="age" id="age" value="<%=ems.getAge()%>" maxlength="2" pattern="\d{2}" title="Invalid age entered">
				</div>
			</div>
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Gender </label>
				<div class="col-xs-8">
					<select class="form-control" id="genderId" value="<%=ems.getGender()%>" >
					<%if(ems.getGender().equalsIgnoreCase("M")){%>
						<option value="M">Male</option>
						<option value="F">Female</option>
					<%}else{%>	
						<option value="F">Female</option>
						<option value="M">Male</option>
						<%}%>
					</select>
				</div>
			</div>
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Voter Icon</label>
				<div class="col-xs-8">
				<a href="getImage?Id="+<%=ems.getId()%>> > Votor Image</a> 
				<!-- <a href="getImage" > Votor Image<img src="images/boynoshow.png" height="150px" width="150px" /></a>  -->
			 <%-- <a href="${pageContext.request.contextPath}/getVoterIcon/"+<%=ems.getVoterICON()%> > Votor Image</a>  --%>
			<%--  <img src="{pageContext.request.contextPath}/retrivingEmsInfo/myImage/getVoterIcon" height="150px" width="150px" /> 
			 --%>	</div>
			</div>
		</div>
		<hr>
		
		<div class="row">
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Contact</label>
				<div class="col-xs-8">
					<input class="form-control" type="text" id="contactId" value="<%=ems.getContact_No()%>" maxlength="10" pattern="\d{10}" title="Invalid Mobile#">
				</div>
			</div>
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Pro-Voter</label>
				<div class="col-xs-8">
				<%if(ems.getProVoter().equalsIgnoreCase("Y")){%>
					<label class="radio-inline">
						<input type="radio" name="radiobtn" id="radiobtn1" value="<%=ems.getProVoter() %>" checked> Yes
					</label>
					<label class="radio-inline">
						<input type="radio" name="radiobtn" id="radiobtn1" value="" > No
					</label>
					<%}else{%>
					<label class="radio-inline">
						<input type="radio" name="radiobtn" id="radiobtn1" value="" > Yes
					</label>
					<label class="radio-inline">
						<input type="radio" name="radiobtn" id="radiobtn2" value="<%=ems.getProVoter() %>" checked> No
					</label>
					<%}%>
				</div>
			</div>
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Caste  </label>
					<div class="col-xs-8">
					 <input type="text"  list="castelist" >
					<datalist  id="castelist" >
   					<option><%=ems.getCaste()%></option>
   					<option>Unizen</option>
					</datalist>
						<%-- <select class="form-control" id="casteId">
							<option><%=ems.getCaste()%></option>
							<option>MGSG</option>
							<option>PQRS</option>
							<option>TTMS</option>
							<option>KLDE</option>
						</select> --%>
					</div>
			</div>
		</div>
		<hr>		
		
		<div class="row">
			<div class="col-xs-6">
				<label for="example-text-input" class="col-xs-6 col-form-label">Economic Status</label>
			<div class="col-xs-6">
				<div class="col-xs-12">	
					<select class="form-control" id="example-text-input" style="margin-left:-95px;">
						<option><%=ems.getEconomicStatus()%></option>
						<option>MC</option>
						<option>PO</option>
						<option>BPL</option>
						</select>
				</div>
			</div>
			</div>	
			<div class="col-xs-6">
				<div class="form-group row">
						<label for="example-text-input" class="col-xs-4 col-form-label">Employed</label>
						<%if(ems.getEmployedY()!=null){ %>
						<%if(ems.getEmployedY().equalsIgnoreCase("Self")){ %>
					<div class="col-xs-4" style="margin-left:-85px;">
						<label class="radio-inline">
							<input type="radio" name="post-format" id="radio1" value="<%=ems.getEmployedY()%>" checked="checked"> Yes
						</label>
						<label class="radio-inline">
							<input type="radio" name="post-format" id="radio2" value=""> No
						</label>
					</div>
					
					<div id="yesbox" style="margin-left:-85px;">
						<label><input type="radio"  name="employeeYN" id="self" value="<%=ems.getEmployedY()%>" checked> Self </label>
						<label><input type="radio" name="employeeYN" id="govt" value=""> Govt </label>
					</div>
					<div id="nobox" style="margin-left:-85px;">
						<label><input type="radio" name="radiobtnn" value=""> HM </label>
						<label><input type="radio" name="radiobtnn" value=""> Stud </label>
						<label><input type="radio" name="radiobtnn" value=""> Other </label>
					</div>
					
					<% }else {%>
					<div class="col-xs-4" style="margin-left:-85px;">
						<label class="radio-inline">
							<input type="radio" name="radio1" id="radio1" value="<%=ems.getEmployedY()%>" checked="checked"> Yes
						</label>
						<label class="radio-inline">
							<input type="radio" name="radio2" id="radio2" value=""> No
						</label>
					</div>
					
					<div id="yesbox" style="margin-left:-85px;">
						<label><input type="radio"  name="employeeYN" id="self" value=""> Self </label>
						<label><input type="radio" name="employeeYN" id="govt" value="<%=ems.getEmployedY()%>" checked> Govt </label>
					</div>
					<div id="nobox" style="margin-left:-85px;">
						<label><input type="radio" name="radiobtnn" value=""> HM </label>
						<label><input type="radio" name="radiobtnn" value=""> Stud </label>
						<label><input type="radio" name="radiobtnn" value=""> Other </label>
					</div>
							
					
				<%}}else if(ems.getEmployedN()!=null){ %>
				<%if(ems.getEmployedN().equalsIgnoreCase("HM")){ %>
					<div class="col-xs-4" style="margin-left:-85px;">
						<label class="radio-inline">
							<input type="radio" name="post-format" id="radio1" value="" > Yes
						</label>
						<label class="radio-inline">
							<input type="radio" name="post-format" id="radio2" value="<%=ems.getEmployedN()%>" checked> No
						</label>
					</div>
					
					<div id="yesbox" style="margin-left:-85px;">
						<label><input type="radio"  name="employeeYN" id="self" value=""> Self </label>
						<label><input type="radio" name="employeeYN" id="govt" value=""> Govt </label>
					</div>
					<div id="nobox" style="margin-left:-85px;">
						<label><input type="radio" name="radiobtnn" value="<%=ems.getEmployedN()%>" checked> HM </label>
						<label><input type="radio" name="radiobtnn" value=""> Stud </label>
						<label><input type="radio" name="radiobtnn" value=""> Other </label>
					</div>
					
					
					<% }else if(ems.getEmployedN().equalsIgnoreCase("Stud")){%>
					<div class="col-xs-4" style="margin-left:-85px;">
						<label class="radio-inline">
							<input type="radio" name="radio1" id="radio1" value="" > Yes
						</label>
						<label class="radio-inline">
							<input type="radio" name="radio2" id="radio2" value="<%=ems.getEmployedN()%>" checked> No
						</label>
					</div>
					
					<div id="yesbox" style="margin-left:-85px;">
						<label><input type="radio"  name="employeeYN" id="self" value=""> Self </label>
						<label><input type="radio" name="employeeYN" id="govt" value=""> Govt </label>
					</div>
					<div id="nobox" style="margin-left:-85px;">
						<label><input type="radio" name="radiobtnn" value=""> HM </label>
						<label><input type="radio" name="radiobtnn" value="<%=ems.getEmployedN()%>" checked> Stud </label>
						<label><input type="radio" name="radiobtnn" value=""> Other </label>
					</div>
				<% }else{%>
				<div class="col-xs-4" style="margin-left:-85px;">
						<label class="radio-inline">
							<input type="radio" name="radio1" id="radio1" value="" > Yes
						</label>
						<label class="radio-inline">
							<input type="radio" name="radio2" id="radio2" value="<%=ems.getEmployedN()%>" checked> No
						</label>
					</div>
					
					<div id="yesbox" style="margin-left:-85px;">
						<label><input type="radio"  name="employeeYN" id="self" value=""> Self </label>
						<label><input type="radio" name="employeeYN" id="govt" value=""> Govt </label>
					</div>
					<div id="nobox" style="margin-left:-85px;">
						<label><input type="radio" name="radiobtnn" value=""> HM </label>
						<label><input type="radio" name="radiobtnn" value="" > Stud </label>
						<label><input type="radio" name="radiobtnn" value="<%=ems.getEmployedN()%>" checked> Other </label>
					</div>
					<%} }else {%>
					<div class="col-xs-4" style="margin-left:-85px;">
						<label class="radio-inline">
							<input type="radio" name="post-format" id="Radio1" value="" > Yes
						</label>
						<label class="radio-inline">
							<input type="radio" name="post-format" id="Radio2" value="" checked> No
						</label>
					</div>
					
					<div id="yesbox" style="margin-left:-85px;">
						<label><input type="radio"  name="radio" id="self" value=""> Self </label>
						<label><input type="radio" name="govt" id="govt" value=""> Govt </label>
					</div>
					<div id="nobox" style="margin-left:-85px;">
						<label><input type="radio" name="HM" value="" checked> HM </label>
						<label><input type="radio" name="Stud" value=""> Stud </label>
						<label><input type="radio" name="Other" value=""> Other </label>
					</div>
					
					
					<%}%>	
	  			</div> 
			</div>
		</div>
		<hr>
	 
	 	<div class="row">
	 	<%if(ems.getVoterExpecationS()!=null){ %>
			<div class="col-xs-6">		
				<label for="example-text-input" class="col-xs-6 col-form-label">Voter Expectation / Self</label>
				<div class="col-xs-5" style="margin-left:-65px;">
					<input class="form-control" type="text" value="<%=ems.getVoterExpecationS() %>" id="votorExpectationId">
				</div>
			</div>
			<%}else{ %>
			<div class="col-xs-6">		
				<label for="example-text-input" class="col-xs-6 col-form-label">Voter Expectation / Self</label>
				<div class="col-xs-5" style="margin-left:-65px;">
					<input class="form-control" type="text" value="" id="votorExpectationId">
				</div>
			</div>
			<%} %>
			
			<%if(ems.getVoterExpectionC()!=null){ %>
			<div class="col-xs-6">		
				<label for="example-text-input" class="col-xs-6 col-form-label">Constituency</label>
					<div class="col-xs-5" style="margin-left:-99px;">
						<input class="form-control" type="text" value="<%=ems.getVoterExpectionC()%>" id="constituencyId">
					</div>
			</div>	
			<%}else{ %>
			<div class="col-xs-6">		
				<label for="example-text-input" class="col-xs-6 col-form-label">Constituency</label>
					<div class="col-xs-5" style="margin-left:-99px;">
						<input class="form-control" type="text" value="" id="example-text-input">
					</div>
			</div>	
			<%} %>
		</div>
		<center>
		<p>
          <input type="button" class="btn btn-lg btn-default" onclick="updateEMSAjax('<%=ems.getVoterID()%>')" value="Update" />
		</p>
	</div>
	
	<%
 }}else { %>
	<div class="jumbotron">  
		<div class="row">
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Age</label>
				<div class="col-xs-8">
					<input class="form-control" type="text" value="Age" name="age" id="age">
				</div>
			</div>
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Gender </label>
				<div class="col-xs-8">
					<select class="form-control" id="genderId">
						<option value="0">--Select Gender--</option>
						<option>Male</option>
						<option>Female</option>
					</select>
				</div>
			</div>
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Voter Icon</label>
				<div class="col-xs-8">
					<img src="img.png" height="30" width="30" />
				</div>
			</div>
		</div>
		<hr>
		
		<div class="row">
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Contact</label>
				<div class="col-xs-8">
					<input class="form-control" type="text" value="Contact" id="contactId">
				</div>
			</div>
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Pro-Voter</label>
				<div class="col-xs-8">
					<label class="radio-inline">
						<input type="radio" name="radiobtn1" id="radiobtn1Id1" value="option1"> Yes
					</label>
					<label class="radio-inline">
						<input type="radio" name="radiobtn1" id="radiobtn1Id1" value="option2"> No
					</label>
				</div>
			</div>
			<div class="col-xs-4">		
				<label for="example-text-input" class="col-xs-4 col-form-label">Caste  </label>
					<div class="col-xs-8">
						<select class="form-control" id="example-text-input">
						<option value="0">--Select Caste--</option>
							<option>MGSG</option>
							<option>PQRS</option>
							<option>TTMS</option>
							<option>KLDE</option>
						</select>
					</div>
			</div>
		</div>
		<hr>		
		
		<div class="row">
			<div class="col-xs-6">
				<label for="example-text-input" class="col-xs-6 col-form-label">Economic Status</label>
			<div class="col-xs-6">
				<div class="col-xs-12">	
					<select class="form-control" id="example-text-input" style="margin-left:-95px;">
						<option value="0">--Select Economic--</option>
						<option>R</option>
						<option>MC</option>
						<option>PO</option>
						<option>BPL</option>
					</select>
				</div>
			</div>
			</div>	
			<div class="col-xs-6">
				<div class="form-group row">
						<label for="example-text-input" class="col-xs-4 col-form-label">Employed</label>
					<div class="col-xs-4" style="margin-left:-85px;">
						<label class="radio-inline">
							<input type="radio" name="post-format" id="radio1" value="" > Yes
						</label>
						<label class="radio-inline">
							<input type="radio" name="post-format" id="radio2" value=""> No
						</label>
					</div>
					<div id="yesbox" style="margin-left:-85px;">
						<label><input type="radio" value=""> Self </label>
						<label><input type="radio" value=""> Govt </label>
					</div>
					<div id="nobox" style="margin-left:-85px;">
						<label><input type="radio" name="HM" value=""> HM </label>
						<label><input type="radio" name="Stud" value=""> Stud </label>
						<label><input type="radio" name="Other" value=""> Other </label>
					</div>
	  			</div> 
			</div>
		</div>
		<hr>
	 
	 	<div class="row">
			<div class="col-xs-6">		
				<label for="example-text-input" class="col-xs-6 col-form-label">Voter Expectation / Self</label>
				<div class="col-xs-5" style="margin-left:-65px;">
					<input class="form-control" type="text" value="Voter Expectation" >
				</div>
			</div>
			<div class="col-xs-6">		
				<label for="example-text-input" class="col-xs-6 col-form-label">Constituency</label>
					<div class="col-xs-5" style="margin-left:-99px;">
						<input class="form-control" type="text" value="Constituency"  >
					</div>
			</div>	
		</div>
		<!-- <center>
		<p>
          <a class="btn btn-lg btn-default" href="#" role="button">Update</a>
            <input type="button" class="btn btn-lg btn-default" onclick="updateEMSInfo('')" value="Update" />
		</p> -->
		
	</div>
	<% }%>
 </div>
</form>
<!-- Form end's here -->
</body>
</html>