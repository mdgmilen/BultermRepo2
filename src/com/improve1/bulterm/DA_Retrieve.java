package com.improve1.bulterm;

//import java.sql.ResultSet;
//import java.sql.SQLException;

public class DA_Retrieve {
/*	public TermList getTerms(int languageId, String columnToSearch,
			String symbolsToSearch, int firstRowNo, int lastRowNo,
			boolean isNotLimited) {
		TermList terms = null;
		connect();
		String columnName = getColumnName(columnToSearch);
		String sqlQuery = getTermsSql(columnName, symbolsToSearch, firstRowNo,
				lastRowNo, isNotLimited);
		try {
			this.prepStmt = this.conn
					.prepareStatement(sqlQuery,
							ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			this.prepStmt.setInt(1, languageId);
			// if (!isNotLimited) {
			this.prepStmt.setMaxRows(350);
			// }
			this.rset = this.prepStmt.executeQuery();
			while (this.rset.next()) {
				if (terms == null) {
					terms = new TermList();
				}
				Term termObj = new Term();
				termObj.setGroupId(this.rset.getInt(1));
				termObj.setGroupIdentifier(this.rset.getString(2));
				termObj.setGroupName(this.rset.getString(3));
				termObj.setStandardId(this.rset.getInt(4));
				termObj.setStandardIdentifier(this.rset.getString(5));
				termObj.setStandardName(this.rset.getString(6));
				int termId = this.rset.getInt(7);
				termObj.setTermId(termId);
				termObj.setTermName(this.rset.getString(8));
				if (this.rset.getString(9) == null) {
					termObj.setTermDescription("");
				} else {
					termObj.setTermDescription(this.rset.getString(9));
				}
				this.prepStmt2 = this.conn
						.prepareStatement(
								"select l.id, l.name_a, em.name_a term_name"
										+ " from entries_multilanguage em, entries e, languages l"
										+ " where e.id = em.entry_id and em.language_id = l.id"
										+ " and e.id = ?",
								ResultSet.TYPE_SCROLL_SENSITIVE,
								ResultSet.CONCUR_READ_ONLY);
				this.prepStmt2.setInt(1, termId);
				this.rset2 = this.prepStmt2.executeQuery();
				LanguageList languages = null;
				while (this.rset2.next()) {
					if (languages == null) {
						languages = new LanguageList();
					}
					Language languageObj = new Language();
					languageObj.setId(this.rset2.getInt(1));
					languageObj.setName(this.rset2.getString(2));
					languages.add(languageObj);
				}
				termObj.setLanguages(languages);

				terms.add(termObj);
			}// while
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return terms;
	} // getTerms()
	
	public int getResultsCount(int languageId, String columnToSearch,
			String symbolsToSearch, boolean isNotLimited) {
		int resultsCount = 0;
		connect();
		String columnName = getColumnName(columnToSearch);
		String sqlCount = getResultsCountSql();
		try {
			this.prepStmt = this.conn
					.prepareStatement(sqlCount,
							ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			this.prepStmt.setInt(1, languageId);
			// this.prepStmt.setMaxRows(50);
			this.rset = this.prepStmt.executeQuery();
			this.rset.next();
			resultsCount = this.rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultsCount;
	}// getResultsCount()
	
	public TermList getTermsAll(int resultsCount, int countPerPageNum, int selectedPageNum, int selectedLanguageId, String symbolsToSearch) {
		TermList terms = null;
		connect();
		// String columnName = getColumnName(columnToSearch);
		int pagesCount = 0;
		if (resultsCount%countPerPageNum == 0) {
		  pagesCount = resultsCount/countPerPageNum;  //520/50=11pages
		} else {
			pagesCount = (int)resultsCount/countPerPageNum + 1;
		}
		//should be, selectedPageNum <= pagesCount
		if (selectedPageNum > pagesCount) { return null; }
		int rowToStartWithNum = (selectedPageNum-1)*countPerPageNum;
		
		String sqlQuery = getTermsAllSql(rowToStartWithNum, countPerPageNum, selectedLanguageId, symbolsToSearch);
		try {
			this.prepStmt = this.conn
					.prepareStatement(sqlQuery,
							ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			this.prepStmt.setMaxRows(350);
			this.rset = this.prepStmt.executeQuery();
			while (this.rset.next()) {
				if (terms == null) {
					terms = new TermList();
				}
				Term termObj = new Term();
				termObj.setTermId(this.rset.getInt(1));
				termObj.setTermNames(getTermNames(this.rset));
				if (this.rset.getString(7) == null) {
					termObj.setTermDescription("");
				} else {
					termObj.setTermDescription(this.rset.getString(7));
				}
				termObj.setStandardId(this.rset.getInt(8));
				termObj.setStandardIdentifier(this.rset.getString(9));
				termObj.setStandardName(this.rset.getString(10));

				terms.add(termObj);
			}// while
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return terms;
	} // getTermsAll()
	
	public Term getTerm(int id) {
		Term termObj = new Term();
		connect();
		String sql = "select e.id termId, em1.name_a tnEnglish, em2.name_a tnBulgarian, em3.name_a tnRussian,"
				+ " em4.name_a tnGerman,  em5.name_a tnFrench,"
				+ " tm.description termDescr,"
				+ " e2.id standardId, tc.identifier standardIdent, e2.entry_name standardName"
				+ " from entries e"
				+ " left join entries_multilanguage em1 on em1.entry_id = e.id and em1.language_id = 1"
				+ " left join entries_multilanguage em2 on em2.entry_id = e.id and em2.language_id = 2"
				+ " left join entries_multilanguage em3 on em3.entry_id = e.id and em3.language_id = 3"
				+ " left join entries_multilanguage em4 on em4.entry_id = e.id and em4.language_id = 4"
				+ " left join entries_multilanguage em5 on em5.entry_id = e.id and em5.language_id = 5"
				+ " left join terms_multilanguage   tm  on tm.term_id   = e.id"
				+ " left join entries e2               on e2.id = e.parent_entry_id"
				+ " left join term_categories tc       on e2.id = tc.term_id"
				+ " where    e.id = ?"
				+ " and ( em1.name_a is not null or em2.name_a is not null"
				+ " or    em3.name_a is not null or em4.name_a is not null "
				+ " or    em5.name_a is not null )";
		try {
			this.prepStmt = this.conn
					.prepareStatement(sql,
							ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			this.prepStmt.setInt(1, id);
			// this.prepStmt.setMaxRows(50);
			this.rset = this.prepStmt.executeQuery();
			this.rset.next();
			termObj.setTermId(this.rset.getInt(1));
			termObj.setTermNames(getTermNames(this.rset));
			if (this.rset.getString(7) == null) {
				termObj.setTermDescription("");
			} else {
				termObj.setTermDescription(this.rset.getString(7));
			}
			termObj.setStandardId(this.rset.getInt(8));
			termObj.setStandardIdentifier(this.rset.getString(9));
			termObj.setStandardName(this.rset.getString(10));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return termObj;
	}// getTerm()
	
	
	public Term getTermAdapted(Term term, int termLanguageId) {
		// int termId
		int termId = term.getTermId();
		connect();
		try {
			this.prepStmt = this.conn
					.prepareStatement(getTermAdaptedSql(),
							ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			this.prepStmt.setInt(1, termLanguageId);
			this.prepStmt.setInt(2, termId);
			this.rset = this.prepStmt.executeQuery();
			// while(this.rset.next() ) {
			this.rset.next();
			term.setTermName(this.rset.getString(8));
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
		connect();
		try {
			this.prepStmt = this.conn
					.prepareStatement(
							"select tc.term_id, tc.identifier, e.entry_name "
									+ " from term_categories tc"
									+ " inner join entries e on e.id = tc.term_id"
									+ "   and e.parent_entry_id is not null",
							ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			// this.prepStmt.setMaxRows(50);
			this.rset = this.prepStmt.executeQuery();
			while (this.rset.next()) {
				if (standards == null) {
					standards = new StandardList();
				}
				Standard standardObj = new Standard();
				// standardObj.setGroupId(this.rset.getInt(1));
				// standardObj.setGroupIdentifier(this.rset.getString(2));
				// standardObj.setGroupName(this.rset.getString(3));
				standardObj.setStandardId(this.rset.getInt(1));
				standardObj.setStandardIdentifier(this.rset.getString(2));
				standardObj.setStandardName(this.rset.getString(3));

				standards.add(standardObj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return standards;
	}// getStandards()
	
	public Standard getStandard(int id) {
		Standard standard = new Standard();
		connect();
		try {
			this.prepStmt = this.conn
					.prepareStatement(
							"select tc.term_id, tc.identifier, e.entry_name"
									+ " from entries e"
									+ " inner join term_categories tc on e.id = tc.term_id"
									+ " and tc.term_id = ?",
							ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			this.prepStmt.setInt(1, id);
			// this.prepStmt.setMaxRows(50);
			this.rset = this.prepStmt.executeQuery();
			this.rset.next();
			// standardObj.setGroupId(this.rset.getInt(1));
			// standardObj.setGroupIdentifier(this.rset.getString(2));
			// standardObj.setGroupName(this.rset.getString(3));
			standard.setStandardId(this.rset.getInt(1));
			standard.setStandardIdentifier(this.rset.getString(2));
			standard.setStandardName(this.rset.getString(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return standard;
	}// getStandard()
	
	public LanguageList getLanguages() {
		LanguageList languages = null;
		connect();
		try {
			this.prepStmt = this.conn.prepareStatement("select a.id, a.name_a"
					+ " from languages a", ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			// this.prepStmt.setMaxRows(50);
			this.rset = this.prepStmt.executeQuery();
			while (this.rset.next()) {
				if (languages == null) {
					languages = new LanguageList();
				}
				Language languageObj = new Language();
				languageObj.setId(this.rset.getInt(1));
				languageObj.setName(this.rset.getString(2));

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
	}//getLanguages()*/
}
