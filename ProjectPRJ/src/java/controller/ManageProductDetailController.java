package controller;

import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ManageProductDetailController", urlPatterns = {"/manageProductDetail"})
public class ManageProductDetailController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int productID = Integer.parseInt(request.getParameter("productID"));
            ProductDAO productDao = new ProductDAO();
            Product product = productDao.getProductsByProductID(productID);
            request.setAttribute("product", product);
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            ProductDAO productDao = new ProductDAO();
            int productID = Integer.parseInt(request.getParameter("productID"));
            Product product = productDao.getProductsByProductID(productID);
            String Name = request.getParameter("Name");
            double Price = Double.parseDouble(request.getParameter("Price"));
            String Image = request.getParameter("Image");
            String Description = request.getParameter("Description");
            int Quantity = Integer.parseInt(request.getParameter("Quantity"));
            int CategoryID = Integer.parseInt(request.getParameter("CategoryID"));
            
            product.setName(Name);
            product.setPrice(Price);
            product.setImage(Image);
            product.setDescription(Description);
            product.setQuantity(Quantity);
            product.setCategoryID(CategoryID);
            
            productDao.updateProduct(product);
            response.sendRedirect("manageListProduct");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
