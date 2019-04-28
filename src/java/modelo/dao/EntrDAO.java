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
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.ModeloException;
import modelo.entidade.Entregador;

/**
 *
 * @author matheus
 */
public class EntrDAO {

    public static Entregador getEntregador(int Id) throws SQLException {
        Entregador E = null;

        String Query = "SELECT id, nome, email, senha, docRegistro, tipoVeiculo, telefone, cep, "
                + "logradouro, numero, complemento, bairro, cidade, estado, banco, agencia, numConta, "
                + "saldo, totalRecebido, status, latitude, longitude, nota, numeroVotos FROM entregador WHERE id = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, Id);
        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();

        if (Rs.next()) {
            E = new Entregador();
            E.setId(Rs.getInt("id"));
            E.setNome(Rs.getString("nome"));
            E.setEmail(Rs.getString("email"));
            E.setSenha(Rs.getString("senha"));
            E.setCnpj(Rs.getString("docRegistro"));
            E.setTipoVeiculo(Rs.getString("tipoVeiculo"));
            E.setTelefone(Rs.getString("telefone"));
            E.setCep(Rs.getString("cep"));
            E.setLogradouro(Rs.getString("logradouro"));
            E.setNumero(Rs.getString("numero"));
            E.setComplemento(Rs.getString("complemento"));
            E.setBairro(Rs.getString("bairro"));
            E.setCidade(Rs.getString("cidade"));
            E.setEstado(Rs.getString("estado"));
            E.setBanco(Rs.getString("banco"));
            E.setAgencia(Rs.getString("agencia"));
            E.setConta(Rs.getString("numConta"));
            E.setSaldo(Rs.getDouble("saldo"));
            E.setTotal(Rs.getDouble("totalRecebido"));
            E.setStatus(Rs.getString("status"));
            E.setLatitude(Rs.getString("latitude"));
            E.setLongitude(Rs.getString("longitude"));
            E.setNota(Rs.getInt("nota"));
            E.setNumeroVotos(Rs.getInt("numeroVotos"));
        }

        return E;
    }

    public static Entregador solTrocaSenha(String email) throws SQLException {
        Entregador E = null;

        String Query = "SELECT id, nome, email FROM entregador WHERE email = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setString(1, email);
        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();

        if (Rs.next()) {
            E = new Entregador();
            E.setId(Rs.getInt("id"));
            E.setNome(Rs.getString("nome"));
            E.setEmail(Rs.getString("email"));
        }

        return E;
    }

    public static int altSenha(String email, String senha, int id) throws SQLException, ModeloException {
        String Query = "UPDATE entregador SET email = ?, senha = ? WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);
        String senhaMD5 = userDAO.MD5(senha);

        Pst.setString(1, email);
        Pst.setString(2, senhaMD5);
        Pst.setInt(3, id);

        Pst.executeUpdate();

        System.out.println(Pst);

        return id;
    }

    public static ArrayList<Entregador> getEntregadores() throws SQLException {

        ArrayList<Entregador> lst = new ArrayList<>();
        String Query = "SELECT id, nome"
                + " ,email, senha, docRegistro, tipoVeiculo, telefone, cep, logradouro, numero, complemento, bairro, cidade, estado"
                + ", banco, agencia, numConta, saldo, status, latitude, longitude, nota, numeroVotos"
                + " FROM entregador ORDER BY id";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Entregador E = new Entregador();
            E.setId(Rs.getInt("id"));
            E.setNome(Rs.getString("nome"));
            E.setEmail(Rs.getString("email"));
            E.setSenha(Rs.getString("senha"));
            E.setCnpj(Rs.getString("docRegistro"));
            E.setTipoVeiculo(Rs.getString("tipoVeiculo"));
            E.setTelefone(Rs.getString("telefone"));
            E.setCep(Rs.getString("cep"));
            E.setLogradouro(Rs.getString("logradouro"));
            E.setNumero(Rs.getString("numero"));
            E.setComplemento(Rs.getString("complemento"));
            E.setBairro(Rs.getString("bairro"));
            E.setCidade(Rs.getString("cidade"));
            E.setEstado(Rs.getString("estado"));
            E.setBanco(Rs.getString("banco"));
            E.setAgencia(Rs.getString("agencia"));
            E.setConta(Rs.getString("numConta"));
            E.setSaldo(Rs.getDouble("saldo"));
            E.setStatus(Rs.getString("status"));
            E.setLatitude(Rs.getString("latitude"));
            E.setLongitude(Rs.getString("longitude"));
            E.setNota(Rs.getInt("nota"));
            E.setNumeroVotos(Rs.getInt("numeroVotos"));

            lst.add(E);
        }

        return lst;
    }

    public static ArrayList<Entregador> getRanking() throws SQLException {

        ArrayList<Entregador> lst = new ArrayList<>();
        String Query = "SELECT id, nome, email, telefone, nota, numeroVotos FROM entregador ORDER BY id DESC LIMIT 10";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Entregador E = new Entregador();
            E.setId(Rs.getInt("id"));
            E.setNome(Rs.getString("nome"));
            E.setEmail(Rs.getString("email"));
            E.setTelefone(Rs.getString("telefone"));
            E.setNota(Rs.getInt("nota"));
            E.setNumeroVotos(Rs.getInt("numeroVotos"));

            lst.add(E);
        }

        return lst;
    }

    public static int insertEntregador(Entregador Novo) throws SQLException, ModeloException {

        int Id = 0;
        String Query = "INSERT INTO entregador (nome, email, senha, docRegistro, tipoVeiculo, "
                + "telefone, cep, logradouro, numero, complemento, bairro, cidade, estado, banco, "
                + "agencia, numConta, status, nota, numeroVotos) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        String senha = Novo.getSenha();
        String senhaMD5;
        senhaMD5 = userDAO.MD5(senha);
        double nota = 0;
        double numeroVotos = 0;
        
        Pst.setString(1, Novo.getNome());
        Pst.setString(2, Novo.getEmail());
        Pst.setString(3, senhaMD5);
        Pst.setString(4, Novo.getCnpj());
        Pst.setString(5, Novo.getTipoVeiculo());
        Pst.setString(6, Novo.getTelefone());
        Pst.setString(7, Novo.getCep());
        Pst.setString(8, Novo.getLogradouro());
        Pst.setString(9, Novo.getNumero());
        Pst.setString(10, Novo.getComplemento());
        Pst.setString(11, Novo.getBairro());
        Pst.setString(12, "Belo Horizonte");
        Pst.setString(13, "MG");
        Pst.setString(14, Novo.getBanco());
        Pst.setString(15, Novo.getAgencia());
        Pst.setString(16, Novo.getConta());
        Pst.setDouble(17, nota);
        Pst.setDouble(18, numeroVotos);
        Pst.setString(19, "Ativo");

        ResultSet Rs = Pst.getGeneratedKeys();
        System.out.println(Pst);

        Pst.executeUpdate();

        return Id;
    }

    public static int editEntr(Entregador Novo, int id) throws SQLException, ModeloException {

        int Id = 0;
        String Query = "UPDATE entregador SET nome = ?, senha = ?, docRegistro = ?, "
                + "tipoVeiculo = ?, telefone = ?, cep = ?, logradouro = ?, numero=?, complemento = ?, bairro = ?, cidade = ?, estado = ?, "
                + "banco = ?, agencia = ?, numConta = ?, email = ?"
                + "WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        String senhaMD5 = userDAO.MD5(Novo.getSenha());

        Pst.setString(1, Novo.getNome());
        Pst.setString(2, senhaMD5);
        Pst.setString(3, Novo.getCnpj());
        Pst.setString(4, Novo.getTipoVeiculo());
        Pst.setString(5, Novo.getTelefone());
        Pst.setString(6, Novo.getCep());
        Pst.setString(7, Novo.getLogradouro());
        Pst.setString(8, Novo.getNumero());
        Pst.setString(9, Novo.getComplemento());
        Pst.setString(10, Novo.getBairro());
        Pst.setString(11, "Belo Horizonte");
        Pst.setString(12, "MG");
        Pst.setString(13, Novo.getBanco());
        Pst.setString(14, Novo.getAgencia());
        Pst.setString(15, Novo.getConta());
        Pst.setString(16, Novo.getEmail());
        Pst.setInt(15, id);

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();

        if (Rs.next()) {
            Id = Rs.getInt(1);
            Novo.setId(Id);
        }

        return Id;
    }

    public static int getLocalEntr(Entregador e, int id) throws SQLException, ModeloException {
        String Query = "UPDATE entregador SET latitude = ?, longitude = ? WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setString(1, e.getLatitude());
        Pst.setString(2, e.getLongitude());
        Pst.setInt(3, id);

        Pst.executeUpdate();
        ResultSet Rs = Pst.getGeneratedKeys();

        System.out.println(Pst);

        return 0;
    }

    public static int bloqEntr(int id) throws SQLException, ModeloException {

        int Id = 0;
        String Query = "UPDATE entregador SET status = 'Desativado'"
                + "WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, id);

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();
        System.out.println(Pst);

        return Id;
    }

    public static void avalEntregador(int id, double nota, int notaAc, int numeroVotos) throws SQLException, ModeloException {

        notaAc += nota;
        numeroVotos += 1;
        String Query = "UPDATE entregador SET numeroVotos = ?, nota = ? WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, numeroVotos);
        Pst.setDouble(2, notaAc);
        Pst.setInt(3, id);

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();
        System.out.println(Pst);

    }

    public static int somarSaldo(int entr, double total, double saldo, String lat, String lng) throws SQLException, ModeloException {
        String Query = "UPDATE entregador SET saldo = ? + " + total + ", latitude = ?, longitude = ? "
                + "WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setDouble(1, saldo);
        Pst.setString(2, lat);
        Pst.setString(3, lng);
        Pst.setInt(4, entr);

        System.out.println(Pst);
        Pst.executeUpdate();

        return entr;
    }

    public static int subtrairSaldo(int entr, double saldoEntr, double valorEntr) throws SQLException, ModeloException {
        String Query = "UPDATE entregador SET saldo = ? - " + valorEntr + "WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setDouble(1, saldoEntr);
        Pst.setInt(2, entr);

        System.out.println(Pst);
        Pst.executeUpdate();
        ResultSet Rs = Pst.getGeneratedKeys();

        return entr;
    }

    public static int zerarSaldo(int id, double saldo, double total) throws SQLException, ModeloException {

        String Query = "UPDATE entregador SET saldo = ?, totalRecebido = ? +" + total + "WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setDouble(1, 0.0);
        Pst.setDouble(2, saldo);
        Pst.setInt(3, id);

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();
        System.out.println(Pst);

        return id;
    }

    public static int reativaEntr(int id) throws SQLException, ModeloException {

        int Id = 0;
        String Query = "UPDATE entregador SET status = 'Ativo'"
                + "WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, id);

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();
        System.out.println(Pst);

        return Id;
    }
}
