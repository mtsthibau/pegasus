/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.PostsDAO;
import modelo.entidade.Post;

/**
 *
 * @author matheus
 */
@WebServlet(name = "obterRotaEntr", urlPatterns = {"/views/obterRotaEntr"})
public class ObterRotaEntr extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //capturando parametros via URL
            String acao = request.getParameter("logica");
            String id = request.getParameter("id");
            String idFkEntr = request.getParameter("idFkEntr");

            int idInt = Integer.parseInt(id);
            Post p = PostsDAO.getPost(idInt);

            //mensagem
            request.setAttribute("id", p.getId());
            request.setAttribute("rem", p.getRem());
            request.setAttribute("tipo", p.getTipo());
            request.setAttribute("descricao", p.getDescricao());
            request.setAttribute("peso", p.getPeso());
            request.setAttribute("altura", p.getAltura());
            request.setAttribute("profundidade", p.getProfundidade());
            request.setAttribute("largura", p.getLargura());
            request.setAttribute("urgencia", p.getUrgencia());
            request.setAttribute("periodo", p.getPeriodo());
            request.setAttribute("limite", p.getPeriodo());
            request.setAttribute("destinatario", p.getDestinatario());
            request.setAttribute("telefone", p.getTelefone());
            request.setAttribute("celular", p.getCelular());
            request.setAttribute("email", p.getEmail());
            request.setAttribute("cep", p.getCep());
            request.setAttribute("logradouro", p.getLogradouro());
            request.setAttribute("numero", p.getNumero());
            request.setAttribute("complemento", p.getComplemento());
            request.setAttribute("bairro", p.getBairro());
            request.setAttribute("distancia", p.getDistancia());
            request.setAttribute("latitude", p.getLatitude());
            request.setAttribute("longitude", p.getLongitude());
            request.setAttribute("valorProduto", p.getValorProduto());

            //mensagem
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Retirada realizada com sucesso, finalize a entrega!</div>\n");
            request.getRequestDispatcher("adm-entr-rota-entr.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-entr-minh.jsp").forward(request, response);
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ObterRotaEntr.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ObterRotaEntr.class.getName()).log(Level.SEVERE, null, ex);
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
