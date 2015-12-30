package com.improve1.bulterm.servlets;

import java.io.IOException;
/*import java.math.BigInteger;
import java.sql.Date;
import java.text.Format;
import java.text.SimpleDateFormat;*/

import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//HttpSession session = request.getSession();
		//session.removeAttribute("email");
		response.sendRedirect(ProjectSettings.pathPrefix + "ui/login.jsp");
	}  // /BultermPr

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//boolean doSearch = false;
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		//session.removeAttribute("first_visit");
    	//int languageIdS = Integer.parseInt(String.valueOf(session.getAttribute("language_id")));
    	//String columnToSearchS = String.valueOf(session.getAttribute("columnToSearch"));
    	//String symbolsToSearchS = null; //String.valueOf(session.getAttribute("symbolsToSearch"));
		//String columnsComboP = request.getParameter("columnsCombo");
		//String columnToSearchP = getColumnToSearch(columnsComboP);
		//request.setCharacterEncoding("UTF8");
		String emailP = request.getParameter("emailInput");
		String passwordP = request.getParameter("passwordInput");
		//symbolsToSearchP.
		//never used DbProvider dbProv = new DbProvider();
		//boolean makeNewSearch = false;
		if ( emailP != null && !emailP.equals("") && emailP.equals("info@bulterm.improve1.com  ")
				&& passwordP.equals("xxx") ) { //parsiparovsivanov
			  // && symbolsToSearchP != symbolsToSearchS 
				// || (columnToSearchP != null && columnToSearchP != columnToSearchS) ) {
			// && symbolsToSearchP != ""
		  session.setAttribute("email", emailP);	
		  //makeNewSearch = true;
			String anchorS = String.valueOf(session.getAttribute("anchor"));
			session.removeAttribute("anchor");
			if (anchorS.equals("null")) { anchorS = "";}
			response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_list_view_edit.jsp"+anchorS);
		} else { //if (symbolsToSearchS != null) {
		  session.removeAttribute("email");
			String anchorS = String.valueOf(session.getAttribute("anchor"));
			session.removeAttribute("anchor");
			if (anchorS.equals("null")) { anchorS = "";}
			response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_list_view.jsp"+anchorS);
		}
	}

}
