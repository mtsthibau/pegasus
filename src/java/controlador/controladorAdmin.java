/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.dao.AdminDAO;
import modelo.entidade.Administrador;

/**
 *
 * @author matheus
 */
public class controladorAdmin {
    
    public static ArrayList<Administrador> getAdmins() throws Exception {
        try {
            return AdminDAO.getAdmins();
            
        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }  
    public static int editAdmin(int id, Administrador Novo) throws SQLException {

        String Query = "UPDATE admin SET nome = ? WHERE id = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);

        Pst.setString(1, Novo.getNome());
        Pst.setInt(2, id);

        Pst.executeUpdate();
        return id;
    }
    
    public static boolean delAdmin(int id) throws Exception {
        try {
            AdminDAO.delAdmin(id);
            return true;
            
        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception();
        }
    }
    
    
}
