/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Kelum
 */
public class LoginUserModel {
    private int user_id;
    private String privilege;
    private String first_name;
    private String last_name;
    private boolean is_password_changed;

    public LoginUserModel(int user_id, String privilege, String first_name, String last_name, boolean is_password_changed) {
        this.user_id = user_id;
        this.privilege = privilege;
        this.first_name = first_name;
        this.last_name = last_name;
        this.is_password_changed = is_password_changed;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getPrivilege() {
        return privilege;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public boolean isPassword_changed() {
        return is_password_changed;
    }
    
}
