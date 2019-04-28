/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ModeloException;
import modelo.dao.ParamDao;

/**
 *
 * @author matheus
 */
@WebServlet(name = "admParametros", urlPatterns = {"/views/admParametros"})
public class admParametros extends HttpServlet {

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
            throws ServletException, IOException, ModeloException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String id = request.getParameter("id");
            String valor = request.getParameter("valor");

            if (!"".equals(valor)) {

                int idInt = Integer.parseInt(id);
                double valorDoub = Double.parseDouble(valor);

                int p = ParamDao.editParametro(idInt, valorDoub);

                //mensagem
                request.setAttribute("p", p);
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Parâmetro, alterado com sucesso</div>\n");
                request.getRequestDispatcher("adm-admin-params.jsp").forward(request, response);
            } else {

                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Preencha todos os campos obrigatórios</div>\n");
                request.getRequestDispatcher("adm-admin-params.jsp").forward(request, response);
            }

        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-admin.jsp").forward(request, response);
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
        } catch (ModeloException ex) {
            Logger.getLogger(admParametros.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(admParametros.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ModeloException ex) {
            Logger.getLogger(admParametros.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(admParametros.class.getName()).log(Level.SEVERE, null, ex);
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
