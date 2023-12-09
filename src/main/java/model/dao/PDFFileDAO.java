package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

import model.bean.PDFFile;

public class PDFFileDAO {
	String jdbcUrl = "jdbc:mysql://localhost:3306/ltm";
	String dbUser = "root";
	String dbPassword = "";

	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;

	public int insert(PDFFile pdfFile) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
			String sql = "INSERT INTO pdf (id, username, path, date) " + "VALUES (?, ?, ?, ?)";
			// Sử dụng kết nối để thực hiện truy vấn SQL
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, pdfFile.getId().toString());
			preparedStatement.setString(2, pdfFile.getUsername());
			preparedStatement.setString(3, pdfFile.getPath());
			preparedStatement.setString(4, pdfFile.getDate());
			int x = preparedStatement.executeUpdate();
			return x;
		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}
	}
	
	public ArrayList<PDFFile> getAllPDFFile(String username) {
		ArrayList<PDFFile> pdfFiles = new ArrayList<PDFFile>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
			String sql = "SELECT * FROM pdf WHERE username = '" + username + "'";
			Statement stm = connection.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()) {
				PDFFile pdfFile = new PDFFile(UUID.fromString(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4));
				
				pdfFiles.add(pdfFile);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		return pdfFiles;
	}
}
