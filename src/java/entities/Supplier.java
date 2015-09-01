/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Sergios
 */
public class Supplier {
    
    private String name;
    private String address;
    private String email;
    private String phone_number;
    private String n_i_n;

    public Supplier(String name, String address, String email, String phone_number, String n_i_n) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone_number = phone_number;
        this.n_i_n = n_i_n;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getN_i_n() {
        return n_i_n;
    }

    public void setN_i_n(String n_i_n) {
        this.n_i_n = n_i_n;
    }
    
    
}
