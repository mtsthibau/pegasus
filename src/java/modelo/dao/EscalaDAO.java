package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.ModeloException;
import modelo.entidade.Escala;

/**
 *
 * @author matheus
 */
public class EscalaDAO {

    public static Escala getEscala(int Id) throws SQLException {
        Escala E = null;

        String Query = "SELECT id, tipo, pesoMax, pesoMin, preco FROM escalapeso WHERE id = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, Id);
        ResultSet Rs = Pst.executeQuery();
        if (Rs.next()) {
            E = new Escala();
            E.setId(Rs.getInt("id"));
            E.setTipo(Rs.getString("tipo"));
            E.setPesoMax(Rs.getDouble("pesoMax"));
            E.setPsoMin(Rs.getDouble("pesoMin"));
            E.setPreco(Rs.getDouble("preco"));
        }
        return E;
    }

    public static ArrayList<Escala> getEscalas() throws SQLException {
        ArrayList<Escala> lst = new ArrayList<Escala>();
        String Query = "SELECT id, tipo, pesoMax, pesoMin, preco FROM escalapeso ORDER BY id";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Escala E = new Escala();
            E.setId(Rs.getInt("id"));
            E.setTipo(Rs.getString("tipo"));
            E.setPesoMax(Rs.getDouble("pesoMax"));
            E.setPsoMin(Rs.getDouble("pesoMin"));
            E.setPreco(Rs.getDouble("preco"));

            lst.add(E);
        }

        return lst;
    }

    public static int insertEscala(Escala Novo) throws SQLException, ModeloException {

        int Id = 0;
        String Query = "INSERT INTO escalapeso (tipo, pesoMax, pesoMin, preco) values(?,?,?,?);";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setString(1, Novo.getTipo());
        Pst.setDouble(2, Novo.getPesoMax());
        Pst.setDouble(3, Novo.getPsoMin());
        Pst.setDouble(4, Novo.getPreco());

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();
        if (Rs.next()) {
            Id = Rs.getInt(1);
            Novo.setId(Id);
        }
        return Id;
    }

    public static int editEscala(Escala Novo, int id) throws SQLException, ModeloException {

        int Id=0;
        String Query = "UPDATE escalapeso SET tipo = ?, pesoMax = ?, pesoMin = ?, preco = ? WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setString(1, Novo.getTipo());
        Pst.setDouble(2, Novo.getPesoMax());
        Pst.setDouble(3, Novo.getPsoMin());
        Pst.setDouble(4, Novo.getPreco());
        Pst.setInt(5, id);

        System.out.println(Pst);
        Pst.executeUpdate();

        ResultSet Rs = Pst.getGeneratedKeys();
        System.out.println(Pst);

       return Id;
    }

    public static void delEscala(int id) throws SQLException {
        String Query = "DELETE FROM escalapeso WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, id);
        Pst.executeUpdate();
    }

    public static String getTipoPeso(double min, double max) throws SQLException {
        int Quantos = 0;
        String Query = " SELECT tipo FROM escalapeso";
        ResultSet Rs = BaseDados.getInstancia().executeQuery(Query);

        return "tipo - ";
    }

}
