/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.dao.EscalaDAO;
import modelo.entidade.Escala;

/**
 *
 * @author matheus
 */
public class controladorEscala {
    
    public static ArrayList<Escala> getEscalas() throws Exception {
        try {
            return EscalaDAO.getEscalas();
            
        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }  

    
    public static boolean delEscalas(int id) throws Exception {
        try {
            EscalaDAO.delEscala(id);
            return true;
            
        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception();
        }
    }
    
    
}
