/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ResetPasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("sendResetCodePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btnSendCode") != null) {
            sendCode(request, response);
        } else if (request.getParameter("btnCheckCode") != null) {
            checkInputCode(request, response);
        } else {
            HttpSession session = request.getSession();
            CustomerDAO customerDAO = new CustomerDAO();
            String password = request.getParameter("password");
            String email = (String) session.getAttribute("email");
            customerDAO.updatePassword(password, email);
            session.invalidate();
            response.sendRedirect("login");
        }
    }

    private void checkInputCode(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String inputCode = request.getParameter("inputCode");
        if (session.getAttribute("randomResetPasswordCode").equals(inputCode)) {
            request.getRequestDispatcher("setNewPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Your code is not incorrect, please try again");
            request.getRequestDispatcher("inputEmailCode.jsp").forward(request, response);
        }
    }
    
    public void sendCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerDAO cdao = new CustomerDAO();
        String toEmail = request.getParameter("email");
        if (cdao.checkIsEmailExisted(toEmail)) {
            HttpSession session = request.getSession(true);
            String randomCode = randomString();
            session.setAttribute("randomResetPasswordCode", randomCode);
            session.setAttribute("email", toEmail);
            sendEmail(toEmail, randomCode);
            request.getRequestDispatcher("inputEmailCode.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Your email is not existed, please try again");
            request.getRequestDispatcher("sendResetCodePassword.jsp").forward(request, response);
        }
    }

    private void sendEmail(String toEmail, String code) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.debug", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.password", "wvkeirkwbpxdfumf");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.trust", "*");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("hongthang394@gmail.com", "wvkeirkwbpxdfumf");
                }
            });
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("hongthang394@gmail.com"));
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(toEmail));
            message.setSubject("This is reset code for your account");
            message.setText("This is a message from Shoe09's system.\n Your verification code is: " + code +"\nThank you for trusting our store");
            Transport.send(message);
        } catch (MessagingException ex) {
            Logger.getLogger(ResetPasswordController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String randomString() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
