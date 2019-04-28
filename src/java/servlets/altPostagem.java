/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controlador.ControladorPost;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ModeloException;
import modelo.dao.ParamDao;
import modelo.dao.PostsDAO;
import modelo.entidade.Escala;
import modelo.entidade.Parametro;
import modelo.entidade.Post;

/**
 *
 * @author matheus
 */
@WebServlet(name = "altPostagem", urlPatterns = {"/views/altPostagem"})
public class altPostagem extends HttpServlet {

//cache  
    double taxaValorProd;
    double precoKM;
    double valorUrgen;
    double taxa;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ModeloException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            //capturando parametros via URL
            String acao = request.getParameter("logica");

            String id = request.getParameter("id");
            String idRem = request.getParameter("idRem");
            String descricao = request.getParameter("descricao");
            String peso = request.getParameter("peso");
            String altura = request.getParameter("altura");
            String profundidade = request.getParameter("profundidade");
            String largura = request.getParameter("largura");
            String valorProduto = request.getParameter("valorProduto");
            String urgencia = request.getParameter("urgencia");
            String periodo = request.getParameter("periodo");
            String destinatario = request.getParameter("destinatario");
            String telefone = request.getParameter("telefone");
            String celular = request.getParameter("celular");
            String email = request.getParameter("email");
            String cep = request.getParameter("cep");
            String logradouro = request.getParameter("logradouro");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");
            String distancia = request.getParameter("distancia");

            if (!"".equals(peso) && !"".equals(altura) && !"".equals(profundidade) && !"".equals(largura)
                    && !"".equals(destinatario) && !"".equals(periodo) && !"".equals(urgencia) && !"".equals(largura)
                    && !"".equals(celular) && !"".equals(email) && !"".equals(cep) && !"".equals(logradouro)
                    && !"".equals(numero) && !"".equals(bairro) && !"".equals(distancia)
                    && !"".equals(latitude) && !"".equals(longitude)) {

                // Conversões
                double doubPeso = Double.parseDouble(peso);
                double doubAlt = Double.parseDouble(altura);
                double doubProf = Double.parseDouble(profundidade);
                double doubLarg = Double.parseDouble(largura);
                double doubDistancia = Double.parseDouble(distancia);
                double doubLat = Double.parseDouble(latitude);
                double doubLong = Double.parseDouble(longitude);
                int idIntRem = Integer.parseInt(idRem);

                //DAO INIT
                PostsDAO post = new PostsDAO();

                Post P = new Post();
                P.setDescricao(descricao);
                P.setPeso(doubPeso);
                P.setAltura(doubAlt);
                P.setProfundidade(doubProf);
                P.setLargura(doubLarg);
                P.setUrgencia(urgencia);
                P.setPeriodo(periodo);
                P.setDestinatario(destinatario);
                P.setTelefone(telefone);
                P.setCelular(celular);
                P.setEmail(email);
                P.setCep(cep);
                P.setLogradouro(logradouro);
                P.setNumero(numero);
                P.setComplemento(complemento);
                P.setBairro(bairro);
                P.setLatitude(doubLat);
                P.setLongitude(doubLong);
                P.setDistancia(distancia);
                P.setIdFkEntr(idIntRem);

                //todo BUSCA QUAL TABELA DE PREÇO ADEQUADA AO PESO DA ENTREGA
                Escala esc = ControladorPost.setBandeirada(doubPeso);

                if (esc == null) {
                    //mensagem 
                    request.setAttribute("id", id);
                    request.setAttribute("descricao", descricao);
                    request.setAttribute("peso", peso);
                    request.setAttribute("altura", altura);
                    request.setAttribute("profundidade", profundidade);
                    request.setAttribute("largura", largura);
                    request.setAttribute("urgencia", urgencia);
                    request.setAttribute("periodo", periodo);
                    request.setAttribute("destinatario", destinatario);
                    request.setAttribute("telefone", telefone);
                    request.setAttribute("celular", celular);
                    request.setAttribute("email", email);
                    request.setAttribute("cep", cep);
                    request.setAttribute("logradouro", logradouro);
                    request.setAttribute("numero", numero);
                    request.setAttribute("complemento", complemento);
                    request.setAttribute("bairro", bairro);
                    request.setAttribute("distancia", distancia);
                    request.setAttribute("latitude", latitude);
                    request.setAttribute("longitude", longitude);
                    request.setAttribute("valorProduto", valorProduto);
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Digite um peso válido.</div>\n");
                    request.getRequestDispatcher("adm-rem-post-edit.jsp").forward(request, response);
                }
                 double bandeirada = esc.getPreco();
                
                //OBTEM VARIÁVEIS DE AMBIENTE PARA CALCULO
                ArrayList<Parametro> params = ParamDao.getParams();
                for (Parametro par : params) {
                    if (par.getId() == 1) {
                        taxaValorProd = par.getValor();
                    }
                    if (par.getId() == 2) {
                        precoKM = par.getValor();
                    }
                    if (par.getId() == 3) {
                        valorUrgen = par.getValor();
                    }
                }
                //Calculo de valor total da entrega
                double total = bandeirada;
                doubDistancia = doubDistancia / 1000;

                total += doubDistancia * precoKM;

                if (!"".equals(valorProduto)) {
                    double doubValorProdu = Double.parseDouble(valorProduto);
                    P.setValorProduto(doubValorProdu);
                    taxa = doubValorProdu / 100.0 * taxaValorProd;
                    total += taxa;
                }
                if (urgencia.equals("S")) {
                    total += valorUrgen;
                }
                total = Math.floor(total * 100) / 100;

                P.setValorTotal(total);
                P.setTipo(esc.getTipo());
                
                int idInt = Integer.parseInt(id);
                //inicializando persistencia
                PostsDAO.editPost(P, idInt);

                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Postagem alterada com sucesso</div>\n");
                request.getRequestDispatcher("adm-rem-post.jsp").forward(request, response);

            } else {
                request.setAttribute("id", id);
                request.setAttribute("descricao", descricao);
                request.setAttribute("peso", peso);
                request.setAttribute("altura", altura);
                request.setAttribute("profundidade", profundidade);
                request.setAttribute("largura", largura);
                request.setAttribute("urgencia", urgencia);
                request.setAttribute("periodo", periodo);
                request.setAttribute("destinatario", destinatario);
                request.setAttribute("telefone", telefone);
                request.setAttribute("celular", celular);
                request.setAttribute("email", email);
                request.setAttribute("cep", cep);
                request.setAttribute("logradouro", logradouro);
                request.setAttribute("numero", numero);
                request.setAttribute("complemento", complemento);
                request.setAttribute("bairro", bairro);
                request.setAttribute("distancia", distancia);
                request.setAttribute("latitude", latitude);
                request.setAttribute("longitude", longitude);
                request.setAttribute("valorProduto", valorProduto);

                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Preencha todos os campos obrigatórios</div>\n");
                request.getRequestDispatcher("adm-rem-post-edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-admin-admin.jsp").forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);

            } catch (ModeloException ex) {
                Logger.getLogger(cadPostagem.class
                        .getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(cadPostagem.class
                        .getName()).log(Level.SEVERE, null, ex);
            }

        } catch (ParseException ex) {
            Logger.getLogger(cadPostagem.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);

            } catch (ModeloException ex) {
                Logger.getLogger(cadPostagem.class
                        .getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(cadPostagem.class
                        .getName()).log(Level.SEVERE, null, ex);
            }

        } catch (ParseException ex) {
            Logger.getLogger(cadPostagem.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
