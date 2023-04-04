
package controller;

import dao.CategoryDAO;
import dao.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.OrderDetail;


@WebServlet(name = "OrderDetailController", urlPatterns = {"/orderDetail"})
public class OrderDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cd = new CategoryDAO();
        int orderID = Integer.parseInt(request.getParameter("OrderID"));
        List<Category> listCategory = cd.getAllCategory();
        OrderDAO orderDao = new OrderDAO();
        
        List<OrderDetail> orderDetailList = orderDao.getOrderDetailByOrderID(orderID);
        
        request.setAttribute("orderDetailList", orderDetailList);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("orderDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
