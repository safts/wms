package entities;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author Sergios
 */
public class Warehouse {
    
    private String name;
    private String location;
    private String description;
    private boolean isOpen;
    private boolean has_products;
    private int amount;

    public int getAmount() {
	return amount;
    }

    public void setAmount(int amount) {
	this.amount = amount;
    }

    public Warehouse(String name, String location, String description, boolean isOpen, boolean has_products, int amount) {
	this.name = name;
	this.location = location;
	this.description = description;
	this.isOpen = isOpen;
	this.has_products = has_products;
	this.amount = amount;
    }

    public Warehouse(String name, String location, String description, boolean isOpen, boolean has_products) {
        this.name = name;
        this.location = location;
        this.description = description;
        this.isOpen = isOpen;
        this.has_products = has_products;
	amount=0;
    }

    public Warehouse(String name, String location, String description, boolean isOpen) {
        this.name = name;
        this.location = location;
        this.description = description;
        this.isOpen = isOpen;
        this.has_products=false;
	amount=0;
    }

    
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isIsOpen() {
        return isOpen;
    }

    public void setIsOpen(boolean isOpen) {
        this.isOpen = isOpen;
    }

    public boolean isHas_products() {
        return has_products;
    }

    public void setHas_products(boolean has_products) {
        this.has_products = has_products;
    }
    
}
