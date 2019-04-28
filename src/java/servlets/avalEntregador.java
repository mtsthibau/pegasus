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
import modelo.dao.AdminDAO;
import modelo.dao.EntrDAO;
import modelo.dao.PostsDAO;
import modelo.entidade.Administrador;
import modelo.entidade.Entregador;
import modelo.entidade.Post;

/**
 *
 * @author matheus
 */
@WebServlet(name = "avalEntregador", urlPatterns = {"/public/avalEntregador"})
public class avalEntregador extends HttpServlet {

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
        try {

            String id = request.getParameter("420hAshcOdebtqQdmS420");
            int idInt = Integer.parseInt(id);

            Post p = PostsDAO.getPost(idInt);
            Entregador e = EntrDAO.getEntregador(p.getIdFkEntr());

            request.setAttribute("destinatario", p.getDestinatario());
            request.setAttribute("telefoneDest", p.getTelefone());
            request.setAttribute("celularDest", p.getCelular());
            request.setAttribute("emailDest", p.getEmail());
            request.setAttribute("dataFinal", p.getDataFinal());
            request.setAttribute("entrega", id);
            double nota = e.getNota();
            double numVotos = e.getNumeroVotos();
            double notaFormat;

            if (nota == 0) {
                notaFormat = 0;
            } else {
                notaFormat = nota / numVotos;
            }

            notaFormat = Math.floor(notaFormat * 100) / 100;

            request.setAttribute("entregador", e.getId());
            request.setAttribute("nome", e.getNome());
            request.setAttribute("email", e.getEmail());
            request.setAttribute("telefone", e.getTelefone());
            request.setAttribute("nota", e.getNota());
            request.setAttribute("numeroVotos", e.getNumeroVotos());
            request.setAttribute("notaFormat", notaFormat);
            request.getRequestDispatcher("content-avaliar-entr.jsp").forward(request, response);

        } catch (ServletException | IOException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("content-avaliar-entr.jsp").forward(request, response);
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
            Logger.getLogger(avalEntregador.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(avalEntregador.class.getName()).log(Level.SEVERE, null, ex);
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
