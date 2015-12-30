<%@page import="com.improve1.bulterm.TermNameList"%>
<%@page import="com.improve1.bulterm.Term"%>
<%@page import="com.improve1.bulterm.TermName"%>
<%@page import="com.improve1.bulterm.ProjectSettings"%>

<jsp:scriptlet>
  String currTermId = String.valueOf(session.getAttribute("currTermId"));
  TermNameList termNames = (TermNameList) session.getAttribute("termNames");
  String uactionS= String.valueOf(session.getAttribute("action"));
<![CDATA[
if (termNames != null) { ]]></jsp:scriptlet>
	<jsp:text><![CDATA[<form name="term_form" method="post" action="]]></jsp:text>
			<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
			<jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>
	<jsp:scriptlet><![CDATA[
  for (int i=0; i < termNames.size(); i++) { ]]></jsp:scriptlet>
    <jsp:text><![CDATA[<p>]]></jsp:text>
    <jsp:scriptlet>
    String tnToShow = ((TermName)termNames.get(i)).getTermName().replace( String.valueOf( (char) 60), "!!!LESSTHAN!!!");
    TermName currTermNameObj = (TermName)termNames.get(i);
    if ( !tnToShow.equals("") ) {
      if (uactionS.equals("edit_tenglish") && currTermNameObj.getLanguageId() == 1) { </jsp:scriptlet>
			  <jsp:text><![CDATA[English: ]]></jsp:text>
				<jsp:text><![CDATA[<input id="action" type="text" name="t_english" size="100" value="]]></jsp:text>
				<jsp:expression>tnToShow</jsp:expression>
				<jsp:text><![CDATA[" />]]></jsp:text>
	  <jsp:scriptlet>
      } else if (uactionS.equals("edit_tbulgarian") && currTermNameObj.getLanguageId() == 2) { </jsp:scriptlet>
      <jsp:text><![CDATA[Bulgarian: ]]></jsp:text>
				<jsp:text><![CDATA[<input id="action" type="text" name="t_bulgarian" size="100" value="]]></jsp:text>
				<jsp:expression>tnToShow</jsp:expression>
				<jsp:text><![CDATA[" />]]></jsp:text>
	    <jsp:scriptlet>
      } else if (uactionS.equals("edit_trussian") && currTermNameObj.getLanguageId() == 3) { </jsp:scriptlet>
      <jsp:text><![CDATA[Russian: ]]></jsp:text>
				<jsp:text><![CDATA[<input id="action" type="text" name="t_russian" size="100" value="]]></jsp:text>
				<jsp:expression>tnToShow</jsp:expression>
				<jsp:text><![CDATA[" />]]></jsp:text>
	    <jsp:scriptlet>
      } else if (uactionS.equals("edit_tgerman") && currTermNameObj.getLanguageId() == 4) { </jsp:scriptlet>
      <jsp:text><![CDATA[German: ]]></jsp:text>
				<jsp:text><![CDATA[<input id="action" type="text" name="t_german" size="100" value="]]></jsp:text>
				<jsp:expression>tnToShow</jsp:expression>
				<jsp:text><![CDATA[" />]]></jsp:text>
	    <jsp:scriptlet>
      } else if (uactionS.equals("edit_tfrench") && currTermNameObj.getLanguageId() == 5) { </jsp:scriptlet>
      <jsp:text><![CDATA[French: ]]></jsp:text>
				<jsp:text><![CDATA[<input id="action" type="text" name="t_french" size="100" value="]]></jsp:text>
				<jsp:expression>tnToShow</jsp:expression>
				<jsp:text><![CDATA[" />]]></jsp:text>
	    <jsp:scriptlet>
      } else {
    	  if (currTermNameObj.getLanguageId() == 1) {
    		  </jsp:scriptlet><jsp:text><![CDATA[English: ]]></jsp:text><jsp:expression>tnToShow</jsp:expression><jsp:scriptlet>
    	  } else if (currTermNameObj.getLanguageId() == 2) {
    		  </jsp:scriptlet><jsp:text><![CDATA[Bulgarian: ]]></jsp:text><jsp:expression>tnToShow</jsp:expression><jsp:scriptlet>
    	  } else if (currTermNameObj.getLanguageId() == 3) {
    		  </jsp:scriptlet><jsp:text><![CDATA[Russian: ]]></jsp:text><jsp:expression>tnToShow</jsp:expression><jsp:scriptlet>
    	  } else if (currTermNameObj.getLanguageId() == 4) {
    		  </jsp:scriptlet><jsp:text><![CDATA[German: ]]></jsp:text><jsp:expression>tnToShow</jsp:expression><jsp:scriptlet>
    	  } else if (currTermNameObj.getLanguageId() == 5) {
    		  </jsp:scriptlet><jsp:text><![CDATA[French: ]]></jsp:text><jsp:expression>tnToShow</jsp:expression><jsp:scriptlet>
    	  }
      }
    } else { 
        if (uactionS.equals("new_tenglish") && currTermNameObj.getLanguageId() == 1) { </jsp:scriptlet>
  			  <jsp:text><![CDATA[English: ]]></jsp:text>
  				<jsp:text><![CDATA[<input id="action" type="text" name="t_english" size="100" value="]]></jsp:text>
  				<jsp:text><![CDATA[" />]]></jsp:text>
  	  <jsp:scriptlet>
        } else if (uactionS.equals("new_tbulgarian") && currTermNameObj.getLanguageId() == 2) { </jsp:scriptlet>
        <jsp:text><![CDATA[Bulgarian: ]]></jsp:text>
  				<jsp:text><![CDATA[<input id="action" type="text" name="t_bulgarian" size="100" value="]]></jsp:text>
  				<jsp:text><![CDATA[" />]]></jsp:text>
  	    <jsp:scriptlet>
        } else if (uactionS.equals("new_trussian") && currTermNameObj.getLanguageId() == 3) { </jsp:scriptlet>
        <jsp:text><![CDATA[Russian: ]]></jsp:text>
  				<jsp:text><![CDATA[<input id="action" type="text" name="t_russian" size="100" value="]]></jsp:text>
  				<jsp:text><![CDATA[" />]]></jsp:text>
  	    <jsp:scriptlet>
        } else if (uactionS.equals("new_tgerman") && currTermNameObj.getLanguageId() == 4) { </jsp:scriptlet>
        <jsp:text><![CDATA[German: ]]></jsp:text>
  				<jsp:text><![CDATA[<input id="action" type="text" name="t_german" size="100" value="]]></jsp:text>
  				<jsp:text><![CDATA[" />]]></jsp:text>
  	    <jsp:scriptlet>
        } else if (uactionS.equals("new_tfrench") && currTermNameObj.getLanguageId() == 5) { </jsp:scriptlet>
        <jsp:text><![CDATA[French: ]]></jsp:text>
  				<jsp:text><![CDATA[<input id="action" type="text" name="t_french" size="100" value="]]></jsp:text>
  				<jsp:text><![CDATA[" />]]></jsp:text>
  	    <jsp:scriptlet>
        } else {
      	  if (currTermNameObj.getLanguageId() == 1) {
      		  </jsp:scriptlet><jsp:text><![CDATA[English: ]]></jsp:text>!!!empty!!!<jsp:scriptlet>
      	  } else if (currTermNameObj.getLanguageId() == 2) {
      		  </jsp:scriptlet><jsp:text><![CDATA[Bulgarian: ]]></jsp:text>!!!empty!!!<jsp:scriptlet>
      	  } else if (currTermNameObj.getLanguageId() == 3) {
      		  </jsp:scriptlet><jsp:text><![CDATA[Russian: ]]></jsp:text>!!!empty!!!<jsp:scriptlet>
      	  } else if (currTermNameObj.getLanguageId() == 4) {
      		  </jsp:scriptlet><jsp:text><![CDATA[German: ]]></jsp:text>!!!empty!!!<jsp:scriptlet>
      	  } else if (currTermNameObj.getLanguageId() == 5) {
      		  </jsp:scriptlet><jsp:text><![CDATA[French: ]]></jsp:text>!!!empty!!!<jsp:scriptlet>
      	  }
        }
    }//else </jsp:scriptlet>
    <jsp:text><![CDATA[</p>]]></jsp:text>

<jsp:scriptlet>
  }//for </jsp:scriptlet>
  <br /><br />
  <input type="submit" size="40" value="Save" />
  <div class="my_content_container">
      <jsp:text><![CDATA[<a href="]]></jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet">]]></jsp:text>
  		Cancel<jsp:text><![CDATA[</a>]]></jsp:text>
  </div>
  <jsp:text><![CDATA[</form>]]></jsp:text>
  <br /><br />
<jsp:scriptlet>
} else { //if termNames == null 	</jsp:scriptlet>
  TermNames are not loaded!
<jsp:scriptlet>
}  //else  </jsp:scriptlet>                





