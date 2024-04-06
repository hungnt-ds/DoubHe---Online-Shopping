/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author TANHUNG
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = ERROR;
            UserError userError = new UserError();
            boolean check = true;
            try {
                UserDAO dao = new UserDAO();
                String userID = request.getParameter("userID");
                String fullName = request.getParameter("fullName");
                String roleID = request.getParameter("roleID");
//                String roleID = "US";
                String password = request.getParameter("password");
                String confirm = request.getParameter("confirm");
                if (userID.length() < 2 || userID.length() > 50) { // < 2
                    check = false;
                    userError.setUserIDError("User ID in range (2;50) <br>");
                }
                boolean checkID = dao.checkDuplicateUser(userID);
                //user ID
                if (checkID) {
                    check = false;
                    userError.setUserIDError("User ID da ton tai <br>");
                }
                //full Name
                if (fullName.length() < 5 || fullName.length() > 50) { // < 5
                    check = false;
                    userError.setFullNameError("Full Name in range (5;50) <br>");
                }
                
                if (password.equals(confirm) == false) {
                    check = false;
                    userError.setConfirmError("Vui long kiem tra lai mat khau <br>");
                } 
                
                if (check) {
//                    boolean checkInsert = dao.insert(new UserDTO(userID, fullName, roleID, password));
                    boolean checkInsert = dao.insertV2(new UserDTO(userID, fullName, roleID, password));
                    if (checkInsert) {
                        url = SUCCESS;
                    } else {
                        userError.setError("unknow error! x.x <br>");
                        request.setAttribute("USER_ERROR", userError);
                    }
                } else {
                    request.setAttribute("USER_ERROR", userError);
                }

            } catch (Exception e) {
                log("Error at CreateController: " + e.toString());
//                if (e.toString().contains("duplicate")) {
//                    userError.setUserIDError("Duplicate User ID");
//                    request.setAttribute("USER_ERROR", userError);
//                }
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
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
