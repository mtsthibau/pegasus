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
import modelo.dao.EntrDAO;
import modelo.entidade.Entregador;

/**
 *
 * @author matheus
 */
@WebServlet(name = "editEntregador", urlPatterns = {"/views/editEntregador"})
public class editEntregador extends HttpServlet {

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
            //capturando parametros via URL
            String acao = request.getParameter("logica");
            String id = request.getParameter("id");
            int idInt = Integer.parseInt(id);
            //recebe dados enviados pelo servlet DAO e  monta url para EDICAO
            Entregador entr = EntrDAO.getEntregador(idInt);
            //mensagem
            request.setAttribute("id", entr.getId());
            request.setAttribute("nome", entr.getNome());
            request.setAttribute("email", entr.getEmail());
            request.setAttribute("cnpj", entr.getCnpj());
            request.setAttribute("tipoVeiculo", entr.getTipoVeiculo());
            request.setAttribute("telefone", entr.getTelefone());
            request.setAttribute("celular", entr.getCelular());
            request.setAttribute("cep", entr.getCep());
            request.setAttribute("logradouro", entr.getLogradouro());
            request.setAttribute("numero", entr.getNumero());
            request.setAttribute("complemento", entr.getComplemento());
            request.setAttribute("bairro", entr.getBairro());
            request.setAttribute("cidade", entr.getCidade());
            request.setAttribute("estado", entr.getEstado());
            request.setAttribute("banco", entr.getBanco());
            request.setAttribute("agencia", entr.getAgencia());
            request.setAttribute("conta", entr.getConta());
            request.setAttribute("status", entr.getStatus());
            request.setAttribute("saldo", entr.getSaldo());
            request.setAttribute("totalRecebido", entr.getTotal());

            request.getRequestDispatcher("adm-admin-entr-edit.jsp").forward(request, response);

        } catch (NumberFormatException | ServletException | IOException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-admin-entr-edit.jsp").forward(request, response);
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
            Logger.getLogger(editEntregador.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editEntregador.class.getName()).log(Level.SEVERE, null, ex);
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
