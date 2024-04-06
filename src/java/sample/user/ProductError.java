/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author TANHUNG
 */
public class ProductError {

    private String productIDError = "";
    private String productNameError = "";
    private String productImageError = "";
    private String productPriceError = "";
    private String productQuantityError = "";
    private String error = "";

    public ProductError() {
    }

    public ProductError(String productIDError, String productNameError, String productImageError, String productPriceError, String productQuantityError, String error) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.productImageError = productImageError;
        this.productPriceError = productPriceError;
        this.productQuantityError = productQuantityError;
        this.error = error;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getProductImageError() {
        return productImageError;
    }

    public void setProductImageError(String productImageError) {
        this.productImageError = productImageError;
    }

    public String getProductPriceError() {
        return productPriceError;
    }

    public void setProductPriceError(String productPriceError) {
        this.productPriceError = productPriceError;
    }

    public String getProductQuantityError() {
        return productQuantityError;
    }

    public void setProductQuantityError(String productQuantityError) {
        this.productQuantityError = productQuantityError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
