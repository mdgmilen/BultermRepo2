
<jsp:directive.page import="com.improve1.bulterm.ProjectSettings" />
<jsp:directive.page import="com.improve1.bulterm.entities.TermList" />
<jsp:directive.page import="com.improve1.bulterm.entities.TermNameList" />
<jsp:directive.page import="com.improve1.bulterm.entities.Term" />
<jsp:directive.page import="com.improve1.bulterm.entities.LanguageList" />

<jsp:scriptlet>
TermList terms = (TermList) session.getAttribute("terms");
String columnTrClass="";
int languageIdToCompare = 0;
int languageId = Integer.parseInt( String.valueOf(session.getAttribute("language_id")));
int resultsCount = Integer.parseInt( String.valueOf(session.getAttribute("resultsCount")));
int countPerPageNum = Integer.parseInt( String.valueOf(session.getAttribute("countPerPage")));
String selectedPageNumStr = String.valueOf(session.getAttribute("pageNum"));
int selectedPageNum = 0;
if (!selectedPageNumStr.equals("null")) { selectedPageNum = Integer.parseInt(selectedPageNumStr); }
//else {}
int pagesCount = 0;
if (resultsCount%countPerPageNum == 0) {
	  pagesCount = resultsCount/countPerPageNum;  //520/50=11pages
	} else {
		pagesCount = (int)resultsCount/countPerPageNum + 1;
	}
int rowToStartWithNum = (selectedPageNum-1)*countPerPageNum;
</jsp:scriptlet>


<jsp:expression>rowToStartWithNum+" - "+(rowToStartWithNum+terms.size())+" of "+resultsCount</jsp:expression>
<br /><br />
<jsp:scriptlet>
if (selectedPageNum != 1) { </jsp:scriptlet>
  <jsp:text><![CDATA[<a href="]]></jsp:text>
  <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermListServlet?unlm=true&amp;page_num=1]]></jsp:text>
     <jsp:text><![CDATA[" target="_self">first]]></jsp:text>
     <jsp:text><![CDATA[</a>]]></jsp:text>
<jsp:scriptlet>
} else { </jsp:scriptlet>  
  first
<jsp:scriptlet>
} </jsp:scriptlet>  

<jsp:scriptlet><![CDATA[
for (int i=0; i < pagesCount; i++) {
  if (selectedPageNum == i+1) { ]]></jsp:scriptlet>
    &nbsp;<jsp:expression>i+1</jsp:expression>
<jsp:scriptlet><![CDATA[
  } else { ]]></jsp:scriptlet>
  &nbsp;
  <jsp:text><![CDATA[<a href="]]></jsp:text>
  <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermListServlet?unlm=true&amp;page_num=]]></jsp:text><jsp:expression>i+1</jsp:expression>
     <jsp:text><![CDATA[" target="_self">]]></jsp:text>
     <jsp:expression>i+1</jsp:expression><jsp:text><![CDATA[</a>]]></jsp:text>
<jsp:scriptlet><![CDATA[
  }
}
  ]]></jsp:scriptlet>

<jsp:scriptlet>
if (selectedPageNum != pagesCount) { </jsp:scriptlet>
  <jsp:text><![CDATA[<a href="]]></jsp:text>
  <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermListServlet?unlm=true&amp;page_num=]]></jsp:text><jsp:expression>pagesCount</jsp:expression>
     <jsp:text><![CDATA[" target="_self">last</a>]]></jsp:text>
<jsp:scriptlet>
} else { </jsp:scriptlet>  
  last
<jsp:scriptlet>
} </jsp:scriptlet>  


<br /><br />

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
    
    <jsp:text><![CDATA[<td>]]></jsp:text> <jsp:expression>i+1                            </jsp:expression><jsp:text><![CDATA[</td>]]></jsp:text>
    <jsp:text><![CDATA[<td>]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression>
       <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression>
	      <jsp:text><![CDATA[" target="_blank">view</a></td>]]></jsp:text>
    <jsp:scriptlet>
    TermNameList termNames = ((Term)terms.get(i)).getTermNames();
    Integer termId = ((Term)terms.get(i)).getTermId();
    session.setAttribute("termNames", termNames);
    session.setAttribute("currTermId", termId);
    </jsp:scriptlet>
    <jsp:include page="4_edit1_TermNames.jsp" />
    <jsp:scriptlet>
    session.removeAttribute("termNames");
    session.removeAttribute("currTermId"); </jsp:scriptlet>
    
    
	  <jsp:scriptlet>
	  int termDescrLength = ((Term)terms.get(i)).getTermDescription().length();
	  if (termDescrLength > 20) {termDescrLength = 20;}
	  if (termDescrLength == 0) { </jsp:scriptlet>
      <jsp:text><![CDATA[<td>]]></jsp:text>
       <jsp:text><![CDATA[<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression><jsp:text><![CDATA[&amp;do_what=new_tdescription]]></jsp:text>
	      <jsp:text><![CDATA[" target="_blank">new</a></td>]]></jsp:text>		  
		<jsp:scriptlet>
	  } else {
	  </jsp:scriptlet>
      <jsp:text><![CDATA[<td>]]></jsp:text>
       <jsp:expression>
       ((Term)terms.get(i)).getTermDescription().substring(0, termDescrLength).replace( String.valueOf( (char) 60), "!!!LESSTHAN SYMBOL!!!")
         </jsp:expression>
       <jsp:text><![CDATA[&nbsp;<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression><jsp:text><![CDATA[&amp;do_what=edit_tdescription]]></jsp:text>
	      <jsp:text><![CDATA[" target="_blank">edit</a></td>]]></jsp:text>
	  <jsp:scriptlet>
	  } //else
	  </jsp:scriptlet>
	      
	  <jsp:scriptlet>
		if (((Term)terms.get(i)).getStandardId() != 0 ) { 
			int standardNameLength=0;
		  if (((Term)terms.get(i)).getStandardName().length() > 30 ) { standardNameLength = 30;} else { standardNameLength = ((Term)terms.get(i)).getStandardName().length(); }
		</jsp:scriptlet>
    <jsp:text><![CDATA[<td>]]></jsp:text>
       <jsp:expression>((Term)terms.get(i)).getStandardId()</jsp:expression>
       <jsp:text><![CDATA[&nbsp;<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression><jsp:text><![CDATA[&amp;do_what=edit_tstandard]]></jsp:text>
	      <jsp:text><![CDATA[" target="_blank">edit</a></td>]]></jsp:text>
    <!-- <td title="<jsp:expression>((Term)terms.get(i)).getStandardName()</jsp:expression>">  --> 
		<jsp:text><![CDATA[<td>]]></jsp:text>
	    <jsp:expression>((Term)terms.get(i)).getStandardIdentifier()</jsp:expression>
	  <jsp:text><![CDATA[</td>]]></jsp:text>
		<jsp:text><![CDATA[<td>]]></jsp:text>
	    <jsp:expression>((Term)terms.get(i)).getStandardName().substring(0, standardNameLength)</jsp:expression> <!--  -->
	  <jsp:text><![CDATA[</td>]]></jsp:text>
	  <jsp:scriptlet>
		} else { </jsp:scriptlet>
	  <jsp:text><![CDATA[<td>]]></jsp:text>
       <jsp:text><![CDATA[&nbsp;<a href="]]></jsp:text>
	    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermItemEditServlet?term_id=]]></jsp:text><jsp:expression>((Term)terms.get(i)).getTermId()</jsp:expression><jsp:text><![CDATA[&amp;do_what=new_tstandard]]></jsp:text>
	      <jsp:text><![CDATA[" target="_blank">new</a></td>]]></jsp:text>
    <!-- <td title="<jsp:expression>((Term)terms.get(i)).getStandardName()</jsp:expression>">  --> 
		<jsp:text><![CDATA[<td>]]></jsp:text>
	  <jsp:text><![CDATA[</td>]]></jsp:text>	
		<jsp:text><![CDATA[<td>]]></jsp:text>
	  <jsp:text><![CDATA[</td>]]></jsp:text>
	  <jsp:scriptlet>
		} </jsp:scriptlet>
  <jsp:text><![CDATA[</tr>]]></jsp:text>

<jsp:scriptlet>
  } //for each term in terms</jsp:scriptlet>
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

