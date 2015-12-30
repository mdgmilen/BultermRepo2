package com.improve1.bulterm.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TermListEditServlet
 */
public class TermItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TermItemServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		String actionP = request.getParameter("do_what");
		// String actionP = String.valueOf(session.getAttribute("email"));

		// form termId(incl. XXX) All(incl.Empty) EditableXxx if ... SaveNew or
		// SaveEdited and Cancel (re-view and EditSomethingElse or CloseWindow
		// (new term was not added))
		// form Confirmation (Saved or empty) termId All(incl.Empty)
		// OptionsLinks (edit addNew new)

		int termId = 0;
		String termIdP = request.getParameter("term_id");
		DbProvider dbProv=null;
		dbProv = new DbProvider();
		
		boolean thereIsAction = false; if (actionP != null) { thereIsAction = true;	}
		boolean thereIsTermId = false; if (termIdP != null) { thereIsTermId = true; }

		if (thereIsTermId) {// (thereIsAction && !actionP.equals("new_term")) {
			termId = Integer.parseInt(termIdP);
			session.setAttribute("term", dbProv.getTerm(termId));
		}
		if (thereIsAction) {
			if (actionP.startsWith("new_")) {
				session.setAttribute("mode", "new");
			} else if (actionP.startsWith("edit_")) {
				session.setAttribute("mode", "edit");
			} else if (actionP.equals("delete_term")) {
				session.setAttribute("mode", "delete");
			}
			session.setAttribute("action", actionP);
		} else {
			session.setAttribute("mode", "review");
		}
		
		
		/*
		 * 		int termId = 0;
		String termIdP = request.getParameter("term_id");
	    if (termIdP != null) {
    	  session.setAttribute("term_id", termIdP);
    	  termId = Integer.parseInt(termIdP);
        }
	    TermList terms = (TermList) session.getAttribute("terms");
	    if (termId > 0) {
	      for (int i=0; i < terms.size(); i++) {
	    	if ( termId == ((Term)terms.get(i)).getTermId() ) {
	    	  session.setAttribute("term_id_back", ((Term)terms.get(i)).getTermId());
	    	  session.setAttribute("term_name", ((Term)terms.get(i)).getTermName());
	    	  session.setAttribute("term_description", ((Term)terms.get(i)).getTermDescription());
	    	  break;
	    	}
	      }
	    } else { // exception/error like 
	      session.removeAttribute("term_id_back");
	      session.removeAttribute("term_name");
	      session.removeAttribute("term_description");
	    }
		//DbProvider dbProv = new DbProvider();
		response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_item_view.jsp");*/
		
		
		// Standard terms = (Standard) session.getAttribute("terms");
		response.sendRedirect(ProjectSettings.pathPrefix
				+ "ui/term_item_edit.jsp");
	}// doGet()

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		

		Term termS = (Term) session.getAttribute("term");
		//String modeS = String.valueOf(session.getAttribute("mode"));
		String actionS = String.valueOf(session.getAttribute("action"));
		
		// 5 new_tenglish   new_tbulgarian  new_trussian  new_tgerman  new_tfrench
		// 5 edit_tenglish edit_tbulgarian edit_trussian edit_tgerman edit_tfrench
		// 2 new_tdescription edit_tdescription
		// 2 new_tstandard edit_tstandard
		// 1 new_term

		DbProvider dbProv = new DbProvider();
		if (/*modeS.equals("new") &&*/ actionS.equals("new_term") ) {
			//termIdS, 2, 70 parentEntryId 
			int newTermId = dbProv.newTerm(request.getParameter("t_bulgarian"));
			session.setAttribute("term", dbProv.getTerm(newTermId) );
		} else { //if (modeS.equals("new")) {
		//} else if (modeS.equals("edit")) {
			String itemValue = "";
			//switch (actionS) {
			if (actionS.endsWith("_tstandard") )    itemValue = request.getParameter("t_standardId"); else
			if (actionS.endsWith("_tdescription") ) itemValue = request.getParameter("t_description"); else
			if (actionS.endsWith("_tenglish") )     itemValue = request.getParameter("t_english"); else
			if (actionS.endsWith("_tbulgarian") )   itemValue = request.getParameter("t_bulgarian"); else
			if (actionS.endsWith("_trussian") )     itemValue = request.getParameter("t_russian"); else
			if (actionS.endsWith("_tgerman") )      itemValue = request.getParameter("t_german"); else
			if (actionS.endsWith("_tfrench") )      itemValue = request.getParameter("t_french");
	        //default: xxx;     	break;
			//}//switch
			dbProv.editTerm(actionS, termS.getTermId(), itemValue);
			session.setAttribute("term", dbProv.getTerm(termS.getTermId()));
		}// if, is not new_term
		//sp_update_term("+termId+", '"+action+"', "+languageId+", '"+itemName+"', '"+valueEbrgfDs+"')
		
		//String actionP = request.getParameter("actionInput");
		/*
		 * String actionP = request.getParameter("termIdInput"); String actionP
		 * = request.getParameter("termLanguageIdInput"); String actionP =
		 * request.getParameter("termNameInput"); String actionP =
		 * request.getParameter("termDescriptionInput");
		 
		if (actionP != null && !actionP.equals("")) {
			if (actionP.equals("edit")) {
				System.out.println("edit");
			} else if (actionP.equals("new")) {
				System.out.println("new");
			} else if (actionP.equals("delete")) {
				System.out.println("delete");
			} else if (actionP.equals("delete_confirmed")) {
				System.out.println("delete");
			}
		}*/
		if (actionS.equals("delete_term") ) {
			dbProv.deleteTerm(termS.getTermId());
			session.removeAttribute("term");
		}
		  //session.setAttribute("standard", dbProv.getStandard(standardS.getStandardId()));
        //session.removeAttribute("term");
        session.removeAttribute("action");
		
		//session.setAttribute("mode", "review");
		response.sendRedirect(ProjectSettings.pathPrefix + "servlet/TermItemEditServlet"); //?term_id="+termS.getTermId());
		
		//response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_item_view.jsp");
	}

}
