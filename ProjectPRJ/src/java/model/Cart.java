/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {
    private int CartID;
    private int CustomerID;
    private List<CartDetail> CartDetail;

    public Cart() {
    }

    public Cart(int CartID, int CustomerID, List<CartDetail> CartDetail) {
        this.CartID = CartID;
        this.CustomerID = CustomerID;
        this.CartDetail = CartDetail;
    }

    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public List<CartDetail> getCartDetail() {
        return CartDetail;
    }

    public void setCartDetail(List<CartDetail> CartDetail) {
        this.CartDetail = CartDetail;
    }
}
