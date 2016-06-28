<?xml version="1.0" encoding="utf-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
<jsp:text><![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ]]></jsp:text>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Standards, Bulterm.improve1.com - 5-езичен технически речник</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" />
</head>
<!-- %@ page import="java.util.ArrayList"%> -->
<jsp:directive.page import="com.improve1.bulterm.entities.StandardList" />
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
		  
		  
		  
		  
		<jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
		<jsp:text><![CDATA[servlet/StandardItemEditServlet?do_what=new_standard" target="_blank">]]></jsp:text>	  
	      Add new standard
	    <jsp:text><![CDATA[</a>]]></jsp:text> 
	    
	    <br /><br />
	    
<jsp:scriptlet>
String columnTrClass="";
StandardList standards = (StandardList) session.getAttribute("standards");
if (standards != null) { </jsp:scriptlet>
	1 - <jsp:expression>standards.size()</jsp:expression> стандарти

<table class="centerW">
  <tr class="rowH"> <th>#</th><th>Standard Id</th><th>Standard Identifier</th><th>Standard Name</th>
  </tr>
<jsp:scriptlet>
  for (int i=0; i &lt; standards.size(); i++) { 
    if (i % 2 == 1) {
      columnTrClass = "rowA";
    }else if (i % 2 == 0) { 
      columnTrClass = "rowB";
    } </jsp:scriptlet>
  <!-- <tr class="<jsp:expression>columnTrClass</jsp:expression>"> -->
    <jsp:text><![CDATA[<tr class="]]></jsp:text>
    <jsp:expression>columnTrClass</jsp:expression>
    <jsp:text><![CDATA[">]]></jsp:text>



    <td><jsp:expression>i+1</jsp:expression></td>
    <td><jsp:expression>((Standard)standards.get(i)).getStandardId()</jsp:expression>
        <jsp:text><![CDATA[&nbsp;<a href="]]>
        </jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/StandardItemEditServlet?standard_id=]]></jsp:text><jsp:expression>((Standard)standards.get(i)).getStandardId()</jsp:expression>
		    <jsp:text><![CDATA[&amp;do_what=edit_standard" target="_blank">edit]]></jsp:text>	  
		    <jsp:text><![CDATA[</a>]]></jsp:text>  
    </td>
    <td><jsp:expression>((Standard)standards.get(i)).getStandardIdentifier()</jsp:expression></td>
    <td><jsp:expression>((Standard)standards.get(i)).getStandardName()</jsp:expression></td>
<jsp:text><![CDATA[</tr>]]></jsp:text>
<jsp:scriptlet>
  } //for 
} //if</jsp:scriptlet>
</table>


    
    
    
    
		    
		    
		    
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