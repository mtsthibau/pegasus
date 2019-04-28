package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.ModeloException;
import modelo.entidade.Administrador;

/**
 *
 * @author matheus
 */
public class AdminDAO {

    public static Administrador getAdmin(int Id) throws SQLException {
        Administrador A = null;

        String Query = "SELECT id, nome, email, senha, celular FROM admin WHERE id = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, Id);
        ResultSet Rs = Pst.executeQuery();
        if (Rs.next()) {
            A = new Administrador();
            A.setId(Rs.getInt("id"));
            A.setNome(Rs.getString("nome"));
            A.setEmail(Rs.getString("email"));
            A.setCelular(Rs.getString("celular"));
        }
        return A;
    }

    public static ArrayList<Administrador> getAdmins() throws SQLException {
        ArrayList<Administrador> lstAdmin = new ArrayList<Administrador>();
        String Query = "SELECT id, nome, email, celular FROM admin";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Administrador A = new Administrador();
            A.setId(Rs.getInt("id"));
            A.setNome(Rs.getString("nome"));
            A.setEmail(Rs.getString("email"));
            A.setCelular(Rs.getString("celular"));

            lstAdmin.add(A);
        }

        return lstAdmin;
    }

    public static Administrador solTrocaSenha(String email) throws SQLException {
        Administrador A = null;

        String Query = "SELECT id, nome, email FROM admin WHERE email = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setString(1, email);
        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();

        if (Rs.next()) {
            A = new Administrador();
            A.setId(Rs.getInt("id"));
            A.setNome(Rs.getString("nome"));
            A.setEmail(Rs.getString("email"));
        }

        return A;
    }

    public static int altSenha(String email, String senha, int id) throws SQLException, ModeloException {
        String Query = "UPDATE admin SET email = ?, senha = ? WHERE id = ?";

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

    public static int insertAdmin(Administrador Novo) throws SQLException, ModeloException {
        int Id = 0;
        String Query = "INSERT INTO admin (nome, email, senha, celular) values(?,?,?,?);";

        String senhaMD5 = userDAO.MD5(Novo.getSenha());

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);
        Pst.setString(1, Novo.getNome());
        Pst.setString(2, Novo.getEmail());
        Pst.setString(3, senhaMD5);
        Pst.setString(4, Novo.getCelular());

        Pst.executeUpdate();
        System.out.println(Pst);

        ResultSet Rs = Pst.getGeneratedKeys();
        if (Rs.next()) {
            Id = Rs.getInt(1);
            Novo.setId(Id);
        }
        return Id;
    }

    public static int editAdmin(int id, Administrador Novo) throws SQLException {

        String Query = "UPDATE admin SET nome = ?, "
                + "senha = ?, celular = ?, email=? WHERE id = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        String senhaMD5 = userDAO.MD5(Novo.getSenha());

        Pst.setString(1, Novo.getNome());
        Pst.setString(2, senhaMD5);
        Pst.setString(3, Novo.getCelular());
        Pst.setString(4, Novo.getEmail());
        Pst.setInt(5, id);

        Pst.executeUpdate();
        return id;
    }

    public static void delAdmin(int id) throws SQLException {
        String Query = "DELETE FROM admin WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, id);
        Pst.executeUpdate();
    }
}
