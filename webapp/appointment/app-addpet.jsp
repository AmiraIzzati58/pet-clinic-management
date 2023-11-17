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
<title>Pet Clinic | New Appointment</title>
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
      <li><a href="#">Appointment Record</a></li>
      <li><a href="#">New Appointment</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
</div><!-- ################################################################################################ -->
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main id="container" class="clear"> 
    <!-- container body --> 
    <!-- ########################################################################################## -->
	   	<div><input type="button" class="btn-list back" onclick="location.href='../ListAppointmentController';" value="Back"/></div>
	  <h1>New Appointment</h1>     
	  <div id="comments" class="bground">      
      <form action="AddPetController" method="post">
      
        <div class="first">
      	<p style="font-size:18px;font-weight:medium;">Pet Details </p>
      	</div>
      	
        <div class="one_half first">
          <label for="petName">Pet's Name <span>*</span></label>
          <input type="text" name="petName" id="petName" value="" size="22">
        </div>
        
        <div class="one_half ">
          <label for="petDOB">Pet's DOB <span>*</span></label>
          <input type="date" name="petDOB" id="petDOB" value="" size="22">
        </div>
        
        <div class="one_third first ">
        <label for="petBreed">Pet's Breed <span>*</span></label>
        <input type="text" name="petBreed" id="petBreed" value="" size="22">
        </div>
        
       <div class="one_third">
        <label for="petSex">Pet's Sex:</label>
		<select id="petSex" name="petSex">
		  <option value="">--choose pet's sex--</option>
		  <option value="Female">Female</option>
		  <option value="Male">Male</option>
		</select>
        </div>

		 <div class="one_third">
        <label for="petColor">Pet's Color:</label>
		<select id="petColor" name="petColor">
		  <option value="">----choose pet's color----</option>
		  <option value="White">White</option>
		  <option value="Orange">Orange</option>
		  <option value="Black">Black</option>
		  <option value="Brown">Brown</option>
		  <option value="Grey">Grey</option>
		  <option value="Mixed">Mixed</option>
		  <option value="Other">Other</option>
		</select>
        </div>
		
		<div class="first">
		<label for="ownerId">Owner Name</label>    
    	<select id="ownerId" name="ownerId">  
     	<c:forEach items="${owners}" var="o"> 
      		<option value="<c:out value='${o.ownerId}'/>"><c:out value="${o.ownerId}" /> - <c:out value="${o.ownerName}" /></option>
      	</c:forEach>
   		</select>
		</div>
      <br>
        <div class="first">
          <input name="reset" type="reset" value="Reset Form">
          &nbsp;
          <input name="submit" type="submit" value="Next">
        </div>
        
       </form>
    </div>
    <!-- ########################################################################################## --> 
    <!-- / container body -->
    <div class="clear"></div>
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
  alert("Sucessfully create a new appointment !");
}
</script>

</body>
</html>