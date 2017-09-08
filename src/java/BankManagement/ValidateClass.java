/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BankManagement;

import javax.mail.Session;

/**
 *
 * @author ganusha_m
 */
public class ValidateClass {
        String uname;
        String pass;
        String suname;
        String spass;
     boolean getValidateUser(String uname ,String pass,String suname,String spass) {
         if (uname.equals(this.uname) && pass.equals(this.pass)) {
             return true;
         }
        return false;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setSuname(String suname) {
        this.suname = suname;
    }

    public void setSpass(String spass) {
        this.spass = spass;
    }
}
