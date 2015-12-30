<%@page import="com.improve1.bulterm.TermNameList"%>
<%@page import="com.improve1.bulterm.Term"%>
<%@page import="com.improve1.bulterm.TermName"%>

<jsp:scriptlet>
  Term termS = (Term) session.getAttribute("term");
  TermNameList termNames = termS.getTermNames();
  //String action="";
  </jsp:scriptlet>



<jsp:text><![CDATA[Term Id: ]]></jsp:text>
<jsp:expression>termS.getTermId()</jsp:expression>
<br /><br />

<jsp:scriptlet><![CDATA[
if (termNames != null) {
  for (int i=0; i < termNames.size(); i++) { ]]></jsp:scriptlet>
    <jsp:text><![CDATA[<p>]]></jsp:text>
    <jsp:scriptlet>
    if ( ((TermName)termNames.get(i)).getLanguageId() == 1) {
    	</jsp:scriptlet>English:   <jsp:expression>((TermName)termNames.get(i)).getTermName().replace( String.valueOf( (char) 60), "!!!LESSTHAN!!!")</jsp:expression><jsp:scriptlet>
    } else if ( ((TermName)termNames.get(i)).getLanguageId() == 2) {
    	</jsp:scriptlet>Bulgarian: <jsp:expression>((TermName)termNames.get(i)).getTermName().replace( String.valueOf( (char) 60), "!!!LESSTHAN!!!")</jsp:expression><jsp:scriptlet>
    } else if ( ((TermName)termNames.get(i)).getLanguageId() == 3) {
    	</jsp:scriptlet>Russian: <jsp:expression>((TermName)termNames.get(i)).getTermName().replace( String.valueOf( (char) 60), "!!!LESSTHAN!!!")</jsp:expression><jsp:scriptlet>
    } else if ( ((TermName)termNames.get(i)).getLanguageId() == 4) {
    	</jsp:scriptlet>German: <jsp:expression>((TermName)termNames.get(i)).getTermName().replace( String.valueOf( (char) 60), "!!!LESSTHAN!!!")</jsp:expression><jsp:scriptlet>
    } else if ( ((TermName)termNames.get(i)).getLanguageId() == 5) {
    	</jsp:scriptlet>French: <jsp:expression>((TermName)termNames.get(i)).getTermName().replace( String.valueOf( (char) 60), "!!!LESSTHAN!!!")</jsp:expression><jsp:scriptlet>
    }//else 
      </jsp:scriptlet>
    <jsp:text><![CDATA[</p>]]></jsp:text>

<jsp:scriptlet>
  }//for 
} else { //if termNames == null 	</jsp:scriptlet>
  The term has no loaded translations!
<jsp:scriptlet>
}  //else  </jsp:scriptlet> 
















<jsp:text><![CDATA[<br /><br />Standard Id: ]]></jsp:text>
<jsp:expression>termS.getStandardId()</jsp:expression>
<jsp:text><![CDATA[<br /><br />Standard Identifier: ]]></jsp:text>
<jsp:expression>termS.getStandardIdentifier()</jsp:expression>
<jsp:text><![CDATA[<br /><br />Standard Name: ]]></jsp:text>
<jsp:expression>termS.getStandardName()</jsp:expression>




