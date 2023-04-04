/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.CustomerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.Customer;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String CustomerName = request.getParameter("CustomerName");
        String Email = request.getParameter("Email");
        String Phone = request.getParameter("Phone");
        String Address = request.getParameter("Address");
        String Password = request.getParameter("Password");
        CustomerDAO cus = new CustomerDAO();
        CartDAO cartDAO = new CartDAO();
        Customer customer = new Customer(CustomerName, Email, Phone, Address, Password);
        if(cus.checkExist(Email, Phone)){
            request.setAttribute("errorMessageRegister", "Email or phone number existed");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            cus.register(new Customer(CustomerName, Email, Phone, Address, Password));
            Cart cart = new Cart();
            cart.setCustomerID(cus.getNewCustomer().getCustomerID());
            cartDAO.addCart(cart);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
