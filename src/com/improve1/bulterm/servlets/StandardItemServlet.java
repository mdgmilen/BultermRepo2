package com.improve1.bulterm.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.improve1.bulterm.DA_Cud;
import com.improve1.bulterm.DA_Retrieve;
import com.improve1.bulterm.ProjectSettings;
import com.improve1.bulterm.entities.Standard;

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
		//DbProvider dbProv = new DbProvider();
		DA_Retrieve dbProv = new DA_Retrieve();
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
		DA_Cud daCud = new DA_Cud();
		DA_Retrieve daRetrieve = new DA_Retrieve();
		switch (actionS) {
		case "new":  session.setAttribute("standard", daRetrieve.getStandard(daCud.newStandard(identifierParP, nameParP ))  );
          break;
        case "edit":  daCud.editStandard(standardS.getStandardId(), identifierParP, nameParP );
		  session.setAttribute("standard", daRetrieve.getStandard(standardS.getStandardId()));
		  break;
        case "delete":  daCud.deleteStandard(standardS.getStandardId());
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
