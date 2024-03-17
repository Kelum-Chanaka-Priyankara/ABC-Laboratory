/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.Inherited;

import Models.Base.UserBaseModel;

/**
 *
 * @author Kelum
 */
public class UserViewModel extends UserBaseModel {

    private String role;

    public UserViewModel(int user_id, String first_name, String last_name, String gender, String address, String email, String phone_number, String role) {
        super(user_id, first_name, last_name, gender, address, email, phone_number);
        this.role = role;
    }

    public String getRole() {
        return role;
    }

}