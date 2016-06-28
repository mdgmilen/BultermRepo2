
<jsp:directive.page import="com.improve1.bulterm.ProjectSettings" />


<jsp:scriptlet> 
String firstVisitS = String.valueOf(session.getAttribute("first_visit"));

if (firstVisitS.equals("true")) { //first_visit   </jsp:scriptlet> 
<h3>За Вашия правилен технически превод ползвайте БУЛТЕРМ.<br /><br />
Допълнение към речника може да намерите на https://bultermparov.wordpress.com
</h3>
Предпочитан браузер - Mozilla Firefox.

<br /><br />
		    <jsp:text><![CDATA[<a href="]]></jsp:text>
		    <jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[ui/howto.jsp">]]></jsp:text>	  
		      Указание<jsp:text><![CDATA[</a>]]></jsp:text>
		      за работа и повече информация за проекта.
<br /><br />
Вашите мнения и препоръки са добре дошли. Така помагате услугата да бъде подобрявана.<br />
Контакти, <a href="mailto:info@bulterm.improve1.com">info@bulterm.improve1.com</a> - Стойко Паров, Милен Георгиев.
<br /><br /><br />
<h3>На мобилни устройства</h3>
<table> <tr> <td>
<jsp:text><![CDATA[<img src="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[ui/resources/img_custom/m_phone_1_small.jpg" border="0" alt="mobile phone view1" />]]></jsp:text>
</td><td>
<jsp:text><![CDATA[<img src="]]></jsp:text>
<jsp:expression>ProjectSettings.pathPrefix</jsp:expression><jsp:text><![CDATA[ui/resources/img_custom/m_phone_2_small.jpg" border="0" alt="mobile phone view2" />]]></jsp:text>
</td></tr></table>
<br />
<br />
<!-- Non-Targeted (static) advertisements -->
<h3>Реклами</h3><ul>
<li><a href="http://www.stoykoparov.free.bg" target="_blank">Стойко Паров</a>
   – одитор по качество, сертифициран от ТÜV Akademie Rheinland  - Германия.</li>
<li><a href="http://www.improve1.com" target="_blank">Improve 1 .com</a>
   – сайт на МиленГ, визитна картичка и повече... (на английски език) </li>
<!--  <li><a href="http://www.bg.adastragrp.com" target="_blank">Info Data Manage</a>
   – „Adastra Group” е международна консултантска компания, специализирана в пълния спектър услуги за Складове от Данни 
   (Data Warehousing) и Анализ на Бизнес Информация (Business Intelligence). </li>-->
</ul>
<jsp:scriptlet>
  } //first_visit  </jsp:scriptlet> 