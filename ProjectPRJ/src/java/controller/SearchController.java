/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String txtSearch = request.getParameter("txt");
        int lowestPrice = Integer.parseInt("lowestPrice");
        int highestPrice = Integer.parseInt("highestPrice");
        ProductDAO sd = new ProductDAO();
        List<Product> list = sd.SearchProduct(txtSearch, lowestPrice, highestPrice);
        CategoryDAO cd = new CategoryDAO();
        List<Category> listCategory = cd.getAllCategory();
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listProduct", list);
        request.getRequestDispatcher("searchhome.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        int lowestPrice = 0;
        int highestPrice = 0;
        String txtSearch = request.getParameter("txt");
        if (request.getParameter("lowestPrice") != null && !request.getParameter("lowestPrice").isEmpty()) {
            lowestPrice = Integer.parseInt(request.getParameter("lowestPrice"));
        }
        
        if (request.getParameter("highestPrice") != null && !request.getParameter("highestPrice").isEmpty()) {
            highestPrice = Integer.parseInt(request.getParameter("highestPrice"));
        } else {
            highestPrice = Integer.MAX_VALUE;
        }
        ProductDAO sd = new ProductDAO();
        List<Product> list = sd.SearchProduct(txtSearch, lowestPrice, highestPrice);
        CategoryDAO cd = new CategoryDAO();
        List<Category> listCategory = cd.getAllCategory();
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listProduct", list);
        request.getRequestDispatcher("searchhome.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
