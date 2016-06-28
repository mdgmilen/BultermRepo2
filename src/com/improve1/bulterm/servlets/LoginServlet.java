package com.improve1.bulterm.servlets;

import java.io.IOException;
/*import java.math.BigInteger;
import java.sql.Date;
import java.text.Format;
import java.text.SimpleDateFormat;*/

import javax.servlet.*;
import javax.servlet.http.*;

import com.improve1.bulterm.ProjectSettings;
import com.improve1.bulterm.entities.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// session.removeAttribute("email");
		User user = (User) session.getAttribute("user");
//		if (!user.isLogged()) {
//			response.sendRedirect(ProjectSettings.pathPrefix + "ui/login.jsp");
//		} else {
//			response.sendRedirect(ProjectSettings.pathPrefix + "servlet/TermListServlet");
//		}
		String actionP = request.getParameter("action");
		if (actionP != null && actionP.equals("logout")) {
			user.setIsLogged(false);
			session.setAttribute("user", user);
			response.sendRedirect(ProjectSettings.pathPrefix + "servlet/TermListServlet?language_id=2&first_visit=true"); 
		}
		if (actionP != null && actionP.equals("login")) {
			response.sendRedirect(ProjectSettings.pathPrefix + "ui/login.jsp");
		}	
	} // /BultermPr

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// boolean doSearch = false;
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// session.removeAttribute("first_visit");
		// int languageIdS =
		// Integer.parseInt(String.valueOf(session.getAttribute("language_id")));
		// String columnToSearchS = String.valueOf(session.getAttribute("columnToSearch"));
		// String symbolsToSearchS = null;
		// //String.valueOf(session.getAttribute("symbolsToSearch"));
		// String columnsComboP = request.getParameter("columnsCombo");
		// String columnToSearchP = getColumnToSearch(columnsComboP);
		// request.setCharacterEncoding("UTF8");
		String emailP = request.getParameter("emailInput");
		String passwordP = request.getParameter("passwordInput");
		// symbolsToSearchP.
		// never used DbProvider dbProv = new DbProvider();
		// boolean makeNewSearch = false;
		User user = (User) session.getAttribute("user");
		if (emailP != null && !emailP.equals("") && emailP.equals("info@bulterm.improve1.com")
				&& passwordP.equals("xxx")) { // parsiparovsivanov
			// && symbolsToSearchP != symbolsToSearchS
			// || (columnToSearchP != null && columnToSearchP !=
			// columnToSearchS) ) {
			// && symbolsToSearchP != ""
			// User user = new User();
			if (!user.isLogged()) {
				user.login(emailP, passwordP);
			}
			// session.removeAttribute("user");
			// session.setAttribute("user", user);
			// makeNewSearch = true;
			String anchorS = String.valueOf(session.getAttribute("anchor"));
			session.removeAttribute("anchor");
			if (anchorS.equals("null")) {
				anchorS = "";
			}
			// TODO 0 Not sure what is the role of anchor here?
			// response.sendRedirect(ProjectSettings.pathPrefix +
			// "ui/term_list_edit.jsp" + anchorS);
			// response.sendRedirect(ProjectSettings.pathPrefix +
			// "ui/term_list_edit.jsp");
		} else { // if (symbolsToSearchS != null) {
			// session.removeAttribute("user");
			user.setIsLogged(false);
			String anchorS = String.valueOf(session.getAttribute("anchor"));
			session.removeAttribute("anchor");
			if (anchorS.equals("null")) {
				anchorS = "";
			}
		}
		session.setAttribute("user", user);
		response.sendRedirect(ProjectSettings.pathPrefix + "servlet/TermListServlet?language_id=2&first_visit=true"); 
		//  + anchorS    ui/term_list.jsp
	}

}
