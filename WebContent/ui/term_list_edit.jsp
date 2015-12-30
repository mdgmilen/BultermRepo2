<?xml version="1.0" encoding="utf-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
<jsp:text><![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ]]></jsp:text>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Terms, Bulterm.improve1.com - 5-езичен технически речник</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.improve1.bulterm.ProjectSettings" />

<body>

<div id="outer">
	<div id="header">
		<table><tr><td></td><td></td><td> 
			<h1><a href="http://bulterm.improve1.com" target="_self">BULTERM</a></h1>
	  </td></tr></table><br />
		<h3><a href="http://bulterm.improve1.com" target="_self">Bulterm.improve1.com - 5-езичен технически речник</a></h3>
	</div> <!-- header -->
	<div id="menu">
	</div> <!-- menu -->
	<div id="content">
		<div id="tertiaryContent">
		</div> <!-- tertiary -->
		<div id="primaryContentContainer">
		  <div id="primaryContent">
		  
		  
		  
		  
		    
<jsp:directive.page import="com.improve1.bulterm.TermList" />	   
		   

		   
		<jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
		<jsp:text><![CDATA[servlet/StandardListServlet" target="_blank">]]></jsp:text>	  
	      List all standards
	    <jsp:text><![CDATA[</a>]]></jsp:text>  
		   <br />
		<jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
		<jsp:text><![CDATA[servlet/TermItemEditServlet?do_what=new_term" target="_blank">]]></jsp:text>	  
	      Add new term
	    <jsp:text><![CDATA[</a>]]></jsp:text> 
		   
<jsp:include page="tlv_files/3_aboveResultsTable.jsp" />	

<jsp:scriptlet>
TermList terms = (TermList) session.getAttribute("terms");

if (terms != null) { </jsp:scriptlet>
	 <jsp:include page="tlv_files/4_resultsTableEdit.jsp" />	
<jsp:scriptlet>
} else { </jsp:scriptlet>
<table class="centerW">
<tr class="rowH"> 
  <th>#</th>
  <th>Id</th>
  <th>English</th>
  <th>Bulgarian
  <!-- place here -->
  </th>
  <th>Russian</th>
  <th>German</th>
  <th>French</th>
  <th>Description</th>
  <th>StandardId
  <!-- place here -->
  </th>
  <th>StandardIdentifier</th>
  <th>StandardName</th>
  </tr>
</table>
  <b style="color: #ff0000;"> Търсенето не върна резултати.</b>
    <!--  В базата данни няма въведени термини или възникна програмна грешка!-->
<jsp:scriptlet>
}; //else, terms != null 
session.removeAttribute("terms");
</jsp:scriptlet>  
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
			</div><!-- prContent -->
		</div><!-- prContent container -->
		<div id="secondaryContent">
		</div>
		<div class="clear"></div>
  </div> <!-- content -->
	<div id="footer">
    <div id="copyright">
		  <p> © 2010-2014 <a href="http://bulterm.improve1.com" target="_self">
		    BULTERM</a>  – v8-01052012 <br />
		  </p>				
    </div> <!-- copyright -->
  </div> <!-- footer -->
</div> <!-- outer -->

</body>
</html>
</jsp:root>
