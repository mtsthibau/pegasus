/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo.entidade;

public class Usuario {
    
    private int CodUsuario;
    private String Nome;
    private String Login;
    private String Sexo;
    private String Data_nasc;
    private String email;
    private int permissao;
    private String Rec_atualizacao;

    private String Senha;   
    private int Permissao;
    
    public Usuario(){
        
    }

    /**
     * @return the CodUsuario
     */
    public int getCodUsuario() {
        return CodUsuario;
    }

    /**
     * @param CodUsuario the CodUsuario to set
     */
    public void setCodUsuario(int CodUsuario) {
        this.CodUsuario = CodUsuario;
    }

    /**
     * @return the Nome
     */
    public String getNome() {
        return Nome;
    }

    /**
     * @param Nome the Nome to set
     */
    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    /**
     * @return the Login
     */
    public String getLogin() {
        return Login;
    }

    /**
     * @param Login the Login to set
     */
    public void setLogin(String Login) {
        this.Login = Login;
    }

    /**
     * @return the Senha
     */
    public String getSenha() {
        return Senha;
    }

    /**
     * @param Senha the Senha to set
     */
    public void setSenha(String Senha) {
        this.Senha = Senha;
    }

    /**
     * @return the Permissao
     */
    public int getPermissao() {
        return Permissao;
    }

    /**
     * @param Permissao the Permissao to set
     */
    public void setPermissao(int Permissao) {
        this.Permissao = Permissao;
    }

    /**
     * @return the Sexo
     */
    public String getSexo() {
        return Sexo;
    }

    /**
     * @param Sexo the Sexo to set
     */
    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }

    /**
     * @return the Data_nasc
     */
    public String getData_nasc() {
        return Data_nasc;
    }

    /**
     * @param Data_nasc the Data_nasc to set
     */
    public void setData_nasc(String Data_nasc) {
        this.Data_nasc = Data_nasc;
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
     * @return the Rec_atualizacao
     */
    public String getRec_atualizacao() {
        return Rec_atualizacao;
    }

    /**
     * @param Rec_atualizacao the Rec_atualizacao to set
     */
    public void setRec_atualizacao(String Rec_atualizacao) {
        this.Rec_atualizacao = Rec_atualizacao;
    }
    
}
