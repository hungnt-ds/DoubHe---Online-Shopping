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
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.Product;
import sample.shopping.ProductDAO;
import sample.user.UserDAO;

/**
 *
 * @author TANHUNG
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "HomeController";
    private static final String SUCCESS = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String id = request.getParameter("id");
            ProductDAO dao = new ProductDAO();
//            String name = request.getParameter("product-name");
//            String image = request.getParameter("product-img");
//            double price = Double.parseDouble(request.getParameter("product-price"));
//            int quantity = 1;
            Product product = dao.getProductByID(id);
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                cart.add(product);
                session.setAttribute("CART", cart);
                session.setAttribute("MESSAGE", "Added " + id + " - " + product.getQuantity());
                url = SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at AddController: " + e.toString());
        } finally {
            response.sendRedirect(url);
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
