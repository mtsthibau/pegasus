/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidade;

/**
 *
 * @author matheus
 */
public class Escala {
    private int id;
    private String tipo;
    private double psoMin;
    private double pesoMax;
    private double preco;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the psoMin
     */
    public double getPsoMin() {
        return psoMin;
    }

    /**
     * @param psoMin the psoMin to set
     */
    public void setPsoMin(double psoMin) {
        this.psoMin = psoMin;
    }

    /**
     * @return the pesoMax
     */
    public double getPesoMax() {
        return pesoMax;
    }

    /**
     * @param pesoMax the pesoMax to set
     */
    public void setPesoMax(double pesoMax) {
        this.pesoMax = pesoMax;
    }

    /**
     * @return the preco
     */
    public double getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(double preco) {
        this.preco = preco;
    }

    public void setPreco() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

 
}
