
<jsp:directive.page import="com.improve1.bulterm.ProjectSettings" />
<jsp:directive.page import="com.improve1.bulterm.LanguageList" />

<jsp:scriptlet>
String columnToSearchS = String.valueOf(session.getAttribute("columnToSearch"));
LanguageList languages = (LanguageList) session.getAttribute("languages");
int languageId = Integer.parseInt( String.valueOf(session.getAttribute("language_id")));
String symbolsToSearchS = String.valueOf(session.getAttribute("symbolsToSearch"));
String firstVisitS = String.valueOf(session.getAttribute("first_visit"));
</jsp:scriptlet>



<jsp:text><![CDATA[<form name="search_form" method="post" action="]]></jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermListServlet">]]></jsp:text>


<select name="columnsCombo" style="visibility:hidden;">
		  <jsp:scriptlet>
		    if (columnToSearchS.equals("tc1.identifier") ) { </jsp:scriptlet>
		      <option value ="1" selected="selected">Група Идентификатор</option>
		  <jsp:scriptlet>
		    } else { </jsp:scriptlet>
		      <option value ="1">Група Идентификатор</option>
		  <jsp:scriptlet>
		    } 
		    if (columnToSearchS.equals("e1.entry_name") ) { </jsp:scriptlet>
		      <option value ="2" selected="selected">Група Име</option>
		  <jsp:scriptlet>
		    } else { </jsp:scriptlet>
		      <option value ="2">Група Име</option>
		  <jsp:scriptlet>
		    } 
		    if (columnToSearchS.equals("tc2.identifier") ) { </jsp:scriptlet>
		      <option value ="3" selected="selected">Стандарт Идентификатор</option>
		  <jsp:scriptlet>
		    } else { </jsp:scriptlet>
		      <option value ="3">Стандарт Идентификатор</option>
		  <jsp:scriptlet>
		    } 
		    if (columnToSearchS.equals("e2.entry_name") ) { </jsp:scriptlet>
		      <option value ="4" selected="selected">Стандарт Име</option>
		  <jsp:scriptlet>
		    } else { </jsp:scriptlet>
		      <option value ="4">Стандарт Име</option>
		  <jsp:scriptlet>
		    }
		    if (columnToSearchS.equals("em.name_a") ) { </jsp:scriptlet>
		      <option value ="5" selected="selected">Термин Име</option>
		  <jsp:scriptlet>
		    } else { </jsp:scriptlet>
		      <option value ="5">Термин Име</option>
		  <jsp:scriptlet>
		    } 
		    if (columnToSearchS.equals("tm.description") ) { </jsp:scriptlet>
		      <option value ="6" selected="selected">Термин Описание</option>
		  <jsp:scriptlet>
		    } else { </jsp:scriptlet>
		      <option value ="6">Термин Описание</option>
		  <jsp:scriptlet>
		    } </jsp:scriptlet>
  </select>




<table class="centerW"><tr><td>   <!-- TODO fix  width="100%" -->
<jsp:scriptlet><![CDATA[
  if (languages != null) { 
    for (int k=0; k < languages.size(); k++) {
    	]]></jsp:scriptlet>&#160;<jsp:scriptlet>
	    if (languages.get(k).getId() == languageId) { </jsp:scriptlet>
	      <b style="color: #005082;">
	        <jsp:expression>languages.get(k).getName()</jsp:expression></b>

<jsp:scriptlet>
	    } else { 
		  </jsp:scriptlet>	 		    
		    <jsp:text><![CDATA[<a href="]]></jsp:text><jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[servlet/TermListServlet?language_id=]]></jsp:text><jsp:expression>languages.get(k).getId()</jsp:expression><jsp:text><![CDATA[&amp;first_visit=true">]]></jsp:text><jsp:expression>languages.get(k).getName()</jsp:expression><jsp:text><![CDATA[</a>]]></jsp:text>
<jsp:scriptlet>
	    }
    }
  }  
  </jsp:scriptlet> 
  </td></tr>
  <tr>
  
  <td> 
	<!--Tекст за търсене: -->
	<jsp:scriptlet>
	  if (symbolsToSearchS != "null") { </jsp:scriptlet>
		  <jsp:text><![CDATA[<input id="symbols_input" type="text" name="searchSymbolsInput" size="40" value="]]></jsp:text><jsp:expression>symbolsToSearchS</jsp:expression><jsp:text><![CDATA[" />]]></jsp:text>	  
	<jsp:scriptlet>
	  } else { </jsp:scriptlet>
	    <input id="symbols_input" type="text" name="searchSymbolsInput" size="40" value="" />
	<jsp:scriptlet>
	  } </jsp:scriptlet>
	
	<!-- <textarea rows="1" cols="40">&#160;</textarea><br /><br />-->
     <input type="submit" size="40" value="Търсене" />
   </td>
   
</tr>

<!-- !firstVisitS.equals("true") andAnd symbolsToSearchS.length() < 3 || symbolsToSearchS.equals("null")) -->
<jsp:scriptlet><![CDATA[
  if ( !firstVisitS.equals("true") )
    if ( symbolsToSearchS.length() < 3 || symbolsToSearchS.equals("null") ) { ]]></jsp:scriptlet> 
		<tr><td style="color: #ff0000;">
		  \ Три или повече символи за Вашето търсене /
		</td></tr>
<jsp:scriptlet>
  } </jsp:scriptlet>

</table><br />
<jsp:text><![CDATA[</form>]]></jsp:text>