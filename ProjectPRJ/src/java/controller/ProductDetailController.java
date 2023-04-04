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
@WebServlet(name = "DetailController", urlPatterns = {"/detail"})
public class ProductDetailController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ProductID = request.getParameter("ProductID");
        ProductDAO dt = new ProductDAO();
        Product p = dt.getProductsByProductID(Integer.parseInt(ProductID));
        request.setAttribute("detail", p);
        
        CategoryDAO cd = new CategoryDAO();
        List<Category> listCategory = cd.getAllCategory();  
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listProductAlike", dt.getTop4ProductByCategoryID(p.getCategoryID(), p.getProductID()));
        
        request.getRequestDispatcher("productDetail.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
