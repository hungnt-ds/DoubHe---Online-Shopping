/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;

/**
 *
 * @author TANHUNG
 */
@WebServlet(name = "SendEmailController", urlPatterns = {"/SendEmailController"})
public class SendEmailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static final String FROM = "hungntqe170205@fpt.edu.vn";
    static final String PASSWORD = "fkmy imcv blnu ehmw";
    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "email-form.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
            props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            // create Authenticator
            Authenticator auth = new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    // TODO Auto-generated method stub
                    return new PasswordAuthentication(FROM, PASSWORD);
                }
            };
            String emailTo = request.getParameter("to");
            String emailSubject = request.getParameter("subject");
            String emailContent = request.getParameter("content");
            // Phiên làm việc
            Session session = Session.getInstance(props, auth);
            // Tạo một tin nhắn
            MimeMessage msg = new MimeMessage(session);
            try {
                // Kiểu nội dung
                msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
                // Người gửi
                msg.setFrom(FROM);
                // Người nhận
                msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo, false));
                // Tiêu đề email
                msg.setSubject(emailSubject);
                // Quy đinh ngày gửi
                msg.setSentDate(new Date());
                // Quy định email nhận phản hồi
                // msg.setReplyTo(InternetAddress.parse(FROM, false))
                // Nội dung
                msg.setContent(emailContent, "text/HTML; charset=UTF-8");
                // Gửi email
                Transport.send(msg);
                System.out.println("SUCCESS");
                url = SUCCESS;
            } catch (Exception e) {
                System.out.println("ERROR");
                e.printStackTrace();
                url = ERROR;
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
