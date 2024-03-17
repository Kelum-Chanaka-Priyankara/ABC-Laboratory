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
public class UserModel extends UserBaseModel{

   
    private String privilege;

    public UserModel(int user_id, String first_name, String last_name, String gender, String address, String email, String phone_number, String privilege) {
       super(user_id,first_name,last_name,gender,address,email,phone_number);
        this.privilege = privilege;
    }

    public String getPrivilege() {
        return privilege;
    }

}