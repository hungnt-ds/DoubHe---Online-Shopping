/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controler;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.Order;
import sample.shopping.OrderDetail;
import sample.shopping.Product;
import sample.shopping.ProductDAO;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author TANHUNG
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean check = false;
            boolean checkQuantity = true;
            boolean checkInfo = true;

            HttpSession session = request.getSession();
            ProductDAO dao = new ProductDAO();
            UserError userError = new UserError();
//        String userID = (String) session.getAttribute("LOGIN_USER");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = loginUser.getUserID();
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            if (phone.length() != 10) {
                checkInfo = false;
                userError.setError("Your phone number must be 10 numbers.");
                request.setAttribute("USER_ERROR", userError);
            }
            if (checkInfo) {
                Date currentDate = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String orderDate = dateFormat.format(currentDate);
                int total = 0;
                Cart cart = (Cart) session.getAttribute("CART");

                if (cart != null) {
                    Map<String, Product> products = cart.getCart();
                    for (Map.Entry<String, Product> entry : products.entrySet()) {
                        total += entry.getValue().getQuantity() * entry.getValue().getPrice();
                    }

                    // kiểm tra số lượng sản phẩm trong giỏ hàng
                    for (Map.Entry<String, Product> productCart : products.entrySet()) {
                        int quantityInCart = productCart.getValue().getQuantity();
                        String productID = productCart.getValue().getId();
                        int quantityInReal = dao.getQuantityProduct(productID);
                        if (quantityInCart > quantityInReal) {
                            checkQuantity = false;
                        }
                    }

                    int orderID = 0;
                    // Nếu đủ số lượng = true >> tạo
                    if (checkQuantity) {
                        Order order = new Order(userID, phone, orderDate, total, address);
                        orderID = dao.createOrder(order);
                    }

                    for (Map.Entry<String, Product> productCart : products.entrySet()) {
//                INSERT INTO tblOrderDetail (orderID, productID, quantity, price) VALUES (?, ?, ?, ?)
                        String productID = productCart.getValue().getId();
                        int quantity = productCart.getValue().getQuantity();
                        double price = productCart.getValue().getPrice() * productCart.getValue().getQuantity();
                        OrderDetail orderDetail = new OrderDetail(orderID, productID, quantity, price);

                        int quantityInReal = dao.getQuantityProduct(productID);
                        if (quantity < quantityInReal) {
                            check = dao.createOrderDetail(orderDetail);
                            dao.decreaseProductQuantity(productID, quantity);
                        }
                    }

                    // tạo đơn hàng thành công
                    if (check) {
                        url = SUCCESS;
                        session.setAttribute("CART", null);
                    }
                }
            }

        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
