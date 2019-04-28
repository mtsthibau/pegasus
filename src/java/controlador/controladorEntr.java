/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.BaseDados;
import modelo.dao.EntrDAO;
import modelo.entidade.Entregador;

/**
 *
 * @author matheus
 */
public class controladorEntr {

    public static ArrayList<Entregador> getEntredadores() throws Exception {
        try {
            return EntrDAO.getEntregadores();

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }
    
    public static ArrayList<Entregador> getRanking() throws Exception {
        try {
            return EntrDAO.getRanking();

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }

    public static Entregador getEntr(int id) throws Exception {
        Entregador entr = EntrDAO.getEntregador(id);
        return entr;
    }

}
