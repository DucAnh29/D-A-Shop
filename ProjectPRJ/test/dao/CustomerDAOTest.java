/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dao;

import dao.CustomerDAO;
import model.Customer;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Duc Anh
 */
public class CustomerDAOTest {

    public CustomerDAOTest() {
    }

    
    @Test
    public void testCheckLogin() {
        CustomerDAO dao = new CustomerDAO();
        String emailCheck = "nguyenhuuducanh02@gmail.com";
        String passwordCheck = "1234";
        Customer c = dao.checkLogin(emailCheck, passwordCheck);

        assertNull(c);

    }

    
    @Test
    public void testCheckLogin3() {
        CustomerDAO dao = new CustomerDAO();
        String emailCheck = "sonhai1411@gmail.com";
        String passwordCheck = "14112000";
        Customer c = dao.checkLogin(emailCheck, passwordCheck);

        assertNotNull(c);

    }

    
    @Test
    public void testCheckIsEmailExisted() {
        CustomerDAO dao = new CustomerDAO();
        String email = "nguyenhuuducanh02@gmail.com";
        Boolean result = dao.checkIsEmailExisted(email);
        System.out.println(result);
        assertTrue(result);

    }

    
    @Test
    public void testCheckIsEmailExisted1() {
        CustomerDAO dao = new CustomerDAO();
        String email = "131234646";
        Boolean result = dao.checkIsEmailExisted(email);
        assertFalse(result);
    }

    
    @Test
    public void testCheckIsEmailExisted2() {
        CustomerDAO dao = new CustomerDAO();
        String email = "nguyenhuuducanh02";
        Boolean result = dao.checkIsEmailExisted(email);
        System.out.println(result);
        assertFalse(result);

    }

    
    @Test
    public void testUpdatePassword() {
        CustomerDAO dao = new CustomerDAO();
        String password = "danhhh";
        String email = "nguyenhuuducanh02@gmail.com";
        Customer customer = dao.getCustomerByCustomerID(17);
        dao.updatePassword(password, email);
        assertEquals(password, customer.getPassword());

    }

    
    @Test
    public void testCheckLogin2() {
        CustomerDAO dao = new CustomerDAO();
        String emailCheck = "nguyenhuuducanh02@gmail.com";
        String passwordCheck = "danhhh";
        Customer c = dao.checkLogin(emailCheck, passwordCheck);

        assertNotNull(c);

    }

    
    @Test
    public void testUpdatePassword1() {
        CustomerDAO dao = new CustomerDAO();
        String password = "12345";
        String email = "nguyenhuuducanh02";
        Customer customer = dao.getCustomerByCustomerID(17);
        dao.updatePassword(password, email);
        assertNotEquals(password, customer.getPassword());
    }

    
    @Test
    public void testUpdatePassword2() {
        CustomerDAO dao = new CustomerDAO();
        String password = "danhh";
        String email = "nguyenhuuducanh02@gmail";
        Customer customer = dao.getCustomerByCustomerID(17);
        dao.updatePassword(password, email);
        assertNotEquals(password, customer.getPassword());
    }

    
    @Test
    public void testUpdatePassword3() {
        CustomerDAO dao = new CustomerDAO();
        String password = "@#$%";
        String email = "nguyenhuuducanh022002@gmail.com";
        Customer customer = dao.getCustomerByCustomerID(17);
        dao.updatePassword(password, email);
        assertNotEquals(password, customer.getPassword());
    } 

    
      @Test
    public void testUpdatePassword4() {
        CustomerDAO dao = new CustomerDAO();
        String password = "12345";
        String email = "131234646";
        Customer customer = dao.getCustomerByCustomerID(17);
        dao.updatePassword(password, email);
        assertNotEquals(password, customer.getPassword());
    } 

    
    @Test
    public void getCustomerByCustomerID() {
        CustomerDAO dao = new CustomerDAO();
        Customer customer = dao.getCustomerByCustomerID(6);
        
        assertEquals("Nguyen Van B", customer.getCustomerName());
        assertEquals("0972078962", customer.getPhone());
        assertEquals("Quang Ninh", customer.getAddress());
    }

    @Test
    public void testResigter() {
    }

    @Test
    public void testRegister() {
    }

    @Test
    public void testCheckExist() {
    }

    @Test
    public void testGetCustomerByCustomerID() {
    }

    @Test
    public void testUpdateCustomer() {
    }

    @Test
    public void testUpdateRoleCustomer() {
    }

    @Test
    public void testGetNewCustomer() {
    }

    @Test
    public void testGetAllCustomer() {
    }
    
}

   

  

 
