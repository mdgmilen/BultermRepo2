package com.improve1.bulterm;

import com.improve1.bulterm.entities.*;
//import com.mysql.jdbc.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class DA_Retrieve {
	private DA_Cud daCud;
	private BL_Contributor blContributor;
	private BL_SqlVendor blSqlVendor;

	public DA_Retrieve() {
		daCud = new DA_Cud();
		blContributor = new BL_Contributor();
		blSqlVendor = new BL_SqlVendor();
	}

	public TermList getTerms(int languageId, String columnToSearch, String symbolsToSearch, int firstRowNo,
			int lastRowNo, boolean isNotLimited) {
		TermList terms = null;
		daCud.connect();
		String columnName = blContributor.getColumnName(columnToSearch);
		String sqlQuery = blSqlVendor.getTermsSql(columnName, symbolsToSearch, firstRowNo, lastRowNo, isNotLimited);
		try {
			daCud.setPrepStmt(daCud.getConn().prepareStatement(sqlQuery, ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY));
			daCud.getPrepStmt().setInt(1, languageId);
			// if (!isNotLimited) {
			daCud.getPrepStmt().setMaxRows(350);
			// }
			daCud.setRset(daCud.getPrepStmt().executeQuery());
			while (daCud.getRset().next()) {
				if (terms == null) {
					terms = new TermList();
				}
				Term termObj = new Term();
				termObj.setGroupId(daCud.getRset().getInt(1));
				termObj.setGroupIdentifier(daCud.getRset().getString(2));
				termObj.setGroupName(daCud.getRset().getString(3));
				termObj.setStandardId(daCud.getRset().getInt(4));
				termObj.setStandardIdentifier(daCud.getRset().getString(5));
				termObj.setStandardName(daCud.getRset().getString(6));
				int termId = daCud.getRset().getInt(7);
				termObj.setTermId(termId);
				termObj.setTermName(daCud.getRset().getString(8));
				if (daCud.getRset().getString(9) == null) {
					termObj.setTermDescription("");
				} else {
					termObj.setTermDescription(daCud.getRset().getString(9));
				}
				PreparedStatement ps2 = daCud.getConn().prepareStatement(
						"select l.id, l.name_a, em.name_a term_name"
								+ " from entries_multilanguage em, entries e, languages l"
								+ " where e.id = em.entry_id and em.language_id = l.id" + " and e.id = ?",
						ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				daCud.setPrepStmt2(ps2);
				daCud.getPrepStmt2().setInt(1, termId);
				ResultSet rs2 = daCud.getPrepStmt2().executeQuery();
				daCud.setRset2(rs2);
				LanguageList languages = null;
				while (daCud.getRset2().next()) {
					if (languages == null) {
						languages = new LanguageList();
					}
					Language languageObj = new Language();
					languageObj.setId(daCud.getRset2().getInt(1));
					languageObj.setName(daCud.getRset2().getString(2));
					languages.add(languageObj);
				}
				termObj.setLanguages(languages);

				terms.add(termObj);
			} // while
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return terms;
	} // getTerms()

	public int getResultsCount(int languageId, String columnToSearch, String symbolsToSearch, boolean isNotLimited) {
		int resultsCount = 0;
		daCud.connect();
		String columnName = blContributor.getColumnName(columnToSearch);
		String sqlCount = blSqlVendor.getResultsCountSql(columnName, symbolsToSearch, isNotLimited);
		try {
			PreparedStatement ps = daCud.getConn().prepareStatement(sqlCount, ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			daCud.setPrepStmt(ps);
			daCud.getPrepStmt().setInt(1, languageId);
			// this.prepStmt.setMaxRows(50);
			ResultSet rs = daCud.getPrepStmt().executeQuery();
			daCud.setRset(rs);
			daCud.getRset().next();
			resultsCount = daCud.getRset().getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultsCount;
	}// getResultsCount()

	public TermList getTermsAll(int resultsCount, int countPerPageNum, int selectedPageNum, int selectedLanguageId,
			String symbolsToSearch) {
		TermList terms = null;
		daCud.connect();
		// String columnName = getColumnName(columnToSearch);
		int pagesCount = 0;
		if (resultsCount % countPerPageNum == 0) {
			pagesCount = resultsCount / countPerPageNum; // 520/50=11pages
		} else {
			pagesCount = (int) resultsCount / countPerPageNum + 1;
		}
		// should be, selectedPageNum <= pagesCount
		if (selectedPageNum > pagesCount) {
			return null;
		}
		int rowToStartWithNum = (selectedPageNum - 1) * countPerPageNum;

		String sqlQuery = blSqlVendor.getTermsAllSql(rowToStartWithNum, countPerPageNum, selectedLanguageId,
				symbolsToSearch);
		try {
			PreparedStatement ps = daCud.getConn().prepareStatement(sqlQuery, ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			daCud.setPrepStmt(ps);
			daCud.getPrepStmt().setMaxRows(350);
			ResultSet rs = daCud.getPrepStmt().executeQuery();
			daCud.setRset(rs);
			while (daCud.getRset().next()) {
				if (terms == null) {
					terms = new TermList();
				}
				Term termObj = new Term();
				termObj.setTermId(daCud.getRset().getInt(1));
				termObj.setTermNames(blContributor.getTermNames(daCud.getRset()));
				if (daCud.getRset().getString(7) == null) {
					termObj.setTermDescription("");
				} else {
					termObj.setTermDescription(daCud.getRset().getString(7));
				}
				termObj.setStandardId(daCud.getRset().getInt(8));
				termObj.setStandardIdentifier(daCud.getRset().getString(9));
				termObj.setStandardName(daCud.getRset().getString(10));

				terms.add(termObj);
			} // while
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return terms;
	} // getTermsAll()

	public Term getTerm(int id) {
		Term termObj = new Term();
		daCud.connect();
		String sql = "select e.id termId, em1.name_a tnEnglish, em2.name_a tnBulgarian, em3.name_a tnRussian,"
				+ " em4.name_a tnGerman,  em5.name_a tnFrench," + " tm.description termDescr,"
				+ " e2.id standardId, tc.identifier standardIdent, e2.entry_name standardName" + " from entries e"
				+ " left join entries_multilanguage em1 on em1.entry_id = e.id and em1.language_id = 1"
				+ " left join entries_multilanguage em2 on em2.entry_id = e.id and em2.language_id = 2"
				+ " left join entries_multilanguage em3 on em3.entry_id = e.id and em3.language_id = 3"
				+ " left join entries_multilanguage em4 on em4.entry_id = e.id and em4.language_id = 4"
				+ " left join entries_multilanguage em5 on em5.entry_id = e.id and em5.language_id = 5"
				+ " left join terms_multilanguage   tm  on tm.term_id   = e.id"
				+ " left join entries e2               on e2.id = e.parent_entry_id"
				+ " left join term_categories tc       on e2.id = tc.term_id" + " where    e.id = ?"
				+ " and ( em1.name_a is not null or em2.name_a is not null"
				+ " or    em3.name_a is not null or em4.name_a is not null " + " or    em5.name_a is not null )";
		try {
			PreparedStatement ps = daCud.getConn().prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			daCud.setPrepStmt(ps);
			daCud.getPrepStmt().setInt(1, id);
			// this.prepStmt.setMaxRows(50);
			ResultSet rs = daCud.getPrepStmt().executeQuery();
			daCud.setRset(rs);
			daCud.getRset().next();
			termObj.setTermId(daCud.getRset().getInt(1));
			termObj.setTermNames(blContributor.getTermNames(daCud.getRset()));
			if (daCud.getRset().getString(7) == null) {
				termObj.setTermDescription("");
			} else {
				termObj.setTermDescription(daCud.getRset().getString(7));
			}
			termObj.setStandardId(daCud.getRset().getInt(8));
			termObj.setStandardIdentifier(daCud.getRset().getString(9));
			termObj.setStandardName(daCud.getRset().getString(10));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return termObj;
	}// getTerm()

	public Term getTermAdapted(Term term, int termLanguageId) {
		// int termId
		int termId = term.getTermId();
		daCud.connect();
		try {
			PreparedStatement ps = daCud.getConn().prepareStatement(blSqlVendor.getTermAdaptedSql(),
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			daCud.setPrepStmt(ps);
			daCud.getPrepStmt().setInt(1, termLanguageId);
			daCud.getPrepStmt().setInt(2, termId);
			ResultSet rs = daCud.getPrepStmt().executeQuery();
			daCud.setRset(rs);
			// while(this.rset.next() ) {
			daCud.getRset().next();
			term.setTermName(daCud.getRset().getString(8));
			term.setSelectedLanguageId(termLanguageId);
			// if (this.rset.getString(9) == null) {
			// term.setTermDescription("");
			// } else {
			// term.setTermDescription(this.rset.getString(9));
			// }
			// TOD check if there is only 1 record
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return term;
	}

	public StandardList getStandards() {
		StandardList standards = null;
		daCud.connect();
		try {
			PreparedStatement ps = daCud.getConn()
					.prepareStatement("select tc.term_id, tc.identifier, e.entry_name " + " from term_categories tc"
							+ " inner join entries e on e.id = tc.term_id" + "   and e.parent_entry_id is not null",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			daCud.setPrepStmt(ps);
			// this.prepStmt.setMaxRows(50);
			ResultSet rs = daCud.getPrepStmt().executeQuery();
			daCud.setRset(rs);
			while (daCud.getRset().next()) {
				if (standards == null) {
					standards = new StandardList();
				}
				Standard standardObj = new Standard();
				// standardObj.setGroupId(this.rset.getInt(1));
				// standardObj.setGroupIdentifier(this.rset.getString(2));
				// standardObj.setGroupName(this.rset.getString(3));
				standardObj.setStandardId(daCud.getRset().getInt(1));
				standardObj.setStandardIdentifier(daCud.getRset().getString(2));
				standardObj.setStandardName(daCud.getRset().getString(3));

				standards.add(standardObj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return standards;
	}// getStandards()

	public Standard getStandard(int id) {
		Standard standard = new Standard();
		daCud.connect();
		try {
			PreparedStatement ps = daCud.getConn().prepareStatement(
					"select tc.term_id, tc.identifier, e.entry_name" + " from entries e"
							+ " inner join term_categories tc on e.id = tc.term_id" + " and tc.term_id = ?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			daCud.setPrepStmt(ps);
			daCud.getPrepStmt().setInt(1, id);
			// this.prepStmt.setMaxRows(50);
			ResultSet rs = daCud.getPrepStmt().executeQuery();
			daCud.setRset(rs);
			daCud.getRset().next();
			// standardObj.setGroupId(this.rset.getInt(1));
			// standardObj.setGroupIdentifier(this.rset.getString(2));
			// standardObj.setGroupName(this.rset.getString(3));
			standard.setStandardId(daCud.getRset().getInt(1));
			standard.setStandardIdentifier(daCud.getRset().getString(2));
			standard.setStandardName(daCud.getRset().getString(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return standard;
	}// getStandard()

	public LanguageList getLanguages() {
		LanguageList languages = null;
		daCud.connect();
		try {
			PreparedStatement ps = daCud.getConn().prepareStatement("select a.id, a.name_a" + " from languages a",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			daCud.setPrepStmt(ps);
			// this.prepStmt.setMaxRows(50);
			ResultSet rs = daCud.getPrepStmt().executeQuery();
			daCud.setRset(rs);
			while (daCud.getRset().next()) {
				if (languages == null) {
					languages = new LanguageList();
				}
				Language languageObj = new Language();
				languageObj.setId(daCud.getRset().getInt(1));
				languageObj.setName(daCud.getRset().getString(2));

				languages.add(languageObj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// try {
		// this.rset.close();
		// } catch (SQLException e) {
		// // TOD Auto-generated catch block
		// e.printStackTrace();
		// }
		return languages;
	}// getLanguages()
}
