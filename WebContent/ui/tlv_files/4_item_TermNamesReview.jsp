<%@page import="com.improve1.bulterm.TermNameList"%>
<%@page import="com.improve1.bulterm.Term"%>
<%@page import="com.improve1.bulterm.TermName"%>
<%@page import="com.improve1.bulterm.ProjectSettings"%>

<jsp:scriptlet>
  String currTermId = String.valueOf(session.getAttribute("currTermId"));
  TermNameList termNames = (TermNameList) session.getAttribute("termNames");
  String action="";</jsp:scriptlet>
<jsp:scriptlet><![CDATA[
if (termNames != null) {
  for (int i=0; i < termNames.size(); i++) { ]]></jsp:scriptlet>
    <jsp:text><![CDATA[<p>]]></jsp:text>
    <jsp:scriptlet>
    if ( ((TermName)termNames.get(i)).getLanguageId() == 1) {
    	action = "tenglish";
    	</jsp:scriptlet>English: <jsp:scriptlet>
    } else if ( ((TermName)termNames.get(i)).getLanguageId() == 2) {
    	action = "tbulgarian";
    	</jsp:scriptlet>Bulgarian: <jsp:scriptlet>
    } else if ( ((TermName)termNames.get(i)).getLanguageId() == 3) {
    	action = "trussian";
    	</jsp:scriptlet>Russian: <jsp:scriptlet>
    } else if ( ((TermName)termNames.get(i)).getLanguageId() == 4) {
    	action = "tgerman";
    	</jsp:scriptlet>German: <jsp:scriptlet>
    } else if ( ((TermName)termNames.get(i)).getLanguageId() == 5) {
    	action = "tfrench";
    	</jsp:scriptlet>French: <jsp:scriptlet>
    }//else 
    String tnToShow = ((TermName)termNames.get(i)).getTermName().replace( String.valueOf( (char) 60), "!!!LESSTHAN!!!");
      </jsp:scriptlet>
      <jsp:expression>tnToShow</jsp:expression>
    <jsp:scriptlet>
    if ( !((TermName)termNames.get(i)).getTermName().equals("") ) { </jsp:scriptlet> 
      <jsp:text><![CDATA[ <a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>currTermId</jsp:expression><jsp:text><![CDATA[&amp;do_what=]]></jsp:text>edit_<jsp:expression>action</jsp:expression>
	      <jsp:text><![CDATA[">edit</a>]]></jsp:text>
	  <jsp:scriptlet>
    } else { </jsp:scriptlet> 
      <jsp:text><![CDATA[ <a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>currTermId</jsp:expression><jsp:text><![CDATA[&amp;do_what=]]></jsp:text>new_<jsp:expression>action</jsp:expression>
	      <jsp:text><![CDATA[">addNew</a>]]></jsp:text>
    <jsp:scriptlet>
    }//else </jsp:scriptlet>
    <jsp:text><![CDATA[</p>]]></jsp:text>

<jsp:scriptlet>
  }//for 
} else { //if termNames == null 	</jsp:scriptlet>
  The term has no loaded translations!
<jsp:scriptlet>
}  //else  </jsp:scriptlet>                





