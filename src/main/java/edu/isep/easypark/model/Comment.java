package edu.isep.easypark.model;

import java.sql.Timestamp;



public class Comment {

	String content;
	int id_place;
	int id_user;
	int id_writter;
	int note;
	Timestamp date;
	
	


	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getNote() {
		return note;
	}

	public void setNote(int note) {
		this.note = note;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getId_place() {
		return id_place;
	}

	public void setId_place(int id_place) {
		this.id_place = id_place;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public int getId_writter() {
		return id_writter;
	}

	public void setId_writter(int id_writter) {
		this.id_writter = id_writter;
	}


	
	
	
	
}
