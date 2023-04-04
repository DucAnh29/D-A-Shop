package model;

import java.util.List;

public class Customer {
    private int customerID;
    private String customerName, email,
            phone, address, password, role;
    private List<Order> order;
    private Cart cart;

    public Customer() {
    }

    public Customer(int customerID, String customerName, String email, String phone, String address, String password) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.password = password;
    }
    
    public Customer(String customerName, String email, String phone, String address, String password) {
        this.customerName = customerName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.password = password;
    }

    public Customer(int customerID, String customerName, String email, String phone, String address, String password, String role) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.password = password;
        this.role = role;
    }

    public Customer(int customerID, String customerName, String email, String phone, String address, String password, String role, List<Order> order, Cart cart) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.password = password;
        this.role = role;
        this.order = order;
        this.cart = cart;
    }
    
    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public String convertToDot() {
        int i = 0;
        String hiddenPassword = "";
        while (i <= this.password.length()) {
            hiddenPassword += "*";
            i++;
        }
        return hiddenPassword;
    }
}
