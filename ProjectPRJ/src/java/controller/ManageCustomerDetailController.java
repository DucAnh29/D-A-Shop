package controller;

import dao.CustomerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;


@WebServlet(name = "ManageCustomerDetailController", urlPatterns = {"/manageCustomerDetail"})
public class ManageCustomerDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        int CustomerID = Integer.parseInt(request.getParameter("CustomerID"));
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerByCustomerID(CustomerID);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("editRoleCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        CustomerDAO customerDAO = new CustomerDAO();
        int CustomerID = Integer.parseInt(request.getParameter("CustomerID"));
        Customer customer = customerDAO.getCustomerByCustomerID(CustomerID);
        String Role = request.getParameter("Role");
        
        customer.setRole(Role);
        customerDAO.updateRoleCustomer(customer);
        response.sendRedirect("manageListCustomer");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
