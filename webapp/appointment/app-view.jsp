<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
  <%
  
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("sessionEmail")==null)
      response.sendRedirect("login.jsp");
 	  System.out.println(session);
  %> 
  
<!DOCTYPE html>
<html>
<head>
<title>Pet Clinic | Appointment Detail</title>
<link rel="icon" type="image/x-icon" href="images/demo/icon.png">

<meta charset="utf-8">
<link href="layout/styles/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top" class="bgded fixed" style="background-image:url('images/demo/backgrounds/4.jpg');">
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <header id="header" class="clear"> 
    <!-- ################################################################################################ -->
    <div id="logo">
      <h1><a href="index.jsp">Pet Clinic</a></h1>
      <p>Appointment Management System</p>
  </div>
    <nav id="mainav">
      <ul class="clear">
        <li><a href="index.jsp">Home</a></li>
        <li class="active"><a class="drop">Record</a>
          <ul>
            <li><a href="ListOwnerController">Owner</a></li>            
            <li><a href="ListVeterinarController">Veterinar</a></li>
            <li><a href="ListAppointmentController">Appointment</a></li>
            <li><a href="ListPrescriptionController">Prescriptions</a></li>
            <li><a href="ListPetController">Pet</a></li>
          </ul>
        </li>
        <li><a href="about-us.jsp">About Us</a></li>
        <li><a href="LoginLogoutController">Logout</a></li>  
        <li style="font-size:13px;">&nbsp;<%	String adminUsername = (String)session.getAttribute("sessionUsername");%>
		Welcome, <b> <%= adminUsername %> </b></li>   
      </ul>
    </nav>
    <!-- ################################################################################################ --> 
  </header>
</div>
<!-- ################################################################################################ --> 
<div class="wrapper row2">
  <div id="breadcrumb"> 
    <!-- ################################################################################################ -->
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Record</a></li>
      <li><a href="#">Owner Record</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
</div><!-- ################################################################################################ -->
<div class="wrapper row3">
  <main id="container" class="clear"> 
    <!-- container body --> 
    <!-- ########################################################################################## -->	
	<section>
    <div><input type="button" class="btn-list back" onclick="location.href='ListAppointmentController';" value="Back"/></div>
    <h1> Appointment Details</h1>
 	<br><br>    
    <table style="text-align:left">
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Appointment Id</th>
	    <td><c:out value="${ap.appId }"/></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Appointment Date</th>
	    <td><c:out value="${ap.appDate}"/></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Appointment Time</th>
	    <td><c:out value="${ap.appTime}"/></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Service Type</th>
	    <td><c:out value="${ap.serviceType}"/></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Service Price (RM)</th>
	    <td><c:out value="${ap.servicePrice}"/></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Vet Incharged Name</th>
	    <td><c:out value="${ap.vet.vetName }"/></td>
	  </tr>
	  <tr>
	    <th scope="row" style="width:30%;text-align:center">Pet Name</th>
	    <td><c:out value="${ap.pet.petName }"/></td>
	  </tr>
	   <tr>
	    <th scope="row" style="width:30%;text-align:center">Admin Incharged Name</th>
	    <td><c:out value="${ap.admin.adminUsername }"/></td>
	  </tr>
	  <%--
	  	double price = Double.parseDouble(request.getParameter("servicePrice"));
	  	double total;
	  	total = price + 40;
	  
	  --%>
	   <tr>
	    <th scope="row" style="width:30%;text-align:center">Total Payment (RM)</th>
	    <td><c:out value="${a.servicePrice}"/></td>
	  </tr>
	</table>
    
    </section>
    
    <!-- ########################################################################################## --> 
    <!-- / container body -->
    <div class="clear"></div>
  </main>
</div>
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

</body>
</html>