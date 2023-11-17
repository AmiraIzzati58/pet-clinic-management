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
<title>Pet Clinic | Prescription List</title>
<link rel="icon" type="image/x-icon" href="images/demo/icon.png">

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
      <li><a href="#">Prescription Record</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
</div><!-- ################################################################################################ -->
<div class="wrapper row3">
  <main id="container" class="clear"> 
    <!-- container body --> 
    <!-- ########################################################################################## -->	
	 <div><input type="button" class="btn-list new" onclick="location.href='prescription/pres-add.jsp';" value="Add New"/></div>
	<h1>Prescription List</h1>
	<br>
    <table>
   <thead>
       <tr>
         <th>Id</th>
         <th>Vaccine Type</th>
         <th>Vaccine Name</th>
         <th>Vet Id Incharged</th>
         <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${preses}" var="p" varStatus="preses">
        <tr>
	       <td><c:out value="${p.presId}"/></td>
			<td><c:out value="${p.vaccineType}"/></td>
		    <td><c:out value="${p.vaccineName}"/></td>
		    <td><c:out value="${p.vet.vetId}"/></td>
		    
           <td>
           <input type="button" class="btn-list view" onclick="location.href='ViewPrescriptionController?presId=<c:out value="${p.presId}"/>'" value="View"/>
           <input type="button" class="btn-list update" onclick="location.href='UpdatePrescriptionController?presId=<c:out value="${p.presId}"/>'" value="Update"/>
           <input type="button" class="btn-list delete" onclick="location.href='DeletePrescriptionController?presId=<c:out value="${p.presId}"/>',myFunction()" value="Delete"/>
         </td>
        </tr>
      </c:forEach>        
    </tbody>
</table>
	<script>
	function myFunction() {
	  alert("Sucessfully delete a prescription");
	  window.location.href = "ListPrescriptionController";
	}
	</script>
    
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