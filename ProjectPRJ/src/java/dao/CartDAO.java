package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartDetail;

public class CartDAO {
    Connection cnn; 
    Statement stm; 
    ResultSet rs; 
    
    private void connectDB() {
        try {
            cnn = (new DBContext()).connection;
            System.out.println("Connect successful");
        } catch (SQLException e) {
            System.err.println("Connect error " + e.getMessage());
        }
    }

    public CartDetail checkIsCartDetailExisted(int CartID, int productID, int size) {
        String sql = "select * from [CartDetail] where CartID = ? and ProductID = ? and Size = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, CartID);
            ps.setInt(2, productID);
            ps.setInt(3, size);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new CartDetail(rs.getInt("CartID"), rs.getInt("Size"), rs.getInt("Quantity"), rs.getInt("ProductID"));
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return null;
    }

    public List<CartDetail> getCartDetailByCartID(int CartID) {
        ProductDAO pdao = new ProductDAO();
        List<CartDetail> list = new ArrayList<>();
        String sql = "select * from [CartDetail] where CartID = ? ";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, CartID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CartDetail(rs.getInt("CartID"),
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

    public Cart getCartByCustomerID(int customerID) {
        Cart cart = null;
        String sql = "select * from [Cart] where CustomerID = ? ";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cart = new Cart(
                        rs.getInt("CartID"),
                        rs.getInt("CustomerID"),
                        getCartDetailByCartID(rs.getInt("CartID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cart;
    }

    public void addCartDetailToCart(CartDetail cartDetail) {
        CartDetail currentCartDetail = checkIsCartDetailExisted(cartDetail.getCartID(), cartDetail.getProductID(), cartDetail.getSize());
        if (currentCartDetail != null) {
            currentCartDetail.setQuantity(currentCartDetail.getQuantity() + cartDetail.getQuantity());
            updateCartDetailFromCart(currentCartDetail);
        } else {
            String insert = "insert into CartDetail ([CartID],[Size],[Quantity],[ProductID]) values (?,?,?,?)";
            try {
                Connection cnn = new DBContext().connection;
                PreparedStatement ps = cnn.prepareStatement(insert);
                ps.setInt(1, cartDetail.getCartID());
                ps.setInt(2, cartDetail.getSize());
                ps.setInt(3, cartDetail.getQuantity());
                ps.setInt(4, cartDetail.getProductID());
                ps.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error!!");
            }
        }
    }

    public void updateCartDetailFromCart(CartDetail cartDetail) {
        String update = "UPDATE CartDetail SET Quantity = ? WHERE ProductID = ? and CartID = ? and Size = ? ;";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(update);
            ps.setInt(1, cartDetail.getQuantity());
            ps.setInt(2, cartDetail.getProductID());
            ps.setInt(3, cartDetail.getCartID());
            ps.setInt(4, cartDetail.getSize());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error");
        }
    }

    public void deleteCartDetailFromCart(int CartID, int productID, int size) {
        String delete = "Delete from CartDetail where CartID = ? and ProductID = ? and Size = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(delete);
            ps.setInt(1, CartID);
            ps.setInt(2, productID);
            ps.setInt(3, size);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!!");
        }
    }
    
    public void addCart(Cart cart) {
        String add = "insert into Cart ([CustomerID]) values (?)";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(add);
            ps.setInt(1, cart.getCustomerID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!!");
        }
    }
    
    public void clearCart(Cart cart) {
        String sql = "delete from CartDetail where CartID = ?";
        try {
            Connection cnn = new DBContext().connection;
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setInt(1, cart.getCartID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error!");
        }
    } 
}
