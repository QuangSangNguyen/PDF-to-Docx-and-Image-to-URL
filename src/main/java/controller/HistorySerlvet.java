package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ImageFile;
import model.bean.PDFFile;
import model.bo.ImageFileBO;
import model.bo.PDFFileBO;

/**
 * Servlet implementation class HistorySerlvet
 */
@WebServlet("/history")
public class HistorySerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ImageFileBO imageFileService = new ImageFileBO();
	PDFFileBO pdfFileService = new PDFFileBO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistorySerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getSession().getAttribute("username").toString();
		
		ArrayList<PDFFile> pdfFiles = pdfFileService.getAllPDFFile(username);
		ArrayList<ImageFile> imageFiles = imageFileService.getAllImageFile(username);
		
		
		request.setAttribute("pdfFiles", pdfFiles);
		request.setAttribute("imageFiles", imageFiles);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("/history.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
