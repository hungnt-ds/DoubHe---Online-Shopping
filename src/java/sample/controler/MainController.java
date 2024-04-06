/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TANHUNG
 */
public class MainController extends HttpServlet {

    //trang mac dinh ban dau
    private static final String WELLCOME_PAGE = "login.html";
    //2 cai nhan 3 loai para
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLER = "LoginController";
    //neu co ti them vo
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLER = "SearchController";

    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLER = "DeleteController";

    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLER = "UpdateController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLER = "LogoutController";

    private static final String CREATE_PAGE = "Create_Page";
    private static final String CREATE_PAGE_VIEW = "create.html";

    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLER = "CreateController";

    private static final String SHOPPING_PAGE = "Shopping_Page";
    private static final String SHOPPING_PAGE_VIEW = "shopping.html";

    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";

    private static final String VIEW = "View";
    private static final String VIEW_CONTROLLER = "viewCart.jsp";

    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";

    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";

    private static final String HOME = "Home";
    private static final String HOME_CONTROLLER = "HomeController";

    private static final String ADDTOCART = "AddToCart";
    private static final String ADDTOCART_CONTROLLER = "AddToCartController";

    private static final String UPDATE_PRODUCT = "UpdateProduct";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";

    private static final String CHECK_OUT = "CheckOut";
    private static final String CHECK_OUT_CONTROLLER = "CheckOutController";

    private static final String NEW_PRODUCT = "NewProduct";
    private static final String NEW_PRODUCT_CONTROLLER = "NewProductController";

    private static final String INFO_EMAIL = "InfoEmail";
    private static final String GET_INFO_MAIL_CONTROLLER = "email-form.jsp";

    private static final String SEND_EMAIL = "SendEmail";
    private static final String SEND_EMAIL_CONTROLLER = "SendEmailController";

    private static final String SEARCH_PRODUCT = "SearchProduct";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    
    private static final String TOP1 = "Top1";
    private static final String TOP1_CONTROLLER = "Top1Controller";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = WELLCOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = WELLCOME_PAGE;
                //dieu phoi
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLER;
            } else if (CREATE_PAGE.equals(action)) {
                url = CREATE_PAGE_VIEW;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLER;
            } else if (SHOPPING_PAGE.equals(action)) {
                url = SHOPPING_PAGE_VIEW;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEW.equals(action)) {
                url = VIEW_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (HOME.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (ADDTOCART.equals(action)) {
                url = ADDTOCART_CONTROLLER;
            } else if (UPDATE_PRODUCT.equals(action)) {
                url = UPDATE_PRODUCT_CONTROLLER;
            } else if (CHECK_OUT.equals(action)) {
                url = CHECK_OUT_CONTROLLER;
            } else if (NEW_PRODUCT.equals(action)) {
                url = NEW_PRODUCT_CONTROLLER;
            } else if (INFO_EMAIL.equals(action)) {
                url = GET_INFO_MAIL_CONTROLLER;
            } else if (SEND_EMAIL.equals(action)) {
                url = SEND_EMAIL_CONTROLLER;
            } else if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (TOP1.equals(action)) {
                url = TOP1_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
