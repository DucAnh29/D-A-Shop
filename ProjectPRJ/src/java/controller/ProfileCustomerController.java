package controller;

import dao.CategoryDAO;
import dao.CustomerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Customer;

@WebServlet(name = "profileCustomer", urlPatterns = {"/profile"})
public class ProfileCustomerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cd = new CategoryDAO();
        List<Category> listCategory = cd.getAllCategory();
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("profileCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            CustomerDAO customerDAO = new CustomerDAO();
            String customerName = request.getParameter("CustomerName");
            String Phone = request.getParameter("Phone");
            String Address = request.getParameter("Address");
            String Password = request.getParameter("Password");
            
            customer.setCustomerName(customerName);
            customer.setPassword(Password);
            customer.setPhone(Phone);
            customer.setAddress(Address);
            
            session.removeAttribute("customer");
            customerDAO.updateCustomer(customer);
            session.setAttribute("customer", customer);
            response.sendRedirect("profile");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
