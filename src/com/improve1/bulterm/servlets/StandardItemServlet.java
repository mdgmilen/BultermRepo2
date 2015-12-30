package com.improve1.bulterm.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StandardItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StandardItemServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		String actionP = request.getParameter("do_what");
		int standardId = 0;
		String standardIdP = request.getParameter("standard_id");
		if (standardIdP != null) standardId = Integer.parseInt(standardIdP);
		DbProvider dbProv = new DbProvider();
		if        (actionP != null && actionP.equals("edit_standard")) {
			// session.setAttribute("term_id", termIdP);
			session.setAttribute("standard", dbProv.getStandard(standardId));
			session.setAttribute("mode", "edit");
		} else if (actionP != null && actionP.equals("new_standard")) {
			session.setAttribute("mode", "new");
		} else if (actionP != null && actionP.equals("delete_standard")) {
			session.setAttribute("standard", dbProv.getStandard(standardId));
			session.setAttribute("mode", "delete");
		} else
			session.setAttribute("mode", "review");
		// Standard terms = (Standard) session.getAttribute("terms");
		response.sendRedirect(ProjectSettings.pathPrefix
				+ "ui/standard_item_edit.jsp");
	}//doGet()

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		String actionS = String.valueOf(session.getAttribute("mode"));
		Standard standardS = (Standard) session.getAttribute("standard");

		//String actionP = request.getParameter("do_what");
		String identifierParP = request.getParameter("s_identifier");
		String nameParP = request.getParameter("s_name");
		DbProvider dbProv = new DbProvider();
		switch (actionS) {
		case "new":  session.setAttribute("standard", dbProv.getStandard(dbProv.newStandard(identifierParP, nameParP ))  );
          break;
        case "edit":  dbProv.editStandard(standardS.getStandardId(), identifierParP, nameParP );
		  session.setAttribute("standard", dbProv.getStandard(standardS.getStandardId()));
		  break;
        case "delete":  dbProv.deleteStandard(standardS.getStandardId());
		  //session.setAttribute("standard", dbProv.getStandard(standardS.getStandardId()));
          session.removeAttribute("standard");
		  break;
        //default:
        	//break;
		}//switch
		session.setAttribute("mode", "review");
		response.sendRedirect(ProjectSettings.pathPrefix + "servlet/StandardItemEditServlet");  //ui/standard_item_edit.jsp
	}//doPost()
}
