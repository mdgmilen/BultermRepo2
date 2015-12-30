package com.improve1.bulterm.entities;

import java.io.Serializable;
//import java.util.ArrayList;

//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;

public class Standard implements Serializable {
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
}//class
