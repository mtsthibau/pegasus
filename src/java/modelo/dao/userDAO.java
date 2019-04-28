/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import modelo.entidade.User;
import modelo.BaseDados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.entidade.Entregador;

/**
 *
 * @author Matheus
 */
public class userDAO {

    public static User realizarLogin(String Login, String Senha) throws SQLException {
        User U = null;
        String nivelUsuario = null;
        String Query = null;
        Senha = MD5(Senha);

        if (isAdmin(Login, Senha)) {
            nivelUsuario = "admin";
            Query = "select id, nome, email, senha \n"
                    + "from admin \n"
                    + "where email = ? and senha = ? ";
        }

        if (isEntregador(Login, Senha)) {
            nivelUsuario = "entregador";
            Query = "select id, nome, email, senha \n"
                    + "from entregador \n"
                    + "where email = ? and senha = ? and status = 'Ativo'";
        }

        if (isCliente(Login, Senha)) {
            nivelUsuario = "remetente";
            Query = "select id, nome, email, senha \n"
                    + "from remetente \n"
                    + "where email = ? and senha = ? and status = 'Ativo'";
        }

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query);

        Pst.setString(1, Login);
        Pst.setString(2, Senha);

        ResultSet Rs = Pst.executeQuery();

        if (Rs.next()) {
            U = new User();
            U.setId(Rs.getInt("id"));
            U.setNome(Rs.getString("nome"));
            U.setTipoUsuario(nivelUsuario);
            U.setLogin(Login);
            U.setSenha(Rs.getString("senha"));
        }
        return U;
    }

    public static boolean isAdmin(String Login, String senha) throws SQLException {

        String Query = " select id, nome \n"
                + " from admin  \n"
                + " where email = ? and senha = ? \n"
                + " limit 0,1";
        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query);
        Pst.setString(1, Login);
        Pst.setString(2, senha);
        ResultSet Rs = Pst.executeQuery();
        return Rs.next();
    }

    public static boolean isEntregador(String Login, String senha) throws SQLException {
        String Query = " select id, nome \n"
                + " from entregador  \n"
                + " where email = ? and senha = ? and status = 'Ativo'\n"
                + " limit 0,1";
        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query);
        Pst.setString(1, Login);
        Pst.setString(2, senha);
        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();
        return Rs.next();
    }

    public static boolean isCliente(String Login, String senha) throws SQLException {
        String Query = " select id, nome \n"
                + " from remetente  \n"
                + " where email = ? and senha = ? and status = 'Ativo'\n"
                + " limit 0,1";
        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query);
        Pst.setString(1, Login);
        Pst.setString(2, senha);
        ResultSet Rs = Pst.executeQuery();
        return Rs.next();
    }

    public static String MD5(String dataMD5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(dataMD5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }

    public static int findMail(String email) throws SQLException {
        int x = 0;

        String Query = "(SELECT id, email FROM entregador WHERE email = ?)"
                + "UNION (SELECT id, email FROM remetente WHERE email = ?)"
                + "UNION (SELECT id, email FROM admin WHERE email = ?)";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query);
        Pst.setString(1, email);
        Pst.setString(2, email);
        Pst.setString(3, email);

        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();
        
        if (Rs.next()) {
            x = Rs.getInt(1);
        }
        return x;
    }

}
