package model.bo;

import java.util.ArrayList;

import model.dao.PDFFileDAO;
import model.dao.UserDAO;
import model.bean.PDFFile;
import model.bean.User;

public class PDFFileBO {
	PDFFileDAO pdfFileDAO = new PDFFileDAO();
	public int insert(PDFFile pdfFile) {
		return pdfFileDAO.insert(pdfFile);
	}
	
	public ArrayList<PDFFile> getAllPDFFile(String username) {
		return pdfFileDAO.getAllPDFFile(username);
	}
}
