package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    Connection cnn; //ket noi csdl
    Statement stm; //thuc thi cau lenh sql
    ResultSet rs; // luu tru va u ly du lieu

    private void connectDB() {
        try {
            cnn = (new DBContext()).connection;
            System.out.println("Connect successful");
        } catch (SQLException e) {
            System.err.println("Connect error " + e.getMessage());
        }
    }

    public List<OrderDetail> getOrderDetailByOrderID(int OrderID) {
        ProductDAO pdao = new ProductDAO();
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from [OrderDetail] where OrderID = ? ";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, OrderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt("OrderID"),
                        rs.getInt("Size"),
                        rs.getInt("Quantity"),
                        rs.getInt("ProductID"),
                        pdao.getProductsByProductID(rs.getInt("ProductID"))
                ));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrderByCustomerID(int customerID) {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "select * from OrderCustomer join [Order] on OrderCustomer.OrderID = [Order].OrderID where [OrderCustomer].CustomerID = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("CustomerID"),
                        rs.getString("OrderDate"),
                        getOrderDetailByOrderID(rs.getInt("OrderID")));
                orderList.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderList;
    }
    
    public void addOrderToOrder(Order order) {
        String insert = "insert into [Order] ([OrderDate]) values (?)";
           try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(insert);
            ps.setString(1, order.getOrderDate());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!!");
        }
    }
    
    public void addOrderToOrderDetail(OrderDetail orderDetail) {
        String insert = "insert into [OrderDetail] ([OrderID], [Size],[Quantity], [ProductID]) values (?,?,?,?)";
           try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(insert);
            ps.setInt(1, orderDetail.getOrderID());
            ps.setInt(2, orderDetail.getSize());
            ps.setInt(3, orderDetail.getQuantity());
            ps.setInt(4, orderDetail.getProductID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!!");
        }
    }
    
    public void addOrderToCustomer(Order order, int c) {
        String insert = "insert into [OrderCustomer] ([OrderID],[CustomerID]) values (?,?)";
           try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(insert);
            ps.setInt(1, order.getOrderID());
            ps.setInt(2, c);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!!");
        }
    }
    
    public Order getTheLastOfOrder() {
        Order order = null;
        String sql = "select top 1 * from [Order] order by [OrderID] desc";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               order = new Order(
                    rs.getInt("OrderID"),
                    rs.getString("OrderDate"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return order;
    }
    
    public void addOrderDetailToOrder(OrderDetail orderDetail) {
        String insert = "insert into OrderDetail ([OrderID],[Size],[Quantity],[ProductID]) values (?,?,?,?)";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(insert);
            ps.setInt(1, orderDetail.getOrderID());
            ps.setInt(2, orderDetail.getSize());
            ps.setInt(3, orderDetail.getQuantity());
            ps.setInt(4, orderDetail.getProductID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!!");
        }
    }
}
