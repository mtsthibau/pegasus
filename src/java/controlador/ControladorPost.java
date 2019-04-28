/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import modelo.dao.PostsDAO;
import modelo.entidade.Post;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.dao.EscalaDAO;
import modelo.dao.RemDAO;
import modelo.entidade.Escala;

/**
 *
 * @author matheus
 */
public class ControladorPost {

    public static ArrayList<Post> getPosts() throws Exception {
        try {
            return PostsDAO.getPosts();

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }
    
    public static ArrayList<Post> getPostsRem(int remetente) throws Exception {
        try {
            return PostsDAO.getPostsRem(remetente);

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }
    
    public static ArrayList<Post> getPostsOpen() throws Exception {
        try {
            return PostsDAO.getPostsOpen();

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }
    
     public static ArrayList<Post> getPostsAgEntr() throws Exception {
        try {
            return PostsDAO.getPostsAgEntr();

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }
     
    public static ArrayList<Post> getMyPosts(int Id) throws Exception {
        try {
            return PostsDAO.getMyPosts(Id);

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }

    public static ArrayList<Post> getPostsTransito(int idFkRem) throws Exception {
        try {
            return PostsDAO.getPostsTransito(idFkRem);

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");

        } finally {
        }
    }

    public static ArrayList<Post> getPostsOK() throws Exception {
        try {
            return PostsDAO.getPostsOK();

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }

    public static ArrayList<Post> getMyPostsOK(int id) throws Exception {
        try {
            return PostsDAO.getMyPostsOK(id);

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Erro no Banco de Dados");
        }
    }

    public static boolean delPosts(int id) throws Exception {
        try {
            PostsDAO.delPost(id);
            return true;

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception();
        }
    }

    public static Post getPost(int id) throws Exception {
        try {
            return PostsDAO.getPost(id);

        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception();
        }
    }

    public static double gmapsGetDistance(String endereco, String bairro) {
        //todo pegar idRem
        RemDAO rem = new RemDAO();
//        Remetente r = rem.getRem(idRem);
//        String latRem = r.getLatitude();
//        String lonRem = r.getLongitude();
        //todo consultar distancia entre dois pontos gmaps

        double distancia = 0;
        return distancia;
    }

    public static Escala setBandeirada(double peso) throws SQLException {

        EscalaDAO escala = new EscalaDAO();
        ArrayList<Escala> es = escala.getEscalas();

        for (Escala e : es) {
            double min = e.getPsoMin();
            double max = e.getPesoMax();
            if (peso >= min && peso <= max) {
                Escala E = new Escala();
                E.setPreco(e.getPreco());
                E.setTipo(e.getTipo());
                return E;
            }
        }
        return null;
    }
}
