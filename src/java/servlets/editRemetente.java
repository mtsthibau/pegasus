/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.RemDAO;
import modelo.entidade.Remetente;

/**
 *
 * @author matheus
 */
@WebServlet(name = "editRemetente", urlPatterns = {"/views/editRemetente"})
public class editRemetente extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            //capturando parametros via URL
            String acao = request.getParameter("logica");
            String id = request.getParameter("id");
            int idInt = Integer.parseInt(id);

            //recebe dados enviados pelo servlet DAO e  monta url para EDICAO
            RemDAO dao = new RemDAO();
            Remetente rem = dao.getRem(idInt);
            //mensagem
            request.setAttribute("id", rem.getId());
            request.setAttribute("nome", rem.getNome());
            request.setAttribute("email", rem.getEmail());
            request.setAttribute("senha", rem.getSenha());
            request.setAttribute("cpf", rem.getCpf());
            request.setAttribute("celular", rem.getCelular());
            request.setAttribute("telefone", rem.getTelefone());
            request.setAttribute("cep", rem.getCep());
            request.setAttribute("logradouro", rem.getLogradouro());
            request.setAttribute("numero", rem.getNumero());
            request.setAttribute("complemento", rem.getComplemento());
            request.setAttribute("bairro", rem.getBairro());
            request.setAttribute("latitude", rem.getLatitude());
            request.setAttribute("longitude", rem.getLongitude());

            request.getRequestDispatcher("adm-rem-perf.jsp").forward(request, response);

        } catch (NumberFormatException | ServletException | IOException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-rem-perf.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
