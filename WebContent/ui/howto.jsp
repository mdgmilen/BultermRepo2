<?xml version="1.0" encoding="utf-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
    
    <jsp:text>
        <![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ]]>
    </jsp:text>
    
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Bulterm.improve1.com - 5-езичен технически речник</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" />
</head>
<jsp:directive.page import="com.improve1.bulterm.ProjectSettings" />

<!-- <![CDATA[  --> 
<!--  ]]>  -->
<jsp:scriptlet> 
//String termId = String.valueOf(session.getAttribute("term_id_back"));
String termName = String.valueOf(session.getAttribute("term_name"));
String termDescription = String.valueOf(session.getAttribute("term_description"));
</jsp:scriptlet>


<body>

<div id="outer">
	<div id="header">
		
		
		  <table> 
		    <tr> 
		    <td></td><td></td>
		    <td> <!-- &nbsp; -->  <!-- /a4PrevodiPr1 &#160;-->
		      <h1><a href="http://bulterm.improve1.com" target="_self">BULTERM</a></h1>
		    </td>
		    </tr>
		  </table><br />
		
		<h3><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --> 
		  <a href="http://bulterm.improve1.com" target="_self">Bulterm.improve1.com - 5-езичен технически речник</a></h3>
		
	</div>
	
	<div id="menu">
		<ul>
			
		</ul>
	</div>

	<div id="content">
		<div id="tertiaryContent">
		</div>
		<div id="primaryContentContainer">
<!-- primaryContentContainer -->
		  <div id="primaryContent">
    <h6> 
<!--old: <a href="/BultermPr1/servlet/TermListServlet?first_visit=true">Начало</a>-->
		    <jsp:text><![CDATA[<a href="]]></jsp:text>
		    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
		    <jsp:text><![CDATA[servlet/TermListServlet?first_visit=true">]]></jsp:text>	  
		      Начало
		    <jsp:text><![CDATA[</a>]]></jsp:text>
    -&gt; Указание за работа </h6>


<h3>Указание за ползване на 5 езичния технически речник BULTERM</h3>
<table width="100%">
  <tr>
  <td align="left">Предпочитан браузер - Mozilla Firefox.
    Използването на бутона на браузера "Go BACK one page" - <br />
    <jsp:text><![CDATA[<img src="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression>
<jsp:text><![CDATA[ui/resources/img_custom/buttonBackMF.jpg" border="0" alt="(button Back image)" />]]></jsp:text>
    - не е препоръчително.
  <br /><br />
  1. В резултата от търсенето се появява прозорец с  няколко записа, съдържащи търсената дума/термин.
<br /><br />
- при фиксиране на маркера върху номера на стандарта се показва неговото заглавие;<br />
- при фиксиране на маркера върху българския термин и неговото активиране се показва 
определението на термина (не за всички термини са въведени определенията, тъй като липсва
такова определение в първоизточника БДС). Връщането към резултата се извършва с „търсене”;<br />
- при активиране на един от посочените езици се появява термина на съответния език.<br />
- при фиксиране на маркера върху връзката (когато не е избран) "Български" (в таблицата/ за конкретен термин) 
се показва "има Определение", ако този термин има въведено определение. Определенията са само на български език.
</td>
  </tr>
    <tr> 
  <td align="left">2.Ако желаете да ограничите броя на записите в резултата от търсенето извършете 
следващо търсене на избрана от вас дума чрез командата за търсене, намираща се  извън полето на речника.</td>
  </tr>
    <tr>
  <td align="left">3.Термините на френски са въведени без ударения.</td>
  </tr>
    <tr> 
  <td align="left">4.Термините на немски език, съдържащи буквите a, o, u, A, O, U, ? са въведени съответно 
с буквосъчетанията   ae, oe, ue, Ae, Oe, Ue, ss и при търсене трябва да се изписват по този начин.</td>
  </tr>
  <tr> <td align="left">
	5. Режим на редакция<br />
	Правим допускане, че ако желаем да редактираме един или повече термини:<br />
	- ще ги намерим като резултати от търсене по общ критерий (символи за търсене);<br />
	- ще ги редактираме последователно - един след друг.<br /><br />
	
	Когато се намираме в "режим на редакция" и изберем/използваме/кликнем/щракнем върху връзка/бутон:<br />
  -	която е налична само в "режим на редакция", тогава оставаме в "режим на редакция" на следващата страница. <br /> 
	  Това са връзка "edit" и в процес на разработка връзки - "Standards", "add new term" и "change"; <br />
  -	която е налична И в "режим на преглед", тогава преминаваме в "режим на преглед" на следващата страница. <br />
  </td></tr>
</table>

<h3>Повече информация за техническата реализация на проекта, на английски</h3>
http://software.improve1.com (home) -> about -> CV, descriptions of previous projects... > Some deliveries > ComplexityLifecycle.ppt, BultermVideo.swf.


		  </div>
<!-- primaryContentContainer -->
		</div>
		<div id="secondaryContent">
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">
    <div id="copyright">
		  <p> © 2010-2012 <a href="http://bulterm.improve1.com" target="_self">
		    BULTERM</a>  – v8-01052012 <br /> 		     
		    </p>
			
    </div>
  </div>
</div>
</body>
</html>

</jsp:root>