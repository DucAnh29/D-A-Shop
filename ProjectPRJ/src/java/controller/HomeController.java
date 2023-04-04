/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pd = new ProductDAO();
        int listProductSize = pd.getAllProduct().size();
        
        int indexPage = Integer.parseInt(request.getParameter("page"));
        
        int totalPage = listProductSize / 8;
        if(listProductSize % 8 >0){
            totalPage += 1;
        }
        
        List<Product> list = pd.getAllProductPaging(indexPage);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listProduct", list);
        
        CategoryDAO cd = new CategoryDAO();
        List<Category> listCategory = cd.getAllCategory();

        List<Product> NewProduct = pd.NewProduct();
        request.setAttribute("newProductList", NewProduct);

        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
