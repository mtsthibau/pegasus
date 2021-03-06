/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ModeloException;
import modelo.dao.EntrDAO;

/**
 *
 * @author matheus
 */
@WebServlet(name = "avalEntrConf", urlPatterns = {"/public/avalEntrConf"})
public class avalEntrConf extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ModeloException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            String id = request.getParameter("id");
//            String idEntrega = request.getParameter("idEntrega");
            String nota = request.getParameter("nota");
            String notaAc = request.getParameter("notaAc");
            String numeroVotos = request.getParameter("numeroVotos");
            int intNota = Integer.parseInt(nota);
            int intId = Integer.parseInt(id);
//            int intEntrega = Integer.parseInt(idEntrega);
            int intNotaAc = Integer.parseInt(notaAc);
            int intNumeroVotos = Integer.parseInt(numeroVotos);

            EntrDAO.avalEntregador(intId, intNota, intNotaAc, intNumeroVotos);

            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'> Avaliação realizada com sucesso</div>\n");
            request.getRequestDispatcher("content-ranking.jsp").forward(request, response);

        } catch (ServletException | IOException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("content-ranking.jsp").forward(request, response);
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
        } catch (ModeloException ex) {
            Logger.getLogger(avalEntrConf.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ModeloException ex) {
            Logger.getLogger(avalEntrConf.class.getName()).log(Level.SEVERE, null, ex);
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
