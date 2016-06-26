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
<jsp:directive.page import="com.improve1.bulterm.entities.Term" />
<jsp:directive.page import="com.improve1.bulterm.entities.TermNameList" />
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
String modeS   = String.valueOf(session.getAttribute("mode"));
String actionS = String.valueOf(session.getAttribute("action"));
//System.out.println(actionS);

</jsp:scriptlet>
<br />

<jsp:scriptlet>
Term termS = (Term) session.getAttribute("term");
TermNameList termNames = null;

if ( ( modeS.equals("new") || modeS.equals("edit") ) &amp;&amp;
     ( actionS.equals("new_tenglish")   || actionS.equals("edit_tenglish")   ||
       actionS.equals("new_tbulgarian") || actionS.equals("edit_tbulgarian") ||
       actionS.equals("new_trussian")   || actionS.equals("edit_trussian")   ||
       actionS.equals("new_tgerman")    || actionS.equals("edit_tgerman")    ||
       actionS.equals("new_tfrench")    || actionS.equals("edit_tfrench") 
     )
) { 
		termNames = termS.getTermNames();
		Integer termId = termS.getTermId();
		session.setAttribute("termNames", termNames);
		session.setAttribute("currTermId", termId);  </jsp:scriptlet>
    <jsp:include page="tlv_files/4_item_TermNamesEdit.jsp" />	
    <jsp:scriptlet>
    session.removeAttribute("termNames");
    session.removeAttribute("currTermId"); </jsp:scriptlet>


<jsp:scriptlet>
} else if (modeS.equals("new") &amp;&amp; actionS.equals("new_tdescription")) { </jsp:scriptlet>
<jsp:text><![CDATA[<form name="term_form" method="post" action="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>
<jsp:text><![CDATA[Term Description: ]]></jsp:text>
<jsp:text><![CDATA[<input id="action" type="text" name="t_description" size="100" value="]]></jsp:text>
<jsp:text><![CDATA[" />]]></jsp:text>
<br /><br />
<input type="submit" size="40" value="Save" />
<div class="my_content_container">
    <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>	  
	      Cancel
	    <jsp:text><![CDATA[</a>]]></jsp:text>
</div>
<jsp:text><![CDATA[</form>]]></jsp:text>
<br /><br />

<jsp:scriptlet>
} else if (modeS.equals("edit") &amp;&amp; actionS.equals("edit_tdescription")) { </jsp:scriptlet>
<jsp:text><![CDATA[<form name="term_form" method="post" action="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>
<jsp:text><![CDATA[Term Description: ]]></jsp:text>
<jsp:text><![CDATA[<input id="action" type="text" name="t_description" size="100" value="]]></jsp:text>
<jsp:expression>termS.getTermDescription()</jsp:expression>
<jsp:text><![CDATA[" />]]></jsp:text>
<br /><br />
<input type="submit" size="40" value="Save" />
<div class="my_content_container">
    <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>	  
	      Cancel
	    <jsp:text><![CDATA[</a>]]></jsp:text>
</div>
<jsp:text><![CDATA[</form>]]></jsp:text>
<br /><br />

<jsp:scriptlet>
} else if (modeS.equals("new") &amp;&amp; actionS.equals("new_tstandard")) { 
  //System.out.println("action: "+actionS);
</jsp:scriptlet>
<jsp:text><![CDATA[<form name="term_form" method="post" action="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>
<jsp:text><![CDATA[Standard Id: ]]></jsp:text>
<jsp:text><![CDATA[<input id="action" type="text" name="t_standardId" size="100" value="]]></jsp:text>
<jsp:text><![CDATA[" />]]></jsp:text>
<br /><br />
<input type="submit" size="40" value="Save" />
<div class="my_content_container">
    <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>	  
	      Cancel
	    <jsp:text><![CDATA[</a>]]></jsp:text>
</div>
<jsp:text><![CDATA[</form>]]></jsp:text>
<br /><br />

<jsp:scriptlet>
} else if (modeS.equals("edit") &amp;&amp; actionS.equals("edit_tstandard")) { </jsp:scriptlet>
<jsp:text><![CDATA[<form name="term_form" method="post" action="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>
<jsp:text><![CDATA[Standard Id: ]]></jsp:text>
<jsp:text><![CDATA[<input id="action" type="text" name="t_standardId" size="100" value="]]></jsp:text>
<jsp:expression>termS.getStandardId()</jsp:expression>
<jsp:text><![CDATA[" />]]></jsp:text>
<jsp:text><![CDATA[<br /><br />Standard Identifier: ]]></jsp:text>
<jsp:expression>termS.getStandardIdentifier()</jsp:expression>
<jsp:text><![CDATA[<br /><br />Standard Name: ]]></jsp:text>
<jsp:expression>termS.getStandardName()</jsp:expression>
<br /><br />
<input type="submit" size="40" value="Save" />
<div class="my_content_container">
    <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>	  
	      Cancel
	    <jsp:text><![CDATA[</a>]]></jsp:text>
</div>
<jsp:text><![CDATA[</form>]]></jsp:text>
<br /><br />

<jsp:scriptlet>
} else if (modeS.equals("new") &amp;&amp; actionS.equals("new_term") ) { </jsp:scriptlet>
		<jsp:text><![CDATA[<form name="term_form" method="post" action="]]></jsp:text>
		<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
		<jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>
		<jsp:text><![CDATA[Term Id: XXX]]></jsp:text>
		<jsp:text><![CDATA[<br /><br />Bulgarian: ]]></jsp:text>
		<jsp:text><![CDATA[<input id="action" type="text" name="t_bulgarian" size="100" value="]]></jsp:text>
		<jsp:text><![CDATA[" />]]></jsp:text>
		<br /><br />
		<input type="submit" size="40" value="Save" />
		<div class="my_content_container">
		    <jsp:text><![CDATA[<a href="]]></jsp:text>
			    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>	  
			      Cancel
			    <jsp:text><![CDATA[</a>]]></jsp:text>
		</div>
		<jsp:text><![CDATA[</form>]]></jsp:text>
		<br /><br />
<jsp:scriptlet>
} else if (modeS.equals("review")) { 
  if (termS != null) { </jsp:scriptlet>
    Term Id: <jsp:expression>termS.getTermId()</jsp:expression><br /><br />
    <jsp:scriptlet>
		termNames = termS.getTermNames();
		Integer termId = termS.getTermId();
		session.setAttribute("termNames", termNames);
		session.setAttribute("currTermId", termId);</jsp:scriptlet>
    <jsp:include page="tlv_files/4_item_TermNamesReview.jsp" />	
    <jsp:scriptlet>
    session.removeAttribute("termNames");
    session.removeAttribute("currTermId"); </jsp:scriptlet>

		_________________________________________________________________________________<br />
		<jsp:scriptlet>
		if (!termS.getTermDescription().equals("") ) { </jsp:scriptlet>
  	Term Description: <jsp:expression>termS.getTermDescription()</jsp:expression>
	        <jsp:text><![CDATA[&nbsp;<a href="]]>
	        </jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>termS.getTermId()</jsp:expression>
			    <jsp:text><![CDATA[&amp;do_what=edit_tdescription">edit]]></jsp:text>	  
			    <jsp:text><![CDATA[</a>]]></jsp:text> 
		<jsp:scriptlet>
		} else { </jsp:scriptlet>
  	Term Description: <jsp:expression>termS.getTermDescription()</jsp:expression>
	        <jsp:text><![CDATA[&nbsp;<a href="]]>
	        </jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>termS.getTermId()</jsp:expression>
			    <jsp:text><![CDATA[&amp;do_what=new_tdescription">new]]></jsp:text>	  
			    <jsp:text><![CDATA[</a>]]></jsp:text> 
		<jsp:scriptlet>
		} </jsp:scriptlet>
		<br /><br />
		
		<jsp:scriptlet>
		if (termS.getStandardId() != 0 ) { </jsp:scriptlet>
	  Standard Id: <jsp:expression>termS.getStandardId()</jsp:expression>
	        <jsp:text><![CDATA[&nbsp;<a href="]]>
	        </jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>termS.getTermId()</jsp:expression>
			    <jsp:text><![CDATA[&amp;do_what=edit_tstandard">edit]]></jsp:text>	  
			    <jsp:text><![CDATA[</a>]]></jsp:text> 
		<jsp:scriptlet>
		} else { </jsp:scriptlet>
		Standard Id: <jsp:expression>termS.getStandardId()</jsp:expression>
	        <jsp:text><![CDATA[&nbsp;<a href="]]>
	        </jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>termS.getTermId()</jsp:expression>
			    <jsp:text><![CDATA[&amp;do_what=new_tstandard">new]]></jsp:text>	  
			    <jsp:text><![CDATA[</a>]]></jsp:text>
		<jsp:scriptlet>
		}  </jsp:scriptlet>
		<br /><br />
	  Standard Identifier: <jsp:expression>termS.getStandardIdentifier()</jsp:expression><br /><br />
	  Standard Name:       <jsp:expression>termS.getStandardName()</jsp:expression><br /><br /><br />
	  <jsp:scriptlet>session.removeAttribute("term");</jsp:scriptlet>
  <br /><br /><br /><br />
  <jsp:text><![CDATA[&nbsp;<a href="]]>
  </jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>termS.getTermId()</jsp:expression>
	    <jsp:text><![CDATA[&amp;do_what=delete_term">delete term]]></jsp:text>	  
	    <jsp:text><![CDATA[</a>]]></jsp:text> 
  <br /><br />
  <jsp:scriptlet>
  } //if not new </jsp:scriptlet>
  <b>Now, it is safe to close this window.</b>
<jsp:scriptlet>
	session.removeAttribute("action");
	session.removeAttribute("term");
} //else mode is review  
  else if (modeS.equals("delete")) { </jsp:scriptlet>
ARE YOU SURE, YOU WOULD LIKE TO DELETE THIS TERM!<br /><br />
<jsp:text><![CDATA[<form name="term_form" method="post" action="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>
     <jsp:include page="tlv_files/4_item_show.jsp" /> 
<br /><br />
<input type="submit" size="40" value="DELETE" />
<div class="my_content_container">
    <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>	  
	      Cancel
	    <jsp:text><![CDATA[</a>]]></jsp:text>
</div>
<jsp:text><![CDATA[</form>]]></jsp:text>
<br /><br />
  
  
<jsp:scriptlet>
} //else mode is delete </jsp:scriptlet> 
    
    
    
    
    
    
    
    
    
    
    
		    
		    
		    
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