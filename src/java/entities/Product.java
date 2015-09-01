package entities;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Sergios
 */
public class Product {
    
    private String serialN;
    private String name;
    private String descr;
    private String cat;
    private String weight;
    private String dim;

    public Product(String serialN, String name, String descr, String cat, String weight, String dim) {
        this.serialN = serialN;
        this.name = name;
        this.descr = descr;
        this.cat = cat;
        this.weight = weight;
        this.dim = dim;
    }

    public String getSerialN() {
        return serialN;
    }

    public void setSerialN(String serialN) {
        this.serialN = serialN;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getCat() {
        return cat;
    }

    public void setCat(String cat) {
        this.cat = cat;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getDim() {
        return dim;
    }

    public void setDim(String dim) {
        this.dim = dim;
    }
}


