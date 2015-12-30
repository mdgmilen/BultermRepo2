<?xml version="1.0" encoding="utf-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
<!-- <?xml version="1.0" encoding="utf-8" ?>  ISO-8859-1 
 <jsp:text> <![CDATA[    ]]> </jsp:text>

HTTP/1.1 301 Moved Permanently
Location: http://localhost:8080/BultermPr1/servlet/TermListServlet?language_id=2&first_visit=true
Content-Type: text/html
Content-Length: 174         
-->
    <jsp:directive.page language="java"
        contentType="text/html; charset=utf-8" pageEncoding="utf-8" />
    <jsp:text>
        <![CDATA[ <?xml version="1.0" encoding="utf-8" ?> ]]> <!-- ISO-8859-1 -->
    </jsp:text> 
    <jsp:text>
        <![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" /> ]]>
    </jsp:text>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Comments container
  ui/term_list_view.jsp 
-->

<!-- address on localhost /BultermPr1/servlet 
<meta http-equiv="Refresh" content="1; URL=/BultermPr1/servlet/TermListServlet?language_id=2&amp;first_visit=true" />  
-->
<!-- address on mochahost /BultermPr1 -->
<meta http-equiv="Refresh" content="0; URL=/servlet/TermListServlet?language_id=2&amp;first_visit=true" />



<title>ISO standards database - Bulterm.improve1.com</title>
<script language="JavaScript">
	function Refresher() {
		// /BultermPr1
		document.location='/BultermPr3/servlet/TermListServlet?language_id=2&amp;first_visit=true';
		//http://localhost:8080/servlet
		//if(t) refresh = setTimeout("document.location='/servlet/TermListServlet?language_id=2&amp;first_visit=true';", t*1000);
	}
</script>
</head>
<body onload="Refresher()">
  <b>Bulterm.improve1.com - 5-езичен технически речник
  <br /><br />
  Моля, изчакайте...</b><br /><br />
  Предпочитан браузер - Mozilla Firefox.
</body>
</html>
</jsp:root>