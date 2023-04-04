/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package controller;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import dao.CustomerDAO;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Duc Anh
 */
public class ResetPasswordControllerTest {
    
    public ResetPasswordControllerTest() {
    }
private String randomString() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    @Test
    public void testSendCode() throws Exception {
        CustomerDAO cdao = new CustomerDAO();
        ResetPasswordController rs = new ResetPasswordController();
        String email = "nguyenhuuducanh02@gmail.com";
        
        
    }

    
    
}
