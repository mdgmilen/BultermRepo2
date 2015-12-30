package com.improve1.bulterm.servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class StandardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StandardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		DbProvider dbProv = new DbProvider();
		session.setAttribute("standards", dbProv.getStandards());
		response.sendRedirect(ProjectSettings.pathPrefix + "ui/standard_list_edit.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_list_view.jsp");
	}
}//class
