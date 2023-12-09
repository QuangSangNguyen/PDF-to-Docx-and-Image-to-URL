package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

import model.bean.ImageFile;

public class ImageFileDAO {
	String jdbcUrl = "jdbc:mysql://localhost:3306/ltm";
	String dbUser = "root";
	String dbPassword = "";

	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;

	public int insert(ImageFile imageFile) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
			String sql = "INSERT INTO image (id, username, url, date, filename) " + "VALUES (?, ?, ?, ?, ?)";
			// Sử dụng kết nối để thực hiện truy vấn SQL
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, imageFile.getId().toString());
			preparedStatement.setString(2, imageFile.getUsername());
			preparedStatement.setString(3, imageFile.getUrl());
			preparedStatement.setString(4, imageFile.getDate());
			preparedStatement.setString(5, imageFile.getFilename());
			int x = preparedStatement.executeUpdate();
			return x;
		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}
	}
	
	public ArrayList<ImageFile> getAllImageFile(String username) {
		ArrayList<ImageFile> imageFiles = new ArrayList<ImageFile>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
			String sql = "SELECT * FROM image WHERE username = '" + username + "'";
			Statement stm = connection.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()) {
				ImageFile imageFile = new ImageFile(UUID.fromString(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				
				imageFiles.add(imageFile);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		return imageFiles;
	}
}
