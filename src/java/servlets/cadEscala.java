/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ModeloException;
import modelo.dao.EscalaDAO;
import modelo.entidade.Escala;

/**
 *
 * @author matheus
 */
@WebServlet(name = "cadEscala", urlPatterns = {"/views/cadEscala"})
public class cadEscala extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws modelo.ModeloException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ModeloException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //capturando parametros via URL
            String acao = request.getParameter("logica");

            String id = request.getParameter("id");
            String tipo = request.getParameter("tipo");
            String pesoMin = request.getParameter("pesoMin");
            String pesoMax = request.getParameter("pesoMax");
            String preco = request.getParameter("preco");

            if (!"".equals(tipo) && !"".equals(pesoMin) && !"".equals(pesoMax) && !"".equals(preco)) {

                double doubPesoMin = Double.parseDouble(pesoMin);
                double doubPesoMax = Double.parseDouble(pesoMax);
                double doubPreco = Double.parseDouble(preco);

                Escala E = new Escala();
                E.setTipo(tipo);
                E.setPsoMin(doubPesoMin);
                E.setPesoMax(doubPesoMax);
                E.setPreco(doubPreco);

                int cont = 0;
                ArrayList<Escala> escalas = EscalaDAO.getEscalas();
                for (Escala esc : escalas) {
                    if (doubPesoMin <= esc.getPsoMin() || doubPesoMax <= esc.getPesoMax() || doubPreco == esc.getPreco()) {
                        request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                                + "Escala de peso inválida, verifique as\n"
                                + "\n"
                                + "outras escalas cadastradas e tente novamente. Tenha certeza\n"
                                + "\n"
                                + "que não tenha outra escala com os mesmos pesos</div>\n");
                        request.getRequestDispatcher("adm-admin-esca.jsp").forward(request, response);
                        return;
                    }
                }
                EscalaDAO.insertEscala(E);

                //mensagem
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Escala cadastrada com sucesso</div>\n");
                request.getRequestDispatcher("adm-admin-esca.jsp").forward(request, response);

            } else {

                //erro
                request.setAttribute("id", id);
                request.setAttribute("tipo", tipo);
                request.setAttribute("pesoMin", pesoMin);
                request.setAttribute("pesoMax", pesoMax);
                request.setAttribute("preco", preco);
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Preencha todos os campos obrigatórios</div>\n");
                request.getRequestDispatcher("adm-admin-esca-cad.jsp").forward(request, response);
            }
            
        } catch (ServletException | IOException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-admin-esca.jsp").forward(request, response);
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

        } catch (ModeloException | SQLException ex) {
            Logger.getLogger(cadEscala.class
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
            processRequest(request, response);

        } catch (ModeloException | SQLException ex) {
            Logger.getLogger(cadEscala.class
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
