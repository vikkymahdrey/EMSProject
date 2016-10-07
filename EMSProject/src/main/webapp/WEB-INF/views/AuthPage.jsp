<%@page import="com.unizen.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Election Management System</title>

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

function LoadMyJs() {
	var status=document.getElementById("sts").value;
	if(status=="null" || status==""){
		return true;
	}else{
		alert(status);
	}

}



 function validate() {
	var code = document.getElementById("code").value;
	if (code == null || code == "") {
		alert("Invalid auth code");
		return false;
	} else{
    	return true;
    }
    
} 
</script>
</head>
<body onLoad="LoadMyJs()">
			<%
			String code=request.getParameter("code");
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
                <center>
				 <a class="navbar-brand" href="#">Election Management System</a>
				 </center>               
            </div>        
        </div>
	</nav>

<form name="authForm"  method="post" action="authCodeSubmitted"  enctype="multipart/form-data" onsubmit="return validate()"> 
<div class="container">
		<%String status=(String)request.getAttribute("status");
            		System.out.println("Status value "+status);%>     		
          	 <input type="hidden" id="sts" value="<%=status%>">
           		
			
			
	<div class="jumbotron">  
		<div class="row">
		
	
			<div class="col-lg-2">
				<p>
					<a class="btn btn-lg btn-default" href="#" role="button">Auth Code &raquo;</a> 
					<!-- <input type="button"  id="authcode" class="btn btn-lg btn-default" value="Auth Code">  -->
				</p>
				
			</div>
			<div class="col-lg-10">
			<input type="text"  class="form-control" name="code" id="code" >
			</div>
			
		</div>
		<br>
		<center>
			<p>
				<input type="submit" class="btn btn-lg btn-default" id="authCode" name="authCode" value="Submit" />
							
			</p>
		</center>

 </div>
 </div>
</form>

</body>
</html>