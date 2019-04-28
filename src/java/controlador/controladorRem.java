/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.dao.RemDAO;
import modelo.entidade.Remetente;
import modelo.entidade.Remetente;

/**
 *
 * @author matheus
 */
public class controladorRem {

    public static ArrayList<Remetente> getRems() throws Exception {
        try {
            return RemDAO.getRems();
            
        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }
    
    public static Remetente getRem(int id) throws Exception {
        try {
            Remetente r  = RemDAO.getRem(id);
            return r;
            
        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception();
        }
    }
    
    public static boolean delRem(int id) throws Exception {
        try {
            RemDAO.delRem(id);
            return true;
            
        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception();
        }
    }
    
    
}
