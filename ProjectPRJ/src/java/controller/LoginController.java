/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.CustomerDAO;
import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Customer;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("loginUsername");
        String password = request.getParameter("loginPassword");
        
        CustomerDAO cdao = new CustomerDAO();
        OrderDAO orderDao = new OrderDAO();
        CartDAO cartDao = new CartDAO();
        
        if (!username.isEmpty() && !password.isEmpty()) {
            Customer customer = cdao.checkLogin(username, password);
            if (customer != null) {
                HttpSession session = request.getSession();
                customer.setOrder(orderDao.getOrderByCustomerID(customer.getCustomerID()));
                customer.setCart(cartDao.getCartByCustomerID(customer.getCustomerID()));
                session.setAttribute("customer", customer);
                response.sendRedirect("home?page=1");
            } else {
                request.setAttribute("errorMessageLogin", "Your username or password is wrong");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
