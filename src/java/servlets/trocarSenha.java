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
import modelo.dao.AdminDAO;
import modelo.dao.EntrDAO;
import modelo.dao.RemDAO;
import modelo.entidade.Administrador;
import modelo.entidade.Entregador;
import modelo.entidade.Remetente;

/**
 *
 * @author matheus
 */
@WebServlet(name = "trocarSenha", urlPatterns = {"/public/trocarSenha"})
public class trocarSenha extends HttpServlet {

    int idU;
    String nomeU;
    String emailU;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws modelo.ModeloException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ModeloException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String id = request.getParameter("t");
            String emailUser = request.getParameter("email");
            String senha = request.getParameter("senha");
            String senhaConf = request.getParameter("senhaConf");

            if (senha == null) {
                int idInt = Integer.parseInt(id);
                request.setAttribute("id", idInt);
                request.setAttribute("emailUser", emailUser);
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Tudo pronto, agora é só atualzar sua senha. </div>\n");
                request.getRequestDispatcher("content-trocar-senha.jsp").forward(request, response);

            } else {

                if ("".equals(senhaConf) || "".equals(senha) || "".equals(emailUser)) {
                    request.setAttribute("emailUser", emailUser);
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Digite todos os campos obrigatórios.</div>\n");
                    request.getRequestDispatcher("content-trocar-senha.jsp").forward(request, response);
                }

                //verifica se usuário existe
                Entregador e = EntrDAO.solTrocaSenha(emailUser);
                Remetente r = RemDAO.solTrocaSenha(emailUser);
                Administrador a = AdminDAO.solTrocaSenha(emailUser);

                if (!senha.equals(senhaConf)) {
                    request.setAttribute("emailUser", emailUser);
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Senhas não conferem, tente novamente.</div>\n");
                    request.getRequestDispatcher("content-trocar-senha.jsp").forward(request, response);
                }

                if (e != null) {
                    idU = e.getId();
                    nomeU = e.getNome();
                    emailU = e.getEmail();
                    int idEntr = EntrDAO.altSenha(emailUser, senha, idU);
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Senha alterada com sucesso. </div>\n");
                    request.getRequestDispatcher("content-login.jsp").forward(request, response);

                } else if (a != null) {
                    idU = a.getId();
                    nomeU = a.getNome();
                    emailU = a.getEmail();
                    int idAdmin = AdminDAO.altSenha(emailUser, senha, idU);
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Senha alterada com sucesso. </div>\n");
                    request.getRequestDispatcher("content-login.jsp").forward(request, response);

                } else if (r != null) {
                    idU = r.getId();
                    nomeU = r.getNome();
                    emailU = r.getEmail();
                    int idRem = RemDAO.altSenha(emailUser, senha, idU);
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Senha alterada com sucesso. </div>\n");
                    request.getRequestDispatcher("content-login.jsp").forward(request, response);

                } else {
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'> E-mail não encontrado.</div>\n");
                    request.getRequestDispatcher("content-trocar-senha.jsp").forward(request, response);
                }
            }

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
        } catch (SQLException | ModeloException ex) {
            Logger.getLogger(trocarSenha.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException | ModeloException ex) {
            Logger.getLogger(trocarSenha.class.getName()).log(Level.SEVERE, null, ex);
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
