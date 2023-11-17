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
<title>Pet Clinic | Home</title>
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
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a class="drop">Record</a>
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
<div class="wrapper">
  <div id="slider"> 
    <!-- ############################################################################################################# -->
    <div id="slidewrap">
      <div class="heading"><span id="slidecaption"></span></div>
    </div>
    <!-- ############################################################################################################# --> 
  </div>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main id="container" class="clear"> 
    <!-- container body --> 
    
    	
	
    <!-- ########################################################################################## -->
	<h1>Our Services</h1>
    
	<div class="comments center">
		<div class="one_third first">
			<div class="container">
			<img src="images/demo/treatment.jpg" alt="treatment" style="width:55%">
			<button class="btn">MEDICAL CARE</button>
			</div>
			<p>We offer a comprehensive range of services, making us your reliable partner in keeping your dogs healthy, happy, and with you for as long as possible.</p>
		</div>
		
		<div class="one_third">
			<div class="container">
			<img src="images/demo/grooming.jpg" alt="grooming" style="width:55%">
			<button class="btn">GROOMING</button>
			<p>This clinic's expert grooming crew can handle all sorts of pet grooming needs.</p>
			</div>
		</div>

		<div class="one_third">
			<div class="container">
			<img src="images/demo/implant.jpg" alt="implant" style="width:55%">
			<button class="btn">MICROCHIP IMPLANT</button>
			<p>Microchipping your pet is one approach to boost the chances of relocating your missing dog or cat. A veterinarian uses a needle to insert the microchip under the loose skin between the shoulder blades in a straightforward operation.</p>
			</div>
		</div>
		
		<div class="one_third first">
			<div class="container">
			<img src="images/demo/vaccine.jpg" alt="vaccine" style="width:55%">
			<button class="btn">VACCINATION</button>
			<p>Vaccines give protection against one or more diseases, which can reduce the severity of the disease or prevent it entirely.</p>
			</div>
		</div>
		
		<div class="one_third">
			<div class="container">
			<img src="images/demo/ultrasound.jpg" alt="ultrasound" style="width:55%">
			<button class="btn">ULTRASOUND</button>
			<p>An ultrasound can assist our Winston-Salem Internal Medicine Specialists in examining the anatomy of your pet's organs in order to detect, diagnose, and analyse blockages, tumours, or other abnormalities.</p>
			</div>
		</div>
		
		<div class="one_third">
			<div class="container">
			<img src="images/demo/surgery.png" alt="surgery" style="width:55%">
			<button class="btn">SURGERY</button>
			<p>Joint replacement (total hip, knee, and elbow replacement), fracture repair, cranial cruciate ligament deficiency stabilisation, oncologic (cancer) surgery, herniated disc treatment, complicated gastrointestinal or urogenital procedures, kidney transplant, skin grafts, complicated wound management, and minimally invasive procedures are examples of advanced surgical procedures (arthroscopy, laparoscopy, thoracoscopy)</p>
			</div>
		</div>
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
jQuery(function ($) {
    $.supersized({
        slides: [{
            image: 'images/demo/slideshow/1.png',
            title: '<span class="heading">All pets deserve great vets.</span>'
        }, {
            image: 'images/demo/slideshow/2.png',
            title: '<span class="heading">I was made for saving animal.</span>'
        }, {
            image: 'images/demo/slideshow/3.jpg',
            title: '<span class="heading">94% of pet owners say </span>their animal pal makes them<br>smile more than once a day.'
        }]
    });
});
</script>
</body>
</html>