package model.bean;

import java.util.UUID;

public class ImageFile {
	private UUID id;
	private String username;
	private String url;
	private String date;
	private String filename;
	
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public ImageFile(UUID id, String username, String url, String date, String filename) {
		super();
		this.id = id;
		this.username = username;
		this.url = url;
		this.date = date;
		this.filename = filename;
	}
	
}
