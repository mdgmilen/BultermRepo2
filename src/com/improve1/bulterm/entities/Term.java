package com.improve1.bulterm.entities;

import java.io.Serializable;

//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;

public class Term implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int groupId;
	private String groupIdentifier;
	private String groupName;
	private int standardId;
	private String standardIdentifier;
	private String standardName;
	private int termId;
	private String termName;
	private TermNameList termNames;
	//private ArrayList termNames;
	private String termDescription;
	private LanguageList languages;
	private int selectedLanguageId = 0;
	
	public int getSelectedLanguageId() {
		return selectedLanguageId;
	}
	public void setSelectedLanguageId(int selectedLanguageId) {
		this.selectedLanguageId = selectedLanguageId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupIdentifier(String groupIdentifier) {
		this.groupIdentifier = groupIdentifier;
	}
	public String getGroupIdentifier() {
		return groupIdentifier;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setStandardId(int standardId) {
		this.standardId = standardId;
	}
	public int getStandardId() {
		return standardId;
	}
	public void setStandardIdentifier(String standardIdentifier) {
		this.standardIdentifier = standardIdentifier;
	}
	public String getStandardIdentifier() {
		return standardIdentifier;
	}
	public void setStandardName(String standardName) {
		this.standardName = standardName;
	}
	public String getStandardName() {
		return standardName;
	}
	public void setTermId(int termId) {
		this.termId = termId;
	}
	public int getTermId() {
		return termId;
	}
	public void setTermName(String termName) {
		this.termName = termName;
	}
	public String getTermName() {
		return termName;
	}
	public void setTermDescription(String termDescription) {
		this.termDescription = termDescription;
	}
	public String getTermDescription() {
		return termDescription;
	}
	public void setLanguages(LanguageList languages) {
		this.languages = languages;
	}
	public LanguageList getLanguages() {
		return languages;
	}
	public TermNameList getTermNames() {
		return termNames;
	}
	public void setTermNames(TermNameList termNames) {
		this.termNames = termNames;
	}
	


}
