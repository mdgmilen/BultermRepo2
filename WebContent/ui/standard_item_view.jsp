<?xml version="1.0" encoding="utf-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
<jsp:text><![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ]]></jsp:text>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Bulterm.improve1.com - 5-езичен технически речник</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" />
</head>
<!-- %@ page import="java.util.ArrayList"%> -->
<jsp:directive.page import="com.improve1.bulterm.entities.Standard" />
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
		  
		  
		  
		  
		  
	    
<jsp:scriptlet>
String modeS = String.valueOf(session.getAttribute("mode"));
</jsp:scriptlet>
<br />

<jsp:scriptlet>
Standard standardS = (Standard) session.getAttribute("standard");
if (modeS.equals("edit")) { </jsp:scriptlet>
<jsp:text><![CDATA[<form name="standard_form" method="post" action="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[servlet/StandardItemEditServlet">]]></jsp:text>
<jsp:text><![CDATA[Standard Id: ]]></jsp:text>
<jsp:expression>standardS.getStandardId()</jsp:expression>
<jsp:text><![CDATA[<br /><br />Standard Identifier: ]]></jsp:text>
<jsp:text><![CDATA[<input id="action" type="text" name="s_identifier" size="100" value="]]></jsp:text>
<jsp:expression>standardS.getStandardIdentifier()</jsp:expression>
<jsp:text><![CDATA[" />]]></jsp:text>
<jsp:text><![CDATA[<br /><br />Standard Name: ]]></jsp:text>
<jsp:text><![CDATA[<input id="action" type="text" name="s_name" size="100" value="]]></jsp:text>
<jsp:expression>standardS.getStandardName()</jsp:expression>
<jsp:text><![CDATA[" /><br />]]></jsp:text>
<br /><br />
<input type="submit" size="40" value="Save" />
<div class="my_content_container">
    <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/StandardItemEditServlet">]]></jsp:text>	  
	      Cancel
	    <jsp:text><![CDATA[</a>]]></jsp:text>
</div>
<jsp:text><![CDATA[</form>]]></jsp:text>
<br /><br />


<jsp:scriptlet>
} else if (modeS.equals("new")) { </jsp:scriptlet>
		<jsp:text><![CDATA[<form name="standard_form" method="post" action="]]></jsp:text>
		<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
		<jsp:text><![CDATA[servlet/StandardItemEditServlet">]]></jsp:text>
		<jsp:text><![CDATA[Standard Id: XXX]]></jsp:text>
		<jsp:text><![CDATA[<br /><br />Standard Identifier: ]]></jsp:text>
		<jsp:text><![CDATA[<input id="action" type="text" name="s_identifier" size="100" value="]]></jsp:text>
		<jsp:text><![CDATA[" />]]></jsp:text>
		<jsp:text><![CDATA[<br /><br />Standard Name: ]]></jsp:text>
		<jsp:text><![CDATA[<input id="action" type="text" name="s_name" size="100" value="]]></jsp:text>
		<jsp:text><![CDATA[" /><br />]]></jsp:text>
		<br /><br />
		<input type="submit" size="40" value="Save" />
		<div class="my_content_container">
		    <jsp:text><![CDATA[<a href="]]></jsp:text>
			    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/StandardItemEditServlet">]]></jsp:text>	  
			      Cancel
			    <jsp:text><![CDATA[</a>]]></jsp:text>
		</div>
		<jsp:text><![CDATA[</form>]]></jsp:text>
		<br /><br />
<jsp:scriptlet>
} else if (modeS.equals("review")) { 
  if (standardS != null) { </jsp:scriptlet>
	  Standard Id: <jsp:expression>standardS.getStandardId()</jsp:expression>
	        <jsp:text><![CDATA[&nbsp;<a href="]]>
	        </jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/StandardItemEditServlet?standard_id=]]></jsp:text><jsp:expression>standardS.getStandardId()</jsp:expression>
			    <jsp:text><![CDATA[&amp;do_what=edit_standard">edit]]></jsp:text>	  
			    <jsp:text><![CDATA[</a>]]></jsp:text> 
		<br /><br />
	  Standard Identifier: <jsp:expression>standardS.getStandardIdentifier()</jsp:expression><br /><br />
	  Standard Name: <jsp:expression>standardS.getStandardName()</jsp:expression><br /><br /><br />
	  <jsp:scriptlet>session.removeAttribute("standard");
	  							session.removeAttribute("mode");</jsp:scriptlet>
	  <br /><br /><br /><br />							
	        <jsp:text><![CDATA[&nbsp;<a href="]]>
	        </jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/StandardItemEditServlet?standard_id=]]></jsp:text><jsp:expression>standardS.getStandardId()</jsp:expression>
			    <jsp:text><![CDATA[&amp;do_what=delete_standard">delete standard]]></jsp:text>	  
			    <jsp:text><![CDATA[</a>]]></jsp:text> 
		<br /><br />
  <jsp:scriptlet>
  } //if review </jsp:scriptlet>
  <b>Now, it is safe to close this window.</b>
  
  <jsp:scriptlet>
} else if (modeS.equals("delete")) { </jsp:scriptlet>
ARE YOU SURE, YOU WOULD LIKE TO DELETE THIS STANDARD!<br /><br />
<jsp:text><![CDATA[<form name="standard_form" method="post" action="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[servlet/StandardItemEditServlet">]]></jsp:text>
<jsp:text><![CDATA[Standard Id: ]]></jsp:text>
<jsp:expression>standardS.getStandardId()</jsp:expression>
<jsp:text><![CDATA[<br /><br />Standard Identifier: ]]></jsp:text>
<jsp:expression>standardS.getStandardIdentifier()</jsp:expression>
<jsp:text><![CDATA[<br /><br />Standard Name: ]]></jsp:text>
<jsp:expression>standardS.getStandardName()</jsp:expression>
<br /><br />
<input type="submit" size="40" value="DELETE" />
<div class="my_content_container">
    <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/StandardItemEditServlet">]]></jsp:text>	  
	      Cancel
	    <jsp:text><![CDATA[</a>]]></jsp:text>
</div>
<jsp:text><![CDATA[</form>]]></jsp:text>
<br /><br />
  
  
<jsp:scriptlet>
} //else mode is delete</jsp:scriptlet>

    
    
    
		    
		    
		    
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