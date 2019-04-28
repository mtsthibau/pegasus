/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.ModeloException;
import modelo.entidade.Parametro;
import modelo.entidade.Post;

public class ParamDao {

    public static ArrayList<Parametro> getParams() throws SQLException {

        ArrayList<Parametro> lstParam = new ArrayList<Parametro>();
        String Query = "SELECT id, nome, descricao, valor FROM parametro";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();
        System.out.println(Pst);
        while (Rs.next()) {
            Parametro P = new Parametro();
            P.setId(Rs.getInt("id"));
            P.setNome(Rs.getString("nome"));
            P.setDescricao(Rs.getString("descricao"));
            P.setValor(Rs.getDouble("valor"));

            lstParam.add(P);
        }

        return lstParam;
    }

    public static Parametro getParametro(String nome) throws SQLException, ModeloException, ParseException {
        
        Parametro P = null;

        String Query = "SELECT valor FROM parametro WHERE nome = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setString(1, nome);
        
        System.out.println(Pst);

        ResultSet Rs = Pst.executeQuery();
        if (Rs.next()) {
            P = new Parametro();
            P.setValor(Rs.getDouble("valor"));
        }

        return P;
    }

    public static int editParametro(int id, double valor) throws SQLException, ModeloException, ParseException {

        String Query = "UPDATE parametro SET valor = ? WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setDouble(1, valor);
        Pst.setInt(2, id);

        System.out.println("PST -" + Pst);
        Pst.executeUpdate();

        return id;
    }
}
