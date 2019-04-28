package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.ModeloException;
import modelo.entidade.Remetente;

/**
 *
 * @author matheus
 */
public class RemDAO {

    public static Remetente getRem(int Id) throws SQLException {
        Remetente R = null;

        String Query = "SELECT id, nome, email, senha, docRegistro, telefone, celular, cep, "
                + "logradouro, numero, complemento, bairro, latitude, longitude FROM remetente WHERE id = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, Id);
        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();

        if (Rs.next()) {
            R = new Remetente();
            R.setId(Rs.getInt("id"));
            R.setNome(Rs.getString("nome"));
            R.setEmail(Rs.getString("email"));
            R.setSenha(Rs.getString("senha"));
            R.setCpf(Rs.getString("docRegistro"));
            R.setTelefone(Rs.getString("telefone"));
            R.setCelular(Rs.getString("celular"));
            R.setCep(Rs.getString("cep"));
            R.setLogradouro(Rs.getString("logradouro"));
            R.setNumero(Rs.getString("numero"));
            R.setComplemento(Rs.getString("complemento"));
            R.setBairro(Rs.getString("bairro"));
            R.setLatitude(Rs.getString("latitude"));
            R.setLongitude(Rs.getString("longitude"));
        }

        return R;
    }

    public static ArrayList<Remetente> getRems() throws SQLException {
        ArrayList<Remetente> lstRem = new ArrayList<Remetente>();
        String Query = "SELECT id, nome, email, docRegistro, telefone, celular, cep, endereco, bairro, cidade, estado"
                + " FROM remetente ORDER BY id";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Remetente R = new Remetente();
            R.setId(Rs.getInt("id"));
            R.setNome(Rs.getString("nome"));
            R.setEmail(Rs.getString("email"));
            R.setCpf(Rs.getString("documento"));
            R.setTelefone(Rs.getString("telefone"));
            R.setCelular(Rs.getString("celular"));

            lstRem.add(R);
        }

        return lstRem;
    }

    public static Remetente solTrocaSenha(String email) throws SQLException {
        Remetente R = null;

        String Query = "SELECT id, nome, email FROM remetente WHERE email = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setString(1, email);
        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();

        if (Rs.next()) {
            R = new Remetente();
            R.setId(Rs.getInt("id"));
            R.setNome(Rs.getString("nome"));
            R.setEmail(Rs.getString("email"));
        }

        return R;
    }

    public static int altSenha(String email, String senha, int id) throws SQLException, ModeloException {
        String Query = "UPDATE remetente SET email = ?, senha = ? WHERE id = ?";

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

    public static int insertRem(Remetente Novo) throws SQLException, ModeloException {

        int Id = 0;
        String Query = "INSERT INTO remetente (nome, email, senha, docRegistro, telefone, celular, "
                + "cep, logradouro, numero, complemento, bairro, latitude, longitude, cidade, estado, status) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        String senha = Novo.getSenha();
        String senhaMD5;
        senhaMD5 = userDAO.MD5(senha);

        Pst.setString(1, Novo.getNome());
        Pst.setString(2, Novo.getEmail());
        Pst.setString(3, senhaMD5);
        Pst.setString(4, Novo.getCpf());
        Pst.setString(5, Novo.getTelefone());
        Pst.setString(6, Novo.getCelular());
        Pst.setString(7, Novo.getCep());
        Pst.setString(8, Novo.getLogradouro());
        Pst.setString(9, Novo.getNumero());
        Pst.setString(10, Novo.getComplemento());
        Pst.setString(11, Novo.getBairro());
        Pst.setString(12, Novo.getLatitude());
        Pst.setString(13, Novo.getLongitude());
        Pst.setString(14, "Belo Horizonte");
        Pst.setString(15, "MG");
        Pst.setString(16, "Ativo");

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();
        if (Rs.next()) {
            Id = Rs.getInt(1);
            Novo.setId(Id);
        }
        return Id;
    }

    public static int editRem(Remetente Novo, int id) throws SQLException, ModeloException {

        int Id = 0;
        String Query = "UPDATE remetente set nome=?, email=?, senha=?, docRegistro=?, telefone=?, celular=?, "
                + "cep=?, logradouro=?, numero=?, complemento=?, bairro=?, latitude=?, longitude=? WHERE id =?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        String senha = Novo.getSenha();
        String senhaMD5;
        senhaMD5 = userDAO.MD5(senha);

        Pst.setString(1, Novo.getNome());
        Pst.setString(2, Novo.getEmail());
        Pst.setString(3, senhaMD5);
        Pst.setString(4, Novo.getCpf());
        Pst.setString(5, Novo.getTelefone());
        Pst.setString(6, Novo.getCelular());
        Pst.setString(7, Novo.getCep());
        Pst.setString(8, Novo.getLogradouro());
        Pst.setString(9, Novo.getNumero());
        Pst.setString(10, Novo.getComplemento());
        Pst.setString(11, Novo.getBairro());
        Pst.setString(12, Novo.getLatitude());
        Pst.setString(13, Novo.getLongitude());
        Pst.setInt(14, id);

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();
        if (Rs.next()) {
            Id = Rs.getInt(1);
            Novo.setId(Id);
        }
        return Id;
    }

    public static void delRem(int id) throws SQLException {

        String Query = "UPDATE remetente SET status = 'Desativado' WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, id);
        Pst.executeUpdate();
    }
}
