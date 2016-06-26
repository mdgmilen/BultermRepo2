package com.improve1.bulterm.servlets;
/*package com.improve1.bulterm;*/

//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.improve1.fashion.controller.HttpSession;
import java.io.IOException;
import java.math.BigInteger;
import java.sql.Date;
import java.text.Format;
import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.lang.Math;

import javax.servlet.*;
import javax.servlet.http.*;

import com.improve1.bulterm.DA_Cud;
import com.improve1.bulterm.DA_Retrieve;
import com.improve1.bulterm.ProjectSettings;
import com.improve1.bulterm.entities.Term;
import com.improve1.bulterm.entities.TermList;

/**
 * Servlet implementation class TermListServlet
 */
public class TermListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TermListServlet() {
		super();
		// TOD Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// boolean hasToAdaptTerm = false;
		// TOD Auto-generated method stub
		HttpSession session = request.getSession();
		// session.setAttribute("hello", "Zdravej");
		String actionP = request.getParameter("action");
		String emailS = String.valueOf(session.getAttribute("email"));
		if (actionP != null && actionP.equals("edit")) {
			if (emailS.equals("null")) {
				response.sendRedirect(ProjectSettings.pathPrefix + "ui/login.jsp");
				return;
			} else {
				String anchorS = String.valueOf(session.getAttribute("anchor"));
				session.removeAttribute("anchor");
				response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_list_view_edit.jsp" + anchorS);
				return;
			}
		}
		// DbProvider dbProv = new DbProvider();
		DA_Retrieve daRetrieve = new DA_Retrieve();
		session.setAttribute("languages", daRetrieve.getLanguages());
		// get parameter languageId
		int languageId = 0;
		String languageIdP = request.getParameter("language_id");
		if (languageIdP != null) {
			session.setAttribute("language_id", languageIdP);
			languageId = Integer.parseInt(languageIdP);
		}
		String firstVisitP = request.getParameter("first_visit");
		if ((firstVisitP != null) && (firstVisitP.equals("true"))) {
			session.setAttribute("first_visit", firstVisitP);
			session.removeAttribute("symbolsToSearch");
			session.removeAttribute("terms");
			session.removeAttribute("resultsCount");
			session.removeAttribute("countPerPage");
			session.removeAttribute("pageNum");
			session.removeAttribute("unlm");
		} else {
			session.removeAttribute("first_visit");
		}

		if (languageId == 0) {
			languageId = Integer.parseInt(String.valueOf(session.getAttribute("language_id")));
		}
		// int languageId = 2;
		String columnToSearchS = String.valueOf(session.getAttribute("columnToSearch"));
		String symbolsToSearchS = String.valueOf(session.getAttribute("symbolsToSearch"));
		if (columnToSearchS == "null") {
			session.setAttribute("columnToSearch", "em.name_a");
			// session.setAttribute("columnToSearchInd", "5");
			// columnToSearchS = null;
			columnToSearchS = "em.name_a";
		}
		// if (symbolsToSearchS.equals("null") || (symbolsToSearchS.length() <
		// 3) ) {
		// symbolsToSearchS = "втулка"; //null;
		// }
		String termLanguageIdP = "";
		int termLanguageId = 0;
		String termIdP = "";
		int termId = 0;
		termLanguageIdP = request.getParameter("term_language_id");
		if (termLanguageIdP != null) {
			termLanguageId = Integer.parseInt(termLanguageIdP);
			termIdP = request.getParameter("term_id");
			if (termIdP != null) {
				termId = Integer.parseInt(termIdP);
				// hasToAdaptTerm = true;
			}
		}
		if (!(termLanguageId > 0 && termId > 0)) {
			if (firstVisitP != null && !firstVisitP.equals("true")) {
				setTermsTable(session, languageId, columnToSearchS, symbolsToSearchS);
			}
		} else {
			TermList termsS = (TermList) session.getAttribute("terms");
			adaptTerm(daRetrieve, termsS, termLanguageId, termId);
		}
		String termIdBackS = String.valueOf(session.getAttribute("term_id_back"));
		if (!termIdBackS.equals("null") && termId == 0) {
			termId = Integer.parseInt(termIdBackS);
			session.removeAttribute("term_id_back");
		}
		session.setAttribute("anchor", "#anchorTermId" + termId);

		String unlmP = request.getParameter("unlm");
		// String unlmS = String.valueOf(session.getAttribute("unlm"));
		if (unlmP != null && unlmP.equals("true")) {
			TermList terms = (TermList) session.getAttribute("terms");
			String countPerPageStrP = request.getParameter("per_page");
			String pageNumStrP = request.getParameter("page_num");
			session.setAttribute("unlm", unlmP);
			if (countPerPageStrP != null) {
				session.setAttribute("countPerPage", countPerPageStrP);
			}
			if (pageNumStrP != null) {
				session.setAttribute("pageNum", pageNumStrP);
			} else {
				session.setAttribute("pageNum", 1);
			}
			if (terms == null && (symbolsToSearchS.equals("") || symbolsToSearchS.equals("null")
					|| symbolsToSearchS.equals("ALL TERMS"))) {
				setTermsTable(session, languageId, columnToSearchS, "");
				session.setAttribute("symbolsToSearch", "ALL TERMS");
			} else {
				setTermsTable(session, languageId, columnToSearchS, symbolsToSearchS);
				session.setAttribute("symbolsToSearch", symbolsToSearchS);
			}
			session.removeAttribute("unlm");
			response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_list_edit.jsp");
		} else {
			response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_list_view.jsp#anchorTermId" + termId);
		}
	} // doGet()

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean doSearch = false;
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.removeAttribute("first_visit");
		int languageIdS = Integer.parseInt(String.valueOf(session.getAttribute("language_id")));
		String columnToSearchS = String.valueOf(session.getAttribute("columnToSearch"));
		String symbolsToSearchS = null; // String.valueOf(session.getAttribute("symbolsToSearch"));
		String columnsComboP = request.getParameter("columnsCombo");
		String columnToSearchP = getColumnToSearch(columnsComboP);
		// request.setCharacterEncoding("UTF8");
		String symbolsToSearchP = request.getParameter("searchSymbolsInput");
		// symbolsToSearchP.
		// never used DbProvider dbProv = new DbProvider();
		// boolean makeNewSearch = false;
		if (symbolsToSearchP != null && !symbolsToSearchP.equals("")) {
			// && symbolsToSearchP != symbolsToSearchS
			// || (columnToSearchP != null && columnToSearchP !=
			// columnToSearchS) ) {
			// && symbolsToSearchP != ""
			session.setAttribute("symbolsToSearch", symbolsToSearchP);
			if (symbolsToSearchP.length() >= 3) {
				doSearch = true;
			}
			// makeNewSearch = true;
		} else { // if (symbolsToSearchS != null) {
			session.removeAttribute("symbolsToSearch");
		}
		if (columnToSearchP != null && columnToSearchP != columnToSearchS) {
			session.setAttribute("columnToSearch", columnToSearchP);
			// session.setAttribute("columnToSearchInd", columnsComboP);
		}
		// if (makeNewSearch) {
		session.removeAttribute("resultsCount");
		session.removeAttribute("terms");
		columnToSearchS = String.valueOf(session.getAttribute("columnToSearch"));
		symbolsToSearchS = String.valueOf(session.getAttribute("symbolsToSearch"));
		if (symbolsToSearchS.equals("null") || !doSearch) {
			symbolsToSearchS = "втулка"; // null;
			// session.setAttribute("symbolsToSearch", symbolsToSearchS);
		}

		setTermsTable(session, languageIdS, columnToSearchS, symbolsToSearchS);
		// session.setAttribute("terms", dbProv.getTerms(languageIdS,
		// columnToSearchS, symbolsToSearchS, 1, 1));
		int resultsCountS = Integer.parseInt(String.valueOf(session.getAttribute("resultsCount")));

		Date dateTime = new Date(System.currentTimeMillis());
		java.util.Date dateTime1 = new java.util.Date();
		Format formatter;
		formatter = new SimpleDateFormat("yyyy MM dd HH:mm:ss S a Z");
		String dateTimeStr = formatter.format(dateTime1);
		formatter = new SimpleDateFormat("yyyyMMddHHmmssS");
		BigInteger dateTimeInt = new BigInteger(formatter.format(dateTime1));
		// System.out.println(datetime);

		logAction("setTermsTable action", request.getRemoteUser(), request.getRemoteHost(),
				"location" + request.getLocale().getCountry(), symbolsToSearchS, String.valueOf(languageIdS),
				String.valueOf(resultsCountS), request.getRemoteAddr(), "info4", dateTime, dateTimeInt, dateTimeStr);
		// }
		response.sendRedirect(ProjectSettings.pathPrefix + "ui/term_list_view.jsp");
	}

	private String getColumnToSearch(String columnsComboPar) {
		String columnToSearch = null;
		if (columnsComboPar.equals("1")) {
			columnToSearch = "tc1.identifier";
		} else if (columnsComboPar.equals("2")) {
			columnToSearch = "e1.entry_name"; // groupName
		} else if (columnsComboPar.equals("3")) {
			columnToSearch = "tc2.identifier";
		} else if (columnsComboPar.equals("4")) {
			columnToSearch = "e2.entry_name";
		} else if (columnsComboPar.equals("5")) {
			columnToSearch = "em.name_a";
		} else if (columnsComboPar.equals("6")) {
			columnToSearch = "tm.description";
		}
		return columnToSearch;
	}

	void adaptTerm(DA_Retrieve dbProv, TermList terms, int termLanguageId, int termId) {
		// TermList terms = (TermList) session.getAttribute("terms");
		if (termId > 0) {
			Term oldTerm = null;
			for (int i = 0; i < terms.size(); i++) {
				if (termId == ((Term) terms.get(i)).getTermId()) {
					oldTerm = (Term) terms.get(i);
					terms.remove(i);
					terms.insertElementAt(dbProv.getTermAdapted(oldTerm, termLanguageId), i);
					break;
				}
			}
		}
	}

	private void setTermsTable(HttpSession session, int languageId, String columnToSearch, String symbolsToSearch) {
		// DbProvider dbProv = new DbProvider();
		DA_Retrieve dbProv = new DA_Retrieve();
		// int firstRowNo=0, lastRowNo=0;
		// int resultsCountOnPage = 20;
		// int resultsCount = dbProv.getResultsCount(languageId, columnToSearch,
		// symbolsToSearch);
		// double pagesCount = Math.ceil(resultsCount / resultsCountOnPage);

		if (String.valueOf(session.getAttribute("unlm")).equals("true")) {
			int resultsCount = 0;
			if (symbolsToSearch.equals("")) {
				resultsCount = dbProv.getResultsCount(languageId, columnToSearch, symbolsToSearch, true);
			} else {
				resultsCount = dbProv.getResultsCount(languageId, columnToSearch, symbolsToSearch, false);
			}
			session.setAttribute("resultsCount", resultsCount);
			int countPerPageNum = 0;
			Object countPerPageObjS = session.getAttribute("countPerPage");
			if (countPerPageObjS != null) {
				countPerPageNum = Integer.parseInt(String.valueOf(countPerPageObjS));
			}
			int selectedPageNum = 1;
			String selectedPageStrS = String.valueOf(session.getAttribute("pageNum"));
			if (!selectedPageStrS.equals("null")) {
				selectedPageNum = Integer.parseInt(selectedPageStrS);
			}
			session.setAttribute("terms",
					dbProv.getTermsAll(resultsCount, countPerPageNum, selectedPageNum, languageId, symbolsToSearch));
		} else {
			session.setAttribute("resultsCount",
					dbProv.getResultsCount(languageId, columnToSearch, symbolsToSearch, false));
			session.setAttribute("terms", dbProv.getTerms(languageId, columnToSearch, symbolsToSearch, 1, 1, false));
		}
	}

	private void logAction(String action, String name, String ip, String location, String symbolsToSearch,
			String language, String resultsCntStr, String info3, String info4, Date dateTime, BigInteger dateTimeInt,
			String dateTimeStr) {
		// "setTermsTable action", "noName", "no ip", "location" +
		// request.getLocale().getCountry(),
		// symbolsToSearchS, String.valueOf(languageIdS),
		// String.valueOf(resultsCount),
		// String.valueOf(System.currentTimeMillis())
		// DbProvider dbProv = new DbProvider();
		// dbProv.logActionWebuserInfo(action
		DA_Cud daCud = new DA_Cud();
		daCud.logWebuserAction(action, name, ip, location, symbolsToSearch, language, resultsCntStr, info3, info4,
				dateTime, dateTimeInt, dateTimeStr);
	}
}
