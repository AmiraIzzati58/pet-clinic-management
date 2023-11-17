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
<title>Pet Clinic | Prescription Update</title>
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
    <div><input type="button" class="btn-list back" onclick="location.href='ListPrescriptionController';" value="Back"/></div>
    <h1>Update Prescriptions</h1>    
    <br>
    <div id="comments" class="bground">      
    
 	<form action="UpdatePrescriptionController" method="post">
    	
    	<div class="one_half first">
        <label for="vaccineType">Vaccine Type<span>*</span></label>
		<select name="vaccineType">
			<option value="<c:out value="${p.vaccineType}"/>"><c:out value="${p.vaccineType}"/></option>
			<option value="Nonliving Vaccines">Nonliving Vaccines</option>
			<option value="Subunit Vaccines">Subunit Vaccines</option>
			<option value="Antigens">Antigens</option>		
		</select>       
		 </div>
        
        <div class="one_half">
        <label for="vaccineName">Vaccine Name <span>*</span></label>
		<input type="text" name="vaccineName" value="<c:out value="${p.vaccineName}"/>"/><br>
        </div>
        
        <div class="one_third first">
        <label for="nextVaccine">Next Vaccine<span>*</span></label>
		<input type="date" name="nextVaccine" value="<c:out value="${p.nextVaccine}"/>"/><br>	
        </div>
        
        <div class="one_third">
          <label for="expDate">Expired Date<span>*</span></label>
		<input type="date" name="expDate" value="<c:out value="${p.expDate}"/>"/><br>	
        </div>
        
        <div class="one_third">
          <label for="vetId">Vet ID Incharged<span>*</span></label>
		<input type="number" name="vetId" value="<c:out value="${p.vet.vetId}"/>"/><br>	
        </div>
        <input type="hidden" name="presId" value="<c:out value="${p.presId}"/>"/><br>
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