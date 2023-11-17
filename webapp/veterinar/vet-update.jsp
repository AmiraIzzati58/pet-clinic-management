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
<title>Pet Clinic | Veterinar Update</title>
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
    <div><input type="button" class="btn-list back" onclick="location.href='ListVeterinarController';" value="Back"/></div>
    <h1>Update Veterinar Details</h1>    
    <br><br>
    <div id="comments" class="bground">      
    
 	<form action="UpdateVeterinarController" method="post">
    	
    	<div class="first">
          <label for="vetName">Vet's Name <span>*</span></label>
          <input type="text" name="vetName" id="vetName" value="<c:out value="${v.vetName}"/>" size="22">
        </div>
        
        <div class="one_third first">
          <label for="vetPhoneNo">Vet's Phone Number <span>*</span></label>
             <input type="number" name="vetPhoneNo" id="vetPhoneNo" value="<c:out value="${v.vetPhoneNo}"/>" size="22">
        </div>
        
        <div class="one_third">
          <label for="vetEmail">Vet's Email<span>*</span></label>
             <input type="email" name="vetEmail" id="vetEmail" value="<c:out value="${v.vetEmail}"/>" size="22">
        </div>
        
        <div class="one_third">
          <label for="vetHiredDate">Vet's Hired Date<span>*</span></label>
             <input type="date" name="vetHiredDate" id="vetHiredDate" value="<c:out value="${v.vetHiredDate}"/>" size="22">
        </div>
        
        <div class="block clear">
          <label for="vetAddress">Vet's Address <span>*</span></label>          
          <textarea name="vetAddress" id="vetAddress" cols="10" rows="3"><c:out value="${v.vetAddress}"/></textarea>
        </div>
        <input type="hidden" name="vetId" value="<c:out value="${v.vetId}"/>"/><br>
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