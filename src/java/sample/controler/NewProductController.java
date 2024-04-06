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
import sample.shopping.Product;
import sample.shopping.ProductDAO;
import sample.user.ProductError;
import sample.user.UserDAO;

/**
 *
 * @author TANHUNG
 */
@WebServlet(name = "NewProductController", urlPatterns = {"/NewProductController"})
public class NewProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "new-product.jsp";
    private static final String SUCCESS = "new-product.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = ERROR;
            ProductError productError = new ProductError();
            boolean check = true;
            try {
                ProductDAO dao = new ProductDAO();
                String productID = request.getParameter("productID");
                String productName = request.getParameter("productName");
                String productImage = request.getParameter("productImage");
                double productPrice = Double.parseDouble(request.getParameter("productPrice"));
                int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
//                String roleID = "US";
                boolean checkID = dao.checkDuplicateProduct(productID);
                //user ID
                if (checkID) {
                    check = false;
                    productError.setProductIDError("Product ID da ton tai <br>");
                }
                //full Name
                if (productName.length() < 5 || productName.length() > 20) { // < 5
                    check = false;
                    productError.setProductNameError("Full Name in range (5;20) <br>");
                }

                if (check) {
                    boolean checkInsert = dao.insertProduct(new Product(productID, productName, productImage, productPrice, productQuantity));
                    if (checkInsert) {
                        url = SUCCESS;
                    } else {
                        productError.setError("unknow error! x.x <br>");
                        request.setAttribute("PRODUCT_ERROR", productError);
                    }
                } else {
                    request.setAttribute("PRODUCT_ERROR", productError);
                }
            } catch (Exception e) {
                log("Error at NewProductController: " + e.toString());
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
