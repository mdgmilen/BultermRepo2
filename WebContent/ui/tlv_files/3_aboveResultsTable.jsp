
<jsp:scriptlet>
String firstVisitS = String.valueOf(session.getAttribute("first_visit"));
String symbolsToSearchS = String.valueOf(session.getAttribute("symbolsToSearch"));
String resultsCountS = String.valueOf(session.getAttribute("resultsCount"));
</jsp:scriptlet>


<jsp:scriptlet>
if (!firstVisitS.equals("true")) { </jsp:scriptlet>
	<table class="centerW"><tr><td>
	<jsp:scriptlet><![CDATA[
		if (symbolsToSearchS.length() < 3 || symbolsToSearchS.equals("null") ) { ]]></jsp:scriptlet> 
	    Примерно търсене по "втулка" <!-- Автоматично търсене по най-популярни резултати -->
	  <jsp:scriptlet>
	  } else { </jsp:scriptlet>
	    Търсене по "<jsp:expression>symbolsToSearchS</jsp:expression>"
	  <jsp:scriptlet>
	  } //else </jsp:scriptlet>
	</td> <td>
	  <jsp:expression>resultsCountS</jsp:expression> резултата
	</td></tr></table>
<jsp:scriptlet> 
}//if </jsp:scriptlet> 
