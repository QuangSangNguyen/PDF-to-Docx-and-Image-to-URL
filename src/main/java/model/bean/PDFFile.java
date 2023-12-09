package model.bean;

import java.util.UUID;

public class PDFFile {
	private UUID id;
	private String username;
	private String path;
	private String date;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}


	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public PDFFile(UUID id, String username, String path, String date) {
		super();
		this.id = id;
		this.username = username;
		this.path = path;
		this.date = date;
	}

}

