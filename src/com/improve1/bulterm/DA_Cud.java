package com.improve1.bulterm;

//package com.improve1.bulterm;
/**
 * creation date: 29 May 2010, Milen Georgiev
 * last modified: 29 May 2010, Milen Georgiev
 * Copyright - Improve1 Group
 */
//package com.improve1.bulterm;

//import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import java.util.ArrayList;
import java.util.Properties;

import com.mysql.jdbc.CallableStatement;

//import java.math.*;

/**
 * @author Milen Georgiev
 * 
 */
public class DA_Cud {
	private Connection conn;
	private PreparedStatement prepStmt;
	private Statement stmt;
	private ResultSet rset;
	private PreparedStatement prepStmt2;
	private ResultSet rset2;

	/**
	 * Default constructor
	 */
	/*public DbProvider() {
		this.conn = null;
		this.prepStmt = null;
		this.stmt = null;
		//this.rset = null;
		this.prepStmt2 = null;
		//this.rset2 = null;
	}*/ 

	public void connect() {
		// settings, db user pass
		// hosting: improve1_bulterm improve1_bulterm milen
		// localold: improve1_bulterm_2/3 root milen
		// localold: bultermdb1 _1 improve1_bulterm
		// local: improve1_bultermL bultermuser milen
		String url = "jdbc:mysql://localhost:3306/improve1_bultermL";
		try {
			if (this.getConn() == null) {
				Class.forName("com.mysql.jdbc.Driver");
				java.util.Properties prop = new Properties();
				prop.setProperty("user", "bultermuser");
				prop.setProperty("password", "xxx"); //ivannmmilennddimitar
				// prop.setProperty("useUnicode","true");
				prop.setProperty("characterEncoding", "utf-8"); // Cp1251
				// prop.setProperty("DB2e_ENCODING", "Cp102"); // "Cp102" UTF-8
				this.setConn(DriverManager.getConnection(url, prop));
			}
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.toString());
			System.exit(-1);
		} catch (SQLException ex) {
			// toDo specify if the connection to server failed
			// or invalid username or password
			// this.username = "";
			// this.password = "";
			System.out.println(ex.toString());
		} catch (java.lang.NullPointerException ex) {
			System.out.println(ex.toString());
			System.out.println("Connection failed");
		}
	}


	public int newTerm(String bulgarian) {
		connect();
		int newTermId = 0;
		String sql = "{ call sp_insert_term(?, ?) }";
		CallableStatement l_stmt=null;
		try {
			l_stmt = (CallableStatement) this.getConn().prepareCall(sql);
			
			l_stmt.setString(1, bulgarian);
			l_stmt.registerOutParameter(2, java.sql.Types.INTEGER);
			l_stmt.executeUpdate();
            newTermId = l_stmt.getInt(2);            
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newTermId;
	}// newTerm()
	
	public void editTerm(String action, int termId, String itemValue) {
		connect();
		String sql = "";
		switch (action) {
		case "edit_tstandard":    sql = "{ call sp_update_termStandard   ("+termId+", "    +itemValue+" )              }";      break;
        case "edit_tdescription": sql = "{ call sp_update_termDescription("+termId+",    '"+itemValue+"')              }";      break;
        case "edit_tenglish":     sql = "{ call sp_update_termTranslation("+termId+", 1, '"+itemValue+"')              }";      break;
        case "edit_tbulgarian":   sql = "{ call sp_update_termTranslation("+termId+", 2, '"+itemValue+"')              }";      break;
        case "edit_trussian":     sql = "{ call sp_update_termTranslation("+termId+", 3, '"+itemValue+"')              }";      break;
        case "edit_tgerman":      sql = "{ call sp_update_termTranslation("+termId+", 4, '"+itemValue+"')              }";      break;
        case "edit_tfrench":      sql = "{ call sp_update_termTranslation("+termId+", 5, '"+itemValue+"')              }";      break;

		case "new_tstandard":    sql = "{ call sp_update_termStandard   ("+termId+", "    +itemValue+" )               }";      break;
        case "new_tdescription": sql = "{ call sp_insert_termDescription("+termId+",    '"+itemValue+"')               }";      break;
        case "new_tenglish":     sql = "{ call sp_insert_termTranslation("+termId+", 1, '"+itemValue+"')               }";      break;
        case "new_tbulgarian":   sql = "{ call sp_insert_termTranslation("+termId+", 2, '"+itemValue+"')               }";      break;
        case "new_trussian":     sql = "{ call sp_insert_termTranslation("+termId+", 3, '"+itemValue+"')               }";      break;
        case "new_tgerman":      sql = "{ call sp_insert_termTranslation("+termId+", 4, '"+itemValue+"')               }";      break;
        case "new_tfrench":      sql = "{ call sp_insert_termTranslation("+termId+", 5, '"+itemValue+"')               }";      break;
        //default: xxx;     	break;
		}//switch
		try {
			this.stmt = this.getConn().createStatement();
			this.stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// editTerm()
	
	public void deleteTerm(int termId) {
		connect();
		//int result = 0;
		String sql = "{ call sp_delete_term("+termId+") }";
		try {
			this.stmt = this.getConn().createStatement(); 
			this.stmt.executeUpdate(sql);  //result = 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return result;
	}// deleteTerm()

	public int newStandard(String identifier, String name) {
		connect();
		int newStandardId = 0;
		String sql = "{ call sp_insert_standard(?, ?, ?) }";
		CallableStatement l_stmt=null;
		try {
			l_stmt = (CallableStatement) this.getConn().prepareCall(sql); // createStatement(); // prepareStatement(sql);
			// (sql, ResultSet.TYPE_SCROLL_SENSITIVE);
			//this.prepStmt.setString(1, identifier);
			//result = this.stmt.executeUpdate(sql);
			// this.conn.commit();
			
			l_stmt.setString(1, identifier);
			l_stmt.setString(2, name);
			l_stmt.registerOutParameter(3, java.sql.Types.INTEGER);
            //ResultSet rs = l_stmt.executeQuery(); 
			l_stmt.executeUpdate();
            newStandardId = l_stmt.getInt(3);            
		} catch (SQLException e) {
			e.printStackTrace();
			// this.conn.rollback();
		}
		return newStandardId;
	}// newStandard()
	
	public void editStandard(int standardId, String identifier, String name) {
		connect();
		//int result = 0;
		String sql = "{ call sp_update_standard("+standardId+", '"+identifier+"', '"+name+"') }";
		try {
			this.stmt = this.getConn().createStatement(); // prepareStatement(sql);
			// (sql, ResultSet.TYPE_SCROLL_SENSITIVE);
			this.stmt.executeUpdate(sql);   //result = 
			// this.conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			// this.conn.rollback();
		}
		//return result;
	}// editStandard()
	
	public void deleteStandard(int standardId) {
		connect();
		//int result = 0;
		String sql = "{ call sp_delete_standard("+standardId+") }";
		try {
			this.stmt = this.getConn().createStatement(); // prepareStatement(sql);
			// (sql, ResultSet.TYPE_SCROLL_SENSITIVE);
			this.stmt.executeUpdate(sql);  //result = 
			// this.conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			// this.conn.rollback();
		}
		//return result;
	}// deleteStandard()
	
	
	
	
	


	
	public int logWebuserAction(String action, String name, String ip,
			String location, String symbolsToSearch, String language,
			String resultsCntStr, String info3, String info4, Date dateTime,
			BigInteger dateTimeInt, String dateTimeStr) {
		connect();
		if (name == null) {
			name = "";
		}
		if (ip.equals(null)) {
			ip = "";
		}
		if (location.equals(null)) {
			location = "";
		}
		if (symbolsToSearch.equals(null)) {
			symbolsToSearch = "";
		}
		if (language.equals(null)) {
			language = "";
		}
		if (resultsCntStr.equals(null)) {
			resultsCntStr = "";
		}
		if (info3.equals(null)) {
			info3 = "";
		}
		// if (presentDateTime.equals(null)) { presentDateTime = ; }

		int result = 0;
		String sql = "INSERT INTO webuser_info"
				+ " ( name_a, ip, location, search_symbols, info1, info2, info3, info4, date_time, "
				+ " date_time_int, date_time_str ) " + " VALUES " + " ( '"
				+ name
				+ "', '"
				+ ip
				+ "', '"
				+ location
				+ "', '"
				+ symbolsToSearch
				+ "', '"
				+ language
				+ "', '"
				+ resultsCntStr
				+ "', '"
				+ info3
				+ "', '"
				+ info4
				+ "', '"
				+ dateTime
				+ "', "
				+ dateTimeInt + ", '" + dateTimeStr + "' ) ";
		try {
			this.stmt = this.getConn().createStatement(); // prepareStatement(sql);
			// (sql, ResultSet.TYPE_SCROLL_SENSITIVE);
			result = this.stmt.executeUpdate(sql);
			// this.conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			// this.conn.rollback();
		}

		return result;
	}//logWebuserAction()


	public PreparedStatement getPrepStmt() {
		return prepStmt;
	}


	public void setPrepStmt(PreparedStatement prepStmt) {
		this.prepStmt = prepStmt;
	}


	public Connection getConn() {
		return conn;
	}


	public void setConn(Connection conn) {
		this.conn = conn;
	}


	public ResultSet getRset() {
		return rset;
	}


	public void setRset(ResultSet rset) {
		this.rset = rset;
	}


	public PreparedStatement getPrepStmt2() {
		return prepStmt2;
	}


	public void setPrepStmt2(PreparedStatement prepStmt2) {
		this.prepStmt2 = prepStmt2;
	}


	public ResultSet getRset2() {
		return rset2;
	}


	public void setRset2(ResultSet rset2) {
		this.rset2 = rset2;
	}
}// class
