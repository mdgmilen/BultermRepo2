﻿<?xml version="1.0" encoding="utf-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
    
    <jsp:text>
        <![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ]]>
    </jsp:text>
    
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Bulterm.improve1.com - 5-езичен технически речник</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.improve1.bulterm.ProjectSettings" />

<!-- <![CDATA[  --> 
<!--  ]]>  -->
<jsp:scriptlet> 
//String termId = String.valueOf(session.getAttribute("term_id_back"));
//String termName = String.valueOf(session.getAttribute("term_name"));
//String termDescription = String.valueOf(session.getAttribute("term_description"));
</jsp:scriptlet>


<body>

<div id="outer">
	<div id="header">
		
		
		  <table> 
		    <tr> 
		    <td></td><td></td>
		    <td> <!-- &nbsp; -->  <!-- /a4PrevodiPr1 &#160;-->
		      <h1><a href="http://bulterm.improve1.com" target="_self">BULTERM</a></h1>
		    </td>
		    </tr>
		  </table><br />
		
		<h3><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --> 
		  <a href="http://bulterm.improve1.com" target="_self">Bulterm.improve1.com - 5-езичен технически речник</a></h3>
		
	</div>
	
	<div id="menu">
		<ul>
			
		</ul>
	</div>

	<div id="content">
		<div id="tertiaryContent">
		</div>
		<div id="primaryContentContainer">
<!-- primaryContentContainer -->
		  <div id="primaryContent">
    <h6> 
<!--old: <a href="/BultermPr1/servlet/TermListServlet?first_visit=true">Начало</a>-->
		    <jsp:text><![CDATA[<a href="]]></jsp:text>
		    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
		    <jsp:text><![CDATA[servlet/TermListServlet?first_visit=true">]]></jsp:text>	  
		      Начало<jsp:text><![CDATA[</a>]]></jsp:text>
		        -&gt; 
    <!--<jsp:text><![CDATA[<a href="]]></jsp:text>
    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
    <jsp:text><![CDATA[servlet/TermListServlet]]></jsp:text>
    <!- jsp:expression>termId /jsp:expression> ->
    <jsp:text><![CDATA[">Търсене</a>]]></jsp:text>
    -&gt; --> Вход с електронна поща </h6>

<jsp:text><![CDATA[<form name="login_form" method="post" action="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[servlet/LoginServlet">]]></jsp:text>

<input id="email_input"    type="text"     name="emailInput" size="40" value="" /><br />
<input id="password_input" type="password" name="passwordInput" size="40" value="" /><br />
 <input type="submit" size="40" value="Влез" />

<jsp:text><![CDATA[</form>]]></jsp:text>
		  </div>
<!-- primaryContentContainer -->
		</div>
		<div id="secondaryContent">
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">
    <div id="copyright">
		  <p> © 2010-2016 <a href="http://bulterm.improve1.com" target="_self">
		    BULTERM</a>  – v8-01052012 <br /> 		     
		    </p>
			
    </div>
  </div>
</div>
</body>
</html>

</jsp:root>