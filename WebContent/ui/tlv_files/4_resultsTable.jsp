
<jsp:directive.page import="com.improve1.bulterm.ProjectSettings" />
<jsp:directive.page import="com.improve1.bulterm.entities.TermList" />
<jsp:directive.page import="com.improve1.bulterm.entities.Term" />
<jsp:directive.page import="com.improve1.bulterm.entities.LanguageList" />

<jsp:scriptlet>
TermList terms = (TermList) session.getAttribute("terms");
String columnTrClass="";
int languageIdToCompare = 0;
int languageId = Integer.parseInt( String.valueOf(session.getAttribute("language_id")));
</jsp:scriptlet>



<table class="centerW">
<tr class="rowH"> 
  <th></th>
  <th></th>
  <th>Резултат
  <!-- place here -->
  </th>
  <th></th>
  <th>Източник
  <!-- place here -->
  </th>
  </tr>
<jsp:scriptlet><![CDATA[
  for (int i=0; i < terms.size(); i++) { 
    if (i % 2 == 1) { 
      columnTrClass = "rowA";
    }else if (i % 2 == 0) { 
      columnTrClass = "rowB";
    } ]]></jsp:scriptlet>
  <!-- <tr class="<jsp:expression>columnTrClass</jsp:expression>"> -->
    <jsp:text><![CDATA[<tr class="]]></jsp:text>
    <jsp:expression>columnTrClass</jsp:expression>
    <jsp:text><![CDATA[">]]></jsp:text>
    
    <jsp:text><![CDATA[ <a name="anchorTermId]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression><jsp:text><![CDATA["></a>]]></jsp:text>    
    <jsp:text><![CDATA[<td>]]></jsp:text> 
      <jsp:expression>i+1</jsp:expression> <jsp:text><![CDATA[</td>]]></jsp:text> 
    <jsp:text><![CDATA[<td>]]></jsp:text> 
<jsp:scriptlet>
	languageIdToCompare = 0;
	if (((Term)terms.get(i)).getSelectedLanguageId() > 0) {
		languageIdToCompare = ((Term)terms.get(i)).getSelectedLanguageId();
	} else { // if () {
		languageIdToCompare = languageId;
	}
  if ( !((Term)terms.get(i)).getTermDescription().equals("") ) {
    if (languageIdToCompare == 2) {
    </jsp:scriptlet>
      <jsp:text><![CDATA[<a href="]]></jsp:text>
      <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemServlet?term_id=]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression>
      <jsp:text><![CDATA[" title="покажи Определение">]]></jsp:text>
        <jsp:expression>((Term)terms.get(i)).getTermName()</jsp:expression>
      <jsp:text><![CDATA[</a>]]></jsp:text> 
<jsp:scriptlet>
    } else { </jsp:scriptlet>    
    <jsp:expression>((Term)terms.get(i)).getTermName()</jsp:expression>
<jsp:scriptlet>
    }
  } else { </jsp:scriptlet>    
    <jsp:expression>((Term)terms.get(i)).getTermName()</jsp:expression>
<jsp:scriptlet>
  } </jsp:scriptlet>   
   
    <jsp:text><![CDATA[</td>]]></jsp:text> 
    <jsp:text><![CDATA[<td width="77px">]]></jsp:text> 	
           
<jsp:scriptlet><![CDATA[
  LanguageList termLanguages = ((Term)terms.get(i)).getLanguages();
  for (int j=0; j < termLanguages.size(); j++) {
    ]]></jsp:scriptlet><!--&nbsp; #160 ASCII char--> 
    <jsp:text><![CDATA[ ]]></jsp:text>
    <jsp:scriptlet>
	  if (termLanguages.get(j).getId() == languageIdToCompare) { </jsp:scriptlet>
	    <jsp:text><![CDATA[<b>]]></jsp:text>
	    <jsp:expression>termLanguages.get(j).getName()</jsp:expression>
	    <jsp:text><![CDATA[</b>]]></jsp:text>
<!-- place here -->
<jsp:scriptlet>
	  } else { </jsp:scriptlet>
	    <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermListServlet?term_id=]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression><jsp:text><![CDATA[&amp;term_language_id=]]></jsp:text><jsp:expression>termLanguages.get(j).getId()</jsp:expression>
<jsp:scriptlet>
	    if ( !((Term)terms.get(i)).getTermDescription().equals("") ) { 
	      if ( termLanguages.get(j).getId() == 2 ) { </jsp:scriptlet>
	        <jsp:text><![CDATA[" title="има Определение]]></jsp:text>
<jsp:scriptlet>
	      }
	    } else { </jsp:scriptlet>
	      <jsp:text><![CDATA[" title="няма Определение]]></jsp:text>
<jsp:scriptlet>
	    } </jsp:scriptlet>
	    <jsp:text><![CDATA[">]]></jsp:text>
	      <jsp:expression>termLanguages.get(j).getName()</jsp:expression>
	    <jsp:text><![CDATA[</a>]]></jsp:text>
<jsp:scriptlet>
	  } </jsp:scriptlet>
    <jsp:text><![CDATA[<br />]]></jsp:text>
<jsp:scriptlet>    
  } 
  </jsp:scriptlet>                
    <jsp:text><![CDATA[</td>]]></jsp:text>    
    <!-- <td title="<jsp:expression>((Term)terms.get(i)).getStandardName()</jsp:expression>">  --> 
   
		<jsp:text><![CDATA[<td>]]></jsp:text>
	    <jsp:text><![CDATA[<p title="]]></jsp:text>
	    <jsp:expression>((Term)terms.get(i)).getStandardName()</jsp:expression>
	    <jsp:text><![CDATA[">]]></jsp:text>	  
	      <jsp:expression>((Term)terms.get(i)).getStandardIdentifier()</jsp:expression>
	    <jsp:text><![CDATA[</p>]]></jsp:text>
<!-- place here -->
	    <jsp:text><![CDATA[</td>]]></jsp:text>

  <jsp:text><![CDATA[</tr>]]></jsp:text> 
  
<jsp:scriptlet>
  } </jsp:scriptlet>
</table>

<table class="rightW"><tr><td>

<!-- replace here start -->
<!-- switch to --> <jsp:text><![CDATA[&nbsp;]]></jsp:text>
<jsp:text><![CDATA[<a href="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[servlet/TermListServlet?action=edit" style="text-decoration: none;">]]></jsp:text>	  
  <!-- edit mode --> <jsp:text><![CDATA[&nbsp;]]></jsp:text>
<jsp:text><![CDATA[</a>]]></jsp:text>
<!-- replace here end -->

</td></tr></table>
<br /><br />

<!-- Targeted advertisements -->
<h3>Реклами</h3><ul>
<li><a href="http://www.stoykoparov.free.bg" target="_blank">Стойко Паров</a>
   – одитор по качество, сертифициран от ТÜV Akademie Rheinland  - Германия.</li>
<li><a href="http://www.improve1.com" target="_blank">Improve 1 .com</a>
   – сайт на МиленГ, визитна картичка и повече... (на английски език) </li>
</ul>