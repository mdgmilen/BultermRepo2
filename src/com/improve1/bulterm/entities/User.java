package com.improve1.bulterm.entities;

public class User {
	private String email;
	// private String password;
	private boolean isLogged;

	public User() {
		this.isLogged = false;
	}

	public void login(String email, String password) {
		this.setEmail(email);
		// TODO 1 this.password = encript(password);
		this.isLogged = true;
	}

	public boolean isLogged() {
		return isLogged;
	}

	public String getEmail() {
		return email;
	}

	private void setEmail(String email) {
		this.email = email;
	}

	public void setIsLogged(boolean isLogged) {
		this.isLogged = isLogged;
	}
}
