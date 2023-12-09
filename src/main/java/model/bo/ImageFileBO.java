package model.bo;

import java.util.ArrayList;

import model.dao.ImageFileDAO;
import model.bean.ImageFile;

public class ImageFileBO {
	ImageFileDAO imageFileDAO = new ImageFileDAO();
	public int insert(ImageFile imageFile) {
		return imageFileDAO.insert(imageFile);
	}
	
	public ArrayList<ImageFile> getAllImageFile(String username) {
		return imageFileDAO.getAllImageFile(username);
	}
}
