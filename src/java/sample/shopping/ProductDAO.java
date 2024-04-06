/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.naming.NamingException;
import sample.utils.DBUtils;

/**
 *
 * @author TANHUNG
 */
public class ProductDAO {

    private static final String INSERT_PRODUCT = "INSERT INTO tblProduct (productID, productName, image, price, quantity) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM tblProduct";
    private static final String FIND_BY_ID = "SELECT * FROM tblProduct WHERE productID=?";
    private static final String UPDATE_PRODUCT = "UPDATE tblProduct SET productName=?, image=?, price=?, quantity=? WHERE productID =?";
    private static final String CREATE_ORDER = "INSERT INTO tblOrders (customerID, phoneNumber, orderDate, total, address) VALUES (?, ?, ?, ?, ?)";
    private static final String CREATE_ORDER_DETAIL = "INSERT INTO tblOrderDetail (orderID, productID, quantity, price) VALUES (?, ?, ?, ?)";
    private static final String GET_QUANTITY = "SELECT quantity FROM tblProduct WHERE productID=?";
    private static final String UPDATE_QUANTITY = "UPDATE tblProduct SET quantity = ? WHERE productID = ?";
    private static final String DUPLICATE_PRODUCT = "SELECT productID FROM tblProduct WHERE productID=?";
    private static final String SEARCH_PRODUCT = "SELECT productID, productName, image, price, quantity FROM tblProduct WHERE productName like ?";

    public List<Product> getListProductByName(String search) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnectionV1();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    Product product = new Product(productID, productName, image, price, quantity);
                    list.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public void decreaseProductQuantity(String productID, int decreaseAmount) throws SQLException, ClassNotFoundException, NamingException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnectionV1();
            if (conn != null) {
                // curent quantity
                int currentQuantity = getQuantityProduct(productID);
                if (currentQuantity >= decreaseAmount) {
                    int newQuantity = currentQuantity - decreaseAmount;
                    ptm = conn.prepareStatement(UPDATE_QUANTITY);
                    ptm.setInt(1, newQuantity);
                    ptm.setString(2, productID);

                    ptm.executeUpdate();
                } else {
                    throw new IllegalArgumentException("Số lượng sản phẩm không đủ để giảm.");
                }
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public int getQuantityProduct(String productID) throws SQLException, ClassNotFoundException, NamingException {
        int productQuantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnectionV1();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    productQuantity = rs.getInt("quantity");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return productQuantity;
    }

    public boolean insertProduct(Product product) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnectionV1();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_PRODUCT);
//                debug
                String id = product.getId();
                String name = product.getName();
                String image = product.getImage();
                double price = product.getPrice();
                int quantity = product.getQuantity();
                ptm.setString(1, id);
                ptm.setString(2, name);
                ptm.setString(3, image);
                ptm.setDouble(4, price);
                ptm.setInt(5, quantity);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicateProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnectionV1();
            if (conn != null) {
                ptm = conn.prepareStatement(DUPLICATE_PRODUCT);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean createOrderDetail(OrderDetail oderDetail) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnectionV1();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER_DETAIL);
                ptm.setInt(1, oderDetail.getOrderID());
                ptm.setString(2, oderDetail.getProductID());
                ptm.setInt(3, oderDetail.getQuantity());
                ptm.setDouble(4, oderDetail.getPrice());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int createOrder(Order oder) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnectionV1();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, oder.getCustomerID());
                ptm.setString(2, oder.getPhoneNumber());
                ptm.setString(3, oder.getOrderDate());
                ptm.setDouble(4, oder.getTotal());
                ptm.setString(5, oder.getAddress());
                check = ptm.executeUpdate() > 0 ? true : false;

                try (ResultSet rs = ptm.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                    rs.close();
                } catch (Exception e) {
                    return 0;
                }

            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public boolean updateProduct(Product product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnectionV1();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT);
                ptm.setString(1, product.getName());
                ptm.setString(2, product.getImage());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                ptm.setString(5, product.getId());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean testImage(String url) {
        try {
            BufferedImage image = ImageIO.read(new URL(url));
            if (image != null) {
                return true;
            } else {
                return false;
            }
        } catch (IOException e) {
            System.err.println("IO error with image: " + e.getMessage());
            return false;
        }
    }

    public Product getProductByID(String productID) throws SQLException {
        Connection conn = null;         //quản lý kết nối cơ sở dữ liệu
        PreparedStatement ptm = null;   //thực thi truy vấn SQL
        ResultSet rs = null;            //lưu kết quả truy vấn
        Product product = new Product();
        try {
            conn = DBUtils.getConnectionV1();
            ptm = conn.prepareStatement(FIND_BY_ID);
            ptm.setString(1, productID); // Truyền giá trị ID vào câu truy vấn
            rs = ptm.executeQuery();
            while (rs.next()) {
//                String id = rs.getString("id");
//                String name = rs.getString("name");
//                double price = rs.getDouble("price");
//                String image = rs.getString("image");
//                int quantity = 1;
                product = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), 1);
            }
        } catch (Exception e) {
        }
        return product;
    }
    public static void main(String[] args) throws SQLException {
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductByID("P0010");
        System.out.println(product);
    }
    public List<Product> getAllProduct() throws SQLException {
        Connection conn = null;         //quản lý kết nối cơ sở dữ liệu
        PreparedStatement ptm = null;   //thực thi truy vấn SQL
        ResultSet rs = null;            //lưu kết quả truy vấn
        List<Product> list = new ArrayList<>();
        try {
            conn = new DBUtils().getConnectionV1();
            ptm = conn.prepareStatement(SELECT_ALL_PRODUCT);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
