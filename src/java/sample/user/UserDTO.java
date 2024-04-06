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
//  Data Transfer Object (DTO) 
//  được sử dụng trong ứng dụng để đại diện cho 
//  dữ liệu người dùng
public class UserDTO {

    private String userID;
    private String fullName;
    private String roleID;
    private String password;
    private int status;

    public UserDTO() {
    }

    public UserDTO(String userID, String fullName, String roleID, String password) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
    }

    public UserDTO(String userID, String fullName, String roleID, String password, int status) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "YourClass{"
                + "id='" + userID + '\''
                + ", userID='" + userID + '\''
                + ", fullName='" + fullName + '\''
                + ", roleID='" + roleID + '\''
                + ", password='" + password + '\''
                + '}';
    }

}
