/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidade;

import java.sql.Date;

/**
 *
 * @author matheus
 */
public class Post {

    private int Id;
    private int rem;
    private int IdFkEntr;
    private String tipo;
    private String descricao;
    private double peso;
    private double altura;
    private double profundidade;
    private double largura;
    private String urgencia;
    private String periodo;
    private String destinatario;
    private String telefone;
    private String celular;
    private String email;
    private String cep;
    private String logradouro;
    private String numero;
    private String complemento;
    private String bairro;
    private double latitude;
    private double longitude;
    private Date data;
    private String status;
    private double valorTotal;
    private double valorProduto;
    private String distancia;
    private String rgRetirada;
    private String responsavelRetirada;
    private String rgRecebedor;
    private String recebedor;
    private String dataFinal;

    public Post() {

    }

    /**
     * @return the cod
     */
    public int getId() {
        return Id;
    }

    /**
     * @param cod the cod to set
     */
    public void setId(int Id) {
        this.Id = Id;
    }

    /**
     * @return the Nome
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param Nome the Nome to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the destinatario
     */
    public String getDestinatario() {
        return destinatario;
    }

    /**
     * @param destinatario the destinatario to set
     */
    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    /**
     * @return the peso
     */
    public double getPeso() {
        return peso;
    }

    /**
     * @param peso the peso to set
     */
    public void setPeso(double peso) {
        this.peso = peso;
    }

    /**
     * @return the altura
     */
    public double getAltura() {
        return altura;
    }

    /**
     * @param altura the altura to set
     */
    public void setAltura(double altura) {
        this.altura = altura;
    }

    /**
     * @return the profundidade
     */
    public double getProfundidade() {
        return profundidade;
    }

    /**
     * @param profundidade the profundidade to set
     */
    public void setProfundidade(double profundidade) {
        this.profundidade = profundidade;
    }

    /**
     * @return the largura
     */
    public double getLargura() {
        return largura;
    }

    /**
     * @param largura the largura to set
     */
    public void setLargura(double largura) {
        this.largura = largura;
    }

    /**
     * @return the urgencia
     */
    public String getUrgencia() {
        return urgencia;
    }

    /**
     * @param urgencia the urgencia to set
     */
    public void setUrgencia(String urgencia) {
        this.urgencia = urgencia;
    }
    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @return the celular
     */
    public String getCelular() {
        return celular;
    }

    /**
     * @param celular the celular to set
     */
    public void setCelular(String celular) {
        this.celular = celular;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the cep
     */
    public String getCep() {
        return cep;
    }

    /**
     * @param cep the cep to set
     */
    public void setCep(String cep) {
        this.cep = cep;
    }

    /**
     * @return the bairro
     */
    public String getBairro() {
        return bairro;
    }

    /**
     * @param bairro the bairro to set
     */
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the data
     */
    public Date getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the periodo
     */
    public String getPeriodo() {
        return periodo;
    }

    /**
     * @param periodo the periodo to set
     */
    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    /**
     * @return the logradouro
     */
    public String getLogradouro() {
        return logradouro;
    }

    /**
     * @param logradouro the logradouro to set
     */
    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    /**
     * @return the numero
     */
    public String getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public void setNumero(String numero) {
        this.numero = numero;
    }

    /**
     * @return the complemento
     */
    public String getComplemento() {
        return complemento;
    }

    /**
     * @param complemento the complemento to set
     */
    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    /**
     * @return the valorTotal
     */
    public double getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    /**
     * @return the distancia
     */
    public String getDistancia() {
        return distancia;
    }

    /**
     * @param distancia the distancia to set
     */
    public void setDistancia(String distancia) {
        this.distancia = distancia;
    }

    /**
     * @return the rem
     */
    public int getRem() {
        return rem;
    }

    /**
     * @param rem the rem to set
     */
    public void setRem(int rem) {
        this.rem = rem;
    }

    /**
     * @return the latitude
     */
    public double getLatitude() {
        return latitude;
    }

    /**
     * @param latitude the latitude to set
     */
    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    /**
     * @return the longitude
     */
    public double getLongitude() {
        return longitude;
    }

    /**
     * @param longitude the longitude to set
     */
    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    /**
     * @return the IdFkEntr
     */
    public int getIdFkEntr() {
        return IdFkEntr;
    }

    /**
     * @param IdFkEntr the IdFkEntr to set
     */
    public void setIdFkEntr(int IdFkEntr) {
        this.IdFkEntr = IdFkEntr;
    }

    /**
     * @return the rgRetirada
     */
    public String getRgRetirada() {
        return rgRetirada;
    }

    /**
     * @param rgRetirada the rgRetirada to set
     */
    public void setRgRetirada(String rgRetirada) {
        this.rgRetirada = rgRetirada;
    }

    /**
     * @return the responsavelRetirada
     */
    public String getResponsavelRetirada() {
        return responsavelRetirada;
    }

    /**
     * @param responsavelRetirada the responsavelRetirada to set
     */
    public void setResponsavelRetirada(String responsavelRetirada) {
        this.responsavelRetirada = responsavelRetirada;
    }

    /**
     * @return the rgRecebedor
     */
    public String getRgRecebedor() {
        return rgRecebedor;
    }

    /**
     * @param rgRecebedor the rgRecebedor to set
     */
    public void setRgRecebedor(String rgRecebedor) {
        this.rgRecebedor = rgRecebedor;
    }

    /**
     * @return the recebedor
     */
    public String getRecebedor() {
        return recebedor;
    }

    /**
     * @param recebedor the recebedor to set
     */
    public void setRecebedor(String recebedor) {
        this.recebedor = recebedor;
    }

    /**
     * @return the dataFinal
     */
    public String getDataFinal() {
        return dataFinal;
    }

    /**
     * @param dataFinal the dataFinal to set
     */
    public void setDataFinal(String dataFinal) {
        this.dataFinal = dataFinal;
    }

    /**
     * @return the valorProduto
     */
    public double getValorProduto() {
        return valorProduto;
    }

    /**
     * @param valorProduto the valorProduto to set
     */
    public void setValorProduto(double valorProduto) {
        this.valorProduto = valorProduto;
    }

    public void setId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
