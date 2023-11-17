<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Pet Clinic | Registration</title>
<link rel="icon" type="image/x-icon" href="images/demo/icon.png">

<meta charset="utf-8">
<link href="layout/styles/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top" class="bgded fixed" style="background-image:url('images/demo/backgrounds/4.jpg');">
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <header id="header" class="clear" > 
    <!-- ################################################################################################ -->
    <div id="logo">
      <h1><a href="">Pet Clinic</a></h1>
      <p>Appointment Management System</p>
    </div>
    <!-- ################################################################################################ --> 
  </header>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main id="container" class="clear"> 
    <!-- container body --> 
    <!-- ########################################################################################## -->
    <div id="comments" class="bground">   
      
	<form action="RegisterController" class="center" method="post">
	<h1>Admin Registration</h1>     
		
		<div class="login-form first">
		<label for="adminEmail">Email<span>*</span></label>
		<input type="email" id="adminEmail" name="adminEmail">
		</div><br>
	
	
		<div class="login-form first">
		<label for="adminUsername">Username<span>*</span></label>
		<input type="text" name="adminUsername" class="form-control" required/>
		</div><br>
	
		<div class="login-form first">
		<label for="adminPassword">Password<span>*</span></label>
		<input type="password" id="adminPassword" name="adminPassword">
		</div><br>
	
		<div>
		<input type="submit" value="Register" onclick="myFunction()"/>
		<p>Have an account?<a href="login.jsp"> Login<span class="glyphicon glyphicon-log-out"></span></a></p>
		
		</div>	
    	</form>
	
	</div>
		      
    <!-- ########################################################################################## --> 
    <!-- / container body -->
  </main>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row5">
  <div id="copyright" class="clear"> 
    <!-- ################################################################################################ -->
        <p class="fl_center">Copyright &copy; 2022 - All Right Reserved</p>
    <!-- ################################################################################################ --> 
  </div>
</div>
<!-- JAVASCRIPTS --> 
<script src="layout/scripts/jquery.min.js"></script> 
<script src="layout/scripts/supersized/supersized.min.js"></script> 
<script>
function myFunction() {
  alert("Suceesfully register as a new admin !");
}
</script>

</body>
</html>