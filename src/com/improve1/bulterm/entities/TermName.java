package com.improve1.bulterm.entities;

import java.io.Serializable;

public class TermName implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int languageId;
	private String termName;
	
	public int getLanguageId() {
		return languageId;
	}
	public void setLanguageId(int languageId) {
		this.languageId = languageId;
	}
	public String getTermName() {
		return termName;
	}
	public void setTermName(String termName) {
		this.termName = termName;
	}
}
