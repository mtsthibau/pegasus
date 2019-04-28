/*
 * To change this template, choose Tools | Templates
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
import modelo.entidade.Post;

/**
 *
 * @author matheus
 */
public class PostsDAO {

    public static int insertPost(Post Novo) throws SQLException, ModeloException, ParseException {

        String Query = "INSERT INTO postagem "
                + "(idFkRemetente, dataCadastro, tipoPost, valorProd, descricao, peso, altura, "
                + "profundidade, largura, postUrgente, periodoPost, nomeDest, telefoneDest, celularDest"
                + ", emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino, estadoDestino, latitude, longitude, distancia,"
                + "  valorTotal, statusPost, cidadeDestino) "
                + "values(?,CURRENT_TIMESTAMP,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        String status = "Aguardando Pagamento"; //sempre

        Pst.setInt(1, Novo.getIdFkEntr());
        Pst.setString(2, Novo.getTipo());
        Pst.setDouble(3, Novo.getValorProduto());
        Pst.setString(4, Novo.getDescricao());
        Pst.setDouble(5, Novo.getPeso());
        Pst.setDouble(6, Novo.getAltura());
        Pst.setDouble(7, Novo.getProfundidade());
        Pst.setDouble(8, Novo.getLargura());
        Pst.setString(9, Novo.getUrgencia());
        Pst.setString(10, Novo.getPeriodo());
        Pst.setString(11, Novo.getDestinatario());
        Pst.setString(12, Novo.getTelefone());
        Pst.setString(13, Novo.getCelular());
        Pst.setString(14, Novo.getEmail());
        Pst.setString(15, Novo.getCep());
        Pst.setString(16, Novo.getLogradouro());
        Pst.setString(17, Novo.getNumero());
        Pst.setString(18, Novo.getComplemento());
        Pst.setString(19, Novo.getBairro());
        Pst.setString(20, "MG");
        Pst.setDouble(21, Novo.getLatitude());
        Pst.setDouble(22, Novo.getLongitude());
        Pst.setString(23, Novo.getDistancia());
        Pst.setDouble(24, Novo.getValorTotal());
        Pst.setString(25, status);
        Pst.setString(26, "Belo Horizonte");

        System.out.println("PST -" + Pst);
        Pst.executeUpdate();

        return Novo.getId();
    }

    public static int editPost(Post Novo, int id) throws SQLException, ModeloException, ParseException {

        String Query = "UPDATE postagem SET "
                + "tipoPost=?, descricao=?, peso=?, altura=?, "
                + "profundidade=?, largura=?, postUrgente=?, periodoPost=?, nomeDest=?, telefoneDest=?, celularDest=?"
                + ", emailDest=?, cepDest=?, logradouroDestino=?, numero=?, complemento=?, bairroDestino=?, cidadeDestino=?, estadoDestino=?,  "
                + "distancia=?, statusPost=?, latitude = ?, longitude = ?, valorTotal=?, valorProd = ? WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        String status = "Aguardando Pagamento";
        String cidade = "Belo Horizonte";
        String estado = "MG";

        Pst.setString(1, Novo.getTipo());
        Pst.setString(2, Novo.getDescricao());
        Pst.setDouble(3, Novo.getPeso());
        Pst.setDouble(4, Novo.getAltura());
        Pst.setDouble(5, Novo.getProfundidade());
        Pst.setDouble(6, Novo.getLargura());
        Pst.setString(7, Novo.getUrgencia());
        Pst.setString(8, Novo.getPeriodo());
        Pst.setString(9, Novo.getDestinatario());
        Pst.setString(10, Novo.getTelefone());
        Pst.setString(11, Novo.getCelular());
        Pst.setString(12, Novo.getEmail());
        Pst.setString(13, Novo.getCep());
        Pst.setString(14, Novo.getLogradouro());
        Pst.setString(15, Novo.getNumero());
        Pst.setString(16, Novo.getComplemento());
        Pst.setString(17, Novo.getBairro());
        Pst.setString(18, cidade);
        Pst.setString(19, estado);
        Pst.setString(20, Novo.getDistancia());
        Pst.setString(21, status);
        Pst.setDouble(22, Novo.getLatitude());
        Pst.setDouble(23, Novo.getLongitude());
        Pst.setDouble(24, Novo.getValorTotal());
        Pst.setDouble(25, Novo.getValorProduto());
        Pst.setInt(26, id);

        System.out.println("PST -" + Pst);
        Pst.executeUpdate();

        return id;
    }

    public static int retirarEntr(Post Novo, int id) throws SQLException, ModeloException {

        String Query = "UPDATE postagem SET "
                + "rgRetirada=?, responsavelRetirada=?, dataRetirada=CURRENT_TIMESTAMP, statusPost=? WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        String status = "Aguardando Entrega";

        Pst.setString(1, Novo.getRgRetirada());
        Pst.setString(2, Novo.getResponsavelRetirada());
        Pst.setString(3, status);
        Pst.setInt(4, id);

        ResultSet Rs = Pst.getGeneratedKeys();
        System.out.println("PST -" + Pst);

        Pst.executeUpdate();
        return id;
    }

    public static int finalizarEntr(Post Novo, int id) throws SQLException, ModeloException {

        String Query = "UPDATE postagem SET "
                + "rgRecebedor=?, recebedor=?, dataFinal=CURRENT_TIMESTAMP, statusPost=? WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        String status = "Finalizado";

        Pst.setString(1, Novo.getRgRecebedor());
        Pst.setString(2, Novo.getRecebedor());
        Pst.setString(3, status);
        Pst.setInt(4, id);

        System.out.println("PST -" + Pst);

        Pst.executeUpdate();
        return id;
    }

    public static Post getPost(int Id) throws SQLException {

        Post P = null;
        String Query = " SELECT id, idFKRemetente, idFkEntregador, dataCadastro, descricao, peso, altura,"
                + " profundidade, largura, postUrgente, periodoPost, nomeDest, telefoneDest, celularDest, "
                + "emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino, distancia, "
                + "latitude, longitude, valorTotal, valorProd FROM postagem WHERE id = ?;";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, Id);
        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();

        if (Rs.next()) {
            P = new Post();
            P.setId(Id);
            P.setRem(Rs.getInt("idFKRemetente"));
            P.setIdFkEntr(Rs.getInt("idFKEntregador"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));
            P.setLatitude(Rs.getDouble("latitude"));
            P.setLongitude(Rs.getDouble("longitude"));
            P.setDistancia(Rs.getString("distancia"));
            P.setValorTotal(Rs.getDouble("valorTotal"));
            P.setValorProduto(Rs.getDouble("valorProd"));
        }

        return P;
    }

    public static void delPost(int id) throws SQLException {
        String Query = "DELETE FROM postagem WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, id);
        Pst.executeUpdate();

    }

    public static ArrayList<Post> getPosts() throws SQLException {

        ArrayList<Post> lstPost = new ArrayList<Post>();
        String Query = " SELECT id, idFkEntregador, tipoPost, dataCadastro, descricao, peso, altura, profundidade, "
                + "largura, postUrgente, periodoPost, nomeDest, telefoneDest, celularDest, "
                + "emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino, statusPost, valorTOtal  "
                + " FROM postagem WHERE statusPost = 'Aguardando Pagamento' ORDER BY id ";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        System.out.println(Rs);

        while (Rs.next()) {
            Post P = new Post();
            P.setId(Rs.getInt("id"));
            P.setIdFkEntr(Rs.getInt("idFkEntregador"));
            P.setTipo(Rs.getString("tipoPost"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));
            P.setStatus(Rs.getString("statusPost"));
            P.setValorTotal(Rs.getDouble("valorTotal"));

            lstPost.add(P);
        }

        return lstPost;
    }

    public static ArrayList<Post> getPostsRem(int remetente) throws SQLException {

        ArrayList<Post> lstPost = new ArrayList<Post>();
        String Query = " SELECT id, idFkEntregador, tipoPost, dataCadastro, descricao, peso, altura, profundidade, "
                + "largura, postUrgente, periodoPost, nomeDest, telefoneDest, celularDest, "
                + "emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino, statusPost, valorTOtal  "
                + " FROM postagem WHERE statusPost = 'Aguardando Pagamento' AND idFkRemetente = ?";


        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, remetente);
        ResultSet Rs = Pst.executeQuery();

        System.out.println(Rs);

        while (Rs.next()) {
            Post P = new Post();
            P.setId(Rs.getInt("id"));
            P.setIdFkEntr(Rs.getInt("idFkEntregador"));
            P.setTipo(Rs.getString("tipoPost"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));
            P.setStatus(Rs.getString("statusPost"));
            P.setValorTotal(Rs.getDouble("valorTotal"));

            lstPost.add(P);
        }

        return lstPost;
    }

    public static ArrayList<Post> getPostsOpen() throws SQLException {

        ArrayList<Post> lstPost = new ArrayList<Post>();
        String Query = " SELECT id, idFkEntregador, tipoPost, dataCadastro, descricao, peso, altura, profundidade, "
                + "largura, postUrgente, periodoPost, nomeDest, telefoneDest, celularDest, "
                + "emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino, statusPost, valorTotal  "
                + " FROM postagem WHERE statusPost <> 'Finalizado'";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        System.out.println(Rs);

        while (Rs.next()) {
            Post P = new Post();
            P.setId(Rs.getInt("id"));
            P.setIdFkEntr(Rs.getInt("idFkEntregador"));
            P.setTipo(Rs.getString("tipoPost"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));
            P.setStatus(Rs.getString("statusPost"));
            P.setValorTotal(Rs.getDouble("valorTotal"));

            lstPost.add(P);
        }

        return lstPost;
    }

    public static ArrayList<Post> getPostsAgEntr() throws SQLException {

        ArrayList<Post> lstPost = new ArrayList<Post>();
        String Query = " SELECT id, idFkEntregador, tipoPost, dataCadastro, descricao, peso, altura, profundidade, "
                + "largura, postUrgente, periodoPost, nomeDest, telefoneDest, celularDest, "
                + "emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino, statusPost, valorTotal  "
                + " FROM postagem WHERE statusPost = 'Aguardando Entregador'";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        System.out.println(Rs);

        while (Rs.next()) {
            Post P = new Post();
            P.setId(Rs.getInt("id"));
            P.setIdFkEntr(Rs.getInt("idFkEntregador"));
            P.setTipo(Rs.getString("tipoPost"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));
            P.setStatus(Rs.getString("statusPost"));
            P.setValorTotal(Rs.getDouble("valorTotal"));

            lstPost.add(P);
        }

        return lstPost;
    }

    public static ArrayList<Post> getPostsOK() throws SQLException {
        ArrayList<Post> lstPost = new ArrayList<Post>();
        String Query = " SELECT id, tipoPost, dataCadastro, descricao, peso, altura, profundidade, largura, postUrgente, periodoPost"
                + ", nomeDest, telefoneDest, celularDest, emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino, valorTotal, "
                + "latitude, longitude"
                + " FROM postagem WHERE statusPost = 'Finalizado' ORDER BY id ";
        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Post P = new Post();
            P.setId(Rs.getInt("id"));
            P.setTipo(Rs.getString("tipoPost"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));
            P.setValorTotal(Rs.getDouble("valorTotal"));
            P.setLatitude(Rs.getDouble("latitude"));
            P.setLongitude(Rs.getDouble("longitude"));

            lstPost.add(P);
        }

        return lstPost;
    }

    public static ArrayList<Post> getMyPostsOK(int id) throws SQLException {

        ArrayList<Post> lstPost = new ArrayList<Post>();
        String Query = " SELECT id, tipoPost, dataCadastro, descricao, peso, altura, profundidade, largura, postUrgente, periodoPost"
                + ", statusPost, nomeDest, telefoneDest, celularDest, emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino,"
                + " valorTotal, dataFinal"
                + " FROM postagem WHERE statusPost = 'Finalizado' and idFKEntregador = ? ORDER BY id ";
        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, id);
        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Post P = new Post();
            P.setId(Rs.getInt("id"));
            P.setTipo(Rs.getString("tipoPost"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setStatus(Rs.getString("statusPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));
            P.setValorTotal(Rs.getDouble("valorTotal"));
            P.setDataFinal(Rs.getString("dataFinal"));

            lstPost.add(P);
        }
        return lstPost;
    }

    public static ArrayList<Post> getPostsTransito(int idFkRem) throws SQLException {

        ArrayList<Post> lstPost = new ArrayList<Post>();
        String Query = "SELECT id, idFKEntregador, idFkRemetente, tipoPost, dataCadastro, descricao, peso, altura, profundidade, largura, postUrgente, periodoPost"
                + ", nomeDest, telefoneDest, celularDest, emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino"
                + " FROM postagem WHERE statusPost <> 'Finalizado' AND statusPost <> 'Aguardando Pagamento' AND statusPost <> 'Aguardando Entregador' AND idFkRemetente = ?";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, idFkRem);
        System.out.println(Pst);

        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Post P = new Post();
            P.setId(Rs.getInt("id"));
            P.setIdFkEntr(Rs.getInt("idFkEntregador"));
            P.setRem(Rs.getInt("idFkRemetente"));
            P.setTipo(Rs.getString("tipoPost"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));

            lstPost.add(P);
        }

        return lstPost;
    }

    public static ArrayList<Post> getMyPosts(int Id) throws SQLException {

        ArrayList<Post> lstPost = new ArrayList<Post>();
        String Query = " SELECT id, tipoPost, dataCadastro, descricao, peso, altura, profundidade, "
                + "largura, postUrgente, periodoPost, statusPost, nomeDest, telefoneDest, celularDest, "
                + "emailDest, cepDest, logradouroDestino, numero, complemento, bairroDestino  "
                + " FROM postagem WHERE idFkEntregador = ? AND statusPost <> 'Finalizado' AND statusPost <> 'Aguardando Entregador' AND statusPost <> 'Aguardando Pagamento'";

        PreparedStatement Pst = BaseDados.getInstancia().prepareStatement(Query);
        Pst.setInt(1, Id);
        System.out.println(Pst);
        ResultSet Rs = Pst.executeQuery();

        while (Rs.next()) {
            Post P = new Post();
            P.setId(Rs.getInt("id"));
            P.setTipo(Rs.getString("tipoPost"));
            P.setData(Rs.getDate("dataCadastro"));
            P.setDescricao(Rs.getString("descricao"));
            P.setPeso(Rs.getDouble("peso"));
            P.setAltura(Rs.getDouble("altura"));
            P.setProfundidade(Rs.getDouble("profundidade"));
            P.setLargura(Rs.getDouble("largura"));
            P.setUrgencia(Rs.getString("postUrgente"));
            P.setPeriodo(Rs.getString("periodoPost"));
            P.setStatus(Rs.getString("statusPost"));
            P.setDestinatario(Rs.getString("nomeDest"));
            P.setTelefone(Rs.getString("telefoneDest"));
            P.setCelular(Rs.getString("celularDest"));
            P.setEmail(Rs.getString("emailDest"));
            P.setCep(Rs.getString("cepDest"));
            P.setLogradouro(Rs.getString("logradouroDestino"));
            P.setNumero(Rs.getString("numero"));
            P.setComplemento(Rs.getString("complemento"));
            P.setBairro(Rs.getString("bairroDestino"));

            lstPost.add(P);
        }

        return lstPost;
    }

    public static int getAvaliacoes() throws SQLException {

        int Quantos = 0;
        String Query = " SELECT count(id) FROM postagem WHERE statusPost = 'Finalizado'";
        ResultSet Rs = BaseDados.getInstancia().executeQuery(Query);
        if (Rs.next()) {
            Quantos = Rs.getInt(1);
        }
        return Quantos;
    }

    public static int pagarEntrega(int id) throws SQLException, ModeloException {

        String Query = "UPDATE postagem SET statusPost = 'Aguardando Entregador' WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);
        Pst.setInt(1, id);

        System.out.println(Pst);
        Pst.executeUpdate();
        return id;
    }

    public static int aceitarEntr(int id, int idFKEntr) throws SQLException, ModeloException {

        String Query = "UPDATE postagem SET statusPost = 'Aguardando Coleta', idFKEntregador = ?"
                + ", dataVinculo = CURRENT_TIMESTAMP WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, idFKEntr);
        Pst.setInt(2, id);

        System.out.println(Pst);
        Pst.executeUpdate();
        return id;
    }

    public static int iniciarColeta(int id) throws SQLException, ModeloException {

        String Query = "UPDATE postagem SET statusPost = 'Coleta Iniciada' WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);
        Pst.setInt(1, id);

        System.out.println(Pst);
        Pst.executeUpdate();
        return id;
    }

    public static int iniciarEntrega(int id) throws SQLException, ModeloException {

        String Query = "UPDATE postagem SET statusPost = 'Entrega Iniciada' WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);
        Pst.setInt(1, id);

        System.out.println(Pst);
        Pst.executeUpdate();
        return id;
    }

    public static int devolverEntrega(int id) throws SQLException, ModeloException {

        String Query = "UPDATE postagem SET statusPost = 'Aguardando Entregador' WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);

        Pst.setInt(1, id);

        System.out.println(Pst);
        Pst.executeUpdate();

        return id;
    }
    
      public static int informRecebimento(int id) throws SQLException, ModeloException {

        String Query = "UPDATE postagem SET statusPost = 'Aguardando Entregador' WHERE id = ?";

        Connection Con = BaseDados.getInstancia().getConnection();
        PreparedStatement Pst = Con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);
        Pst.setInt(1, id);

        System.out.println(Pst);
        Pst.executeUpdate();
        return id;
    }

    //    TODO METODO PARA BUSCAR ENTREGAS EM EXECUÇÃO
}
