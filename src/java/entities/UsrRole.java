/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Sergios
 */
public class UsrRole {
    
    private String description;
    private int prod_perm;
    private int wh_perm;
    private int role_perm;
    private int suppl_perm;
    private int usr_perm;

    public UsrRole(String description, int prod_perm, int wh_perm, int role_perm, int suppl_perm, int usr_perm) {
        this.description = description;
        this.prod_perm = prod_perm;
        this.wh_perm = wh_perm;
        this.role_perm = role_perm;
	this.suppl_perm = suppl_perm;
	this.usr_perm = usr_perm;
    }

    public int getSuppl_perm() {
	return suppl_perm;
    }

    public void setSuppl_perm(int suppl_perm) {
	this.suppl_perm = suppl_perm;
    }

    public int getUsr_perm() {
	return usr_perm;
    }

    public void setUsr_perm(int usr_perm) {
	this.usr_perm = usr_perm;
    }

    
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getProd_perm() {
        return prod_perm;
    }

    public void setProd_perm(int prod_perm) {
        this.prod_perm = prod_perm;
    }

    public int getWh_perm() {
        return wh_perm;
    }

    public void setWh_perm(int wh_perm) {
        this.wh_perm = wh_perm;
    }

    public int getRole_perm() {
        return role_perm;
    }

    public void setRole_perm(int role_perm) {
        this.role_perm = role_perm;
    }
    
    
}
