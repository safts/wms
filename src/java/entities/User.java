package entities;

import java.util.Date;

public class User {

	
//	static int nextID = 17;
//	private int id;
	private String name;
	private String surname;
	private String username;
	private String password;
	private String email;
	private String signup_date;
	private String last_logged_in;

	
	private String user_role;

	public User(String name, String surname, String username, String password, String email, String signup_date, String last_logged_in, String user_role) {
		// (name, surname, username, password, email, signup_date, last_logged_in, user_role)
//		id = nextID++;
		this.name = name;
		this.surname = surname;
		this.username = username;
		this.password = password;
		this.email = email;
		this.signup_date = signup_date;
		this.last_logged_in=last_logged_in;
		this.user_role = user_role;
	}

	public User(String name, String surname, String username, String password, String email, String signup_date, String last_logged_in) {
	//			id = nextID++;

		this.name = name;
		this.surname = surname;
		this.username = username;
		this.password = password;
		this.email = email;
		this.signup_date = signup_date;
		this.last_logged_in=last_logged_in;
		this.user_role=null;

		
	}
	
	public User() {
	//			id = nextID++;

		this.name = "";
		this.surname = "";
		this.username = "";
		this.password = "";
		this.email = "";
		this.signup_date = null;
		this.last_logged_in=null;
		this.user_role=null;
	}
	
	public User(String username, String password) {
	//			id = nextID++;

		this.name = "";
		this.surname = "";
		this.username = username;
		this.password = password;
		this.email = "";
		this.signup_date = null;
		this.last_logged_in=null;
		this.user_role=null;
	}
	
	public User(String username, String password, String email) {
	//			id = nextID++;

		this.name = "";
		this.surname = "";
		this.username = username;
		this.password = password;
		this.email = email;
		this.signup_date = null;
		this.last_logged_in=null;
		this.user_role=null;
	}
	

	public void setName(String f) {
		name = f;
	}

	public String getName() {
		return name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String l) {
		password = l;
	}

	public String getPassword() {
		return password;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSignupDate() {
		return signup_date;
	}

	public void setSignupDate(String signup_date) {
		this.signup_date = signup_date;
	}

	public String getUserRole() {
		return user_role;
	}

	public void setUserRole(String user_role) {
		this.user_role = user_role;
	}
	
	public String getLastloggedin() {
		return last_logged_in;
	}

	public void setLastloggedin(String last_logged_in) {
		this.last_logged_in = last_logged_in;
	}
}
