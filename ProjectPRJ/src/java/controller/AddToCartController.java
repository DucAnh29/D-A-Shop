package controller;

import dao.CartDAO;
import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.CartDetail;
import model.Category;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;

public class AddToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");

        request.setAttribute("isCartEmpty", customer.getCart().getCartDetail().isEmpty());

        ProductDAO pd = new ProductDAO();
        List<Product> list = pd.getAllProduct();
        request.setAttribute("listProduct", list);

        CategoryDAO cd = new CategoryDAO();

        List<Category> listCategory = cd.getAllCategory();
        List<Product> NewProduct = pd.NewProduct();
        request.setAttribute("newProductList", NewProduct);

        DecimalFormat format = new DecimalFormat("0.#");
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("totalMoney", format.format(totalMoney(request)));
        request.getRequestDispatcher("cartDetail.jsp").forward(request, response);
    }

    private double totalMoney(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int total = 0;
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            List<CartDetail> list = customer.getCart().getCartDetail();
            for (int i = 0; i < list.size(); i++) {
                total += (list.get(i).getProduct().getPrice() * list.get(i).getQuantity());
            }
        }
        return total;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btnRemove") != null) {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            int productID = Integer.parseInt(request.getParameter("removeID"));
            int cartID = customer.getCart().getCartID();
            int size = Integer.parseInt(request.getParameter("size"));
            CartDAO cartDao = new CartDAO();
            cartDao.deleteCartDetailFromCart(cartID, productID, size);
            session.removeAttribute("customer");
            customer.setCart(cartDao.getCartByCustomerID(customer.getCustomerID()));
            session.setAttribute("customer", customer);
            response.sendRedirect("cart");
        } else if (request.getParameter("btnConfirmCart") != null) {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            OrderDAO orderDao = new OrderDAO();
            
            Order order = new Order();
            order.setOrderDate(getCurrentDate());
            //order.setCustomerID();
         
            orderDao.addOrderToOrder(order);
            order = orderDao.getTheLastOfOrder();
            order.setCustomerID(customer.getCustomerID());
    
            orderDao.addOrderToCustomer(order, customer.getCustomerID());
            
            List<CartDetail> cartCurrent = customer.getCart().getCartDetail();
            for (int i = 0; i < cartCurrent.size(); i++) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderID(order.getOrderID());
                orderDetail.setSize(cartCurrent.get(i).getSize());
                orderDetail.setQuantity(cartCurrent.get(i).getQuantity());
                orderDetail.setProduct(cartCurrent.get(i).getProduct());
                orderDao.addOrderToOrderDetail(orderDetail);
            }
            
            CartDAO cartDao = new CartDAO();
            cartDao.clearCart(customer.getCart());

            session.removeAttribute("customer");
            customer.setCart(cartDao.getCartByCustomerID(customer.getCustomerID()));
            customer.setOrder(orderDao.getOrderByCustomerID(customer.getCustomerID()));
            
            session.setAttribute("customer", customer);
            response.sendRedirect("cart");
        } else {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            CartDAO cartDao = new CartDAO();

            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int shoeSize = Integer.parseInt(request.getParameter("shoeSize"));
            int productID = Integer.parseInt(request.getParameter("productID"));
            int cartID = customer.getCart().getCartID();

            session.removeAttribute("customer");
            cartDao.addCartDetailToCart(new CartDetail(cartID, shoeSize, quantity, productID));
            customer.setCart(cartDao.getCartByCustomerID(customer.getCustomerID()));
            session.setAttribute("customer", customer);

            response.sendRedirect("detail?ProductID=" + productID);
        }
    }

    private String getCurrentDate() {
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
        String strDate = dateFormat.format(date);
        return strDate;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
