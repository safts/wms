/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Sergios
 */
public class WhHistory {

    private String wh_name;
    private String pr_s_n;
    private String pr_name;
    private String quantity;
    private String price;
    private String date;
    private String type;
    
    public WhHistory(String wh_name, String pr_s_n, String pr_name, String quantity, String price, String date, String type) {
	this.wh_name = wh_name;
	this.pr_s_n = pr_s_n;
	this.pr_name = pr_name;
	this.quantity = quantity;
	this.price = price;
	this.date = date;
	this.type = type;
    }
    


    public String getWh_name() {
	return wh_name;
    }

    public void setWh_name(String wh_name) {
	this.wh_name = wh_name;
    }

    public String getPr_s_n() {
	return pr_s_n;
    }

    public void setPr_s_n(String pr_s_n) {
	this.pr_s_n = pr_s_n;
    }

    public String getPr_name() {
	return pr_name;
    }

    public void setPr_name(String pr_name) {
	this.pr_name = pr_name;
    }

    public String getQuantity() {
	return quantity;
    }

    public void setQuantity(String quantity) {
	this.quantity = quantity;
    }

    public String getPrice() {
	return price;
    }

    public void setPrice(String price) {
	this.price = price;
    }

    public String getDate() {
	return date;
    }

    public void setDate(String date) {
	this.date = date;
    }

    public String getType() {
	return type;
    }

    public void setType(String type) {
	this.type = type;
    }
    
}
