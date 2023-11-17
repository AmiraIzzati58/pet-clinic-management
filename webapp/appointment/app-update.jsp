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
<title>Pet Clinic | Update Appointment </title>
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
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main id="container" class="clear"> 
    <!-- container body --> 
    <!-- ########################################################################################## -->	
	 <section>
    <div><input type="button" class="btn-list back" onclick="location.href='ListAppointmentController';" value="Back"/></div>
    <h1>Update Appointment Details</h1>
    <br>    
    <div id="comments" class="bground">      
 	<form action="UpdateAppointmentController" method="post">
    	
    	<div class="one_third first">
          <label for="appId">Appointment Id <span>*</span></label>
          <input type="number" readonly="readonly" name="appId" id="appId" value="<c:out value="${ap.appId}"/>" size="22">
        </div>
        
        <div class="one_third">
          <label for="appDate">Appointment Date<span>*</span></label>
             <input type="date" name="appDate" id="appDate" value="<c:out value="${ap.appDate}"/>" size="22">
        </div>
        
        <div class="one_third">
          <label for="appTime">Appointment Time<span>*</span></label>
             <input type="time" name="appTime" id="appTime" value="<c:out value="${ap.appTime}"/>" size="22">
        </div>
        
        <div class="first">
          <label for="serviceType">Service Type<span>*</span></label>
		  <select id="serviceType" name="serviceType">
		 	  <option value="<c:out value="${ap.serviceType}"/>"><c:out value="${ap.serviceType}"/></option>
              <option value="Wellness Examination">Wellness Examination</option>
              <option value="Vaccinations and Parasite Control">Vaccinations and Parasite Control</option>
              <option value="Surgery Procedures">Surgery Procedures</option>
              <option value="Dental Care">Dental Care</option>
              <option value="Microchipping">Microchipping</option>
			  <option value="Pet Boarding">Pet Boarding</option>
			  <option value="Basic Groomin">Basic Grooming</option>
			  <option value="Others">Others</option>
		</select>
        </div>
         <div class="one_third first">
          <label for="servicePrice">Service Price (RM)<span>*</span></label>
             <input type="number" name="servicePrice" id="servicePrice" value="<c:out value="${ap.servicePrice}"/>" size="22">
        </div>
        <div class="one_third">
			<label for="vetId">Vet Incharged</label>    
    			<select id="vetId" name="vetId">  
     			<c:forEach items="${vets}" var="v"> 
      				<option value="<c:out value="${v.vetId}"/>"><c:out value="${v.vetId}" /> - <c:out value="${v.vetName}" /></option>
      			</c:forEach>
   				</select>            
        </div>
        <div class="one_third">
          <label for="appStatus">Appointment Status<span>*</span></label>
		  <select id="appStatus" name="appStatus">
		  <option value="<c:out value="${ap.appStatus}"/>"><c:out value="${ap.appStatus}"/></option>
		  <option value="Not Completed">Not Completed</option>
		  <option value="Cancelled">Cancelled</option>
		  <option value="Completed">Completed</option>
		</select>
        </div>
                   
        <br>
        <div  class="first">
          <input name="reset" type="reset" value="Reset Form">
          &nbsp;
          <input name="submit" type="submit" value="Update Form">
        </div>
   		 
    </form>
    </div>
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