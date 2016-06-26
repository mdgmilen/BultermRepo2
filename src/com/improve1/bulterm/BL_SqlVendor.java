package com.improve1.bulterm;

public class BL_SqlVendor {

	public String getTermsSql(String columnName, String symbolsToSearch, int firstRowNo, int lastRowNo,
			boolean isNotLimited) {
		String sqlQuery = null;
		if (symbolsToSearch != null) { // columnToSearch != null &&
			sqlQuery = " select" + "   eg.id groupId,    tcg.identifier groupI,    eg.entry_name groupN,"
					+ "   es.id standardId, tcs.identifier standardI, es.entry_name standardN,"
					+ "   e.id termId,      em.name_a termN,          tm.description termD"
					// + " , em1.name_a tnEnglish, em2.name_a tnBulgarian,
					// em3.name_a tnRussian, em4.name_a nGerman, em5.name_a
					// tnFrench"
					+ " from entries e" + " inner join entries_multilanguage em on em.entry_id = e.id"
					+ "   and em.language_id = ?";
			if (!isNotLimited) {
				sqlQuery += " and " + columnName + " like '%" + symbolsToSearch + "%'";
				// " and em.name_a like '%втулка%'" +
			}
			sqlQuery += " left  join terms_multilanguage tm on    tm.term_id  = e.id" + "   and tm.language_id = 2"
					+ " inner join entries es on     es.id = e.parent_entry_id"
					+ " inner join term_categories tcs on tcs.term_id = es.id"
					+ " inner join entries eg on     eg.id = es.parent_entry_id"
					+ " inner join term_categories tcg on tcg.term_id = eg.id";
		} // if symbolsToSearch != null
		return sqlQuery;
	}// getTermsSql()

	public String getTermAdaptedSql() {
		String sqlQuery = " select" + "   eg.id groupId,    tcg.identifier groupI,    eg.entry_name groupN,"
				+ "   es.id standardId, tcs.identifier standardI, es.entry_name standardN,"
				+ "   e.id termId,      em.name_a termN,          tm.description termD" + " from entries e"
				+ " inner join entries_multilanguage em on em.entry_id = e.id" + "   and em.language_id = ?"
				+ " left  join terms_multilanguage tm on    tm.term_id  = e.id" + "   and tm.language_id = 2"
				+ " inner join entries es on     es.id = e.parent_entry_id"
				+ " inner join term_categories tcs on tcs.term_id = es.id"
				+ " inner join entries eg on     eg.id = es.parent_entry_id"
				+ " inner join term_categories tcg on tcg.term_id = eg.id" + " where e.id = ?";
		return sqlQuery;
	}// getTermAdaptedSql()

	public String getResultsCountSql(String columnName, String symbolsToSearch, boolean isNotLimited) {
		String sqlCount = "select count(*) from (" + " select"
				+ "   eg.id groupId,    tcg.identifier groupI,    eg.entry_name groupN,"
				+ "   es.id standardId, tcs.identifier standardI, es.entry_name standardN,"
				+ "   e.id termId,      em.name_a termN,          tm.description termD" + " from entries e"
				+ " inner join entries_multilanguage em on em.entry_id = e.id" + "   and em.language_id = ?";
		if (!isNotLimited) {
			sqlCount += " and " + columnName + " like '%" + symbolsToSearch + "%'";
			// " and em.name_a like '%втулка%'" +
		}
		sqlCount += " left  join terms_multilanguage tm on    tm.term_id  = e.id" + "   and tm.language_id = 2"
				+ " left join entries es on     es.id = e.parent_entry_id"
				+ " left join term_categories tcs on tcs.term_id = es.id"
				+ " left join entries eg on     eg.id = es.parent_entry_id"
				+ " left join term_categories tcg on tcg.term_id = eg.id"
				+ " left join entries_multilanguage em_bulgarian on e.id = em_bulgarian.entry_id and em_bulgarian.language_id = 2"
				+ " where em_bulgarian.name_a is not null " + " ) a";
		return sqlCount;
	}// getResultsCountSql

	public String getTermsAllSql(int rowToStartWith, int countPerPage, int selectedLanguageId, String symbolsToSearch) {
		String sqlQuery = null;
		sqlQuery = "select e.id termId, em1.name_a tnEnglish, em2.name_a tnBulgarian, em3.name_a tnRussian,"
				+ " em4.name_a tnGerman,  em5.name_a tnFrench," + " tm.description termDescr,"
				+ " e2.id standardId, tc.identifier standardIdent, e2.entry_name standardName" + " from entries e"
				+ " left join entries_multilanguage em1 on em1.entry_id = e.id and em1.language_id = 1"
				+ " left join entries_multilanguage em2 on em2.entry_id = e.id and em2.language_id = 2"
				+ " left join entries_multilanguage em3 on em3.entry_id = e.id and em3.language_id = 3"
				+ " left join entries_multilanguage em4 on em4.entry_id = e.id and em4.language_id = 4"
				+ " left join entries_multilanguage em5 on em5.entry_id = e.id and em5.language_id = 5"
				+ " left join terms_multilanguage   tm  on tm.term_id   = e.id"
				+ " left join entries e2                on e2.id = e.parent_entry_id"
				+ " left join term_categories tc       on e2.id = tc.term_id" + " where ";
		if (!symbolsToSearch.equals("")) {
			switch (selectedLanguageId) {
			case 1:
				sqlQuery += "em1.name_a";
				break;
			case 2:
				sqlQuery += "em2.name_a";
				break;
			case 3:
				sqlQuery += "em3.name_a";
				break;
			case 4:
				sqlQuery += "em4.name_a";
				break;
			case 5:
				sqlQuery += "em5.name_a";
				break;
			// default: xxx; break;
			}// switch
			sqlQuery += " like '%" + symbolsToSearch + "%' and";
		}
		sqlQuery += " ( em1.name_a is not null or em2.name_a is not null"
				+ " or    em3.name_a is not null or em4.name_a is not null " + " or    em5.name_a is not null )"
				// + " order by e.id desc";
				+ " LIMIT " + rowToStartWith + ", " + countPerPage + "";
		return sqlQuery;
	}// getTermsAllSql()
}// class
