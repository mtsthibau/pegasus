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
import modelo.ModeloException;
import modelo.dao.AdminDAO;
import modelo.dao.userDAO;
import modelo.entidade.Administrador;

/**
 *
 * @author matheus
 */
@WebServlet(name = "cadAdministrador", urlPatterns = {"/views/cadAdministrador"})
public class cadAdministrador extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            //capturando parametros via URL
            String acao = request.getParameter("logica");

            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String senhaConf = request.getParameter("senhaConf");
            String celular = request.getParameter("celular");

            if (!"".equals(nome) && !"".equals(email) && !"".equals(senha) && !"".equals(celular)) {

                Administrador A = new Administrador();
                A.setNome(nome);
                A.setEmail(email);
                A.setSenha(senha);
                A.setCelular(celular);

                if (acao == null && id != null) {
                    int idInt = Integer.parseInt(id);
                    if (!senha.equals(senhaConf)) {
                        request.setAttribute("id", id);
                        request.setAttribute("nome", nome);
                        request.setAttribute("email", email);
                        request.setAttribute("celular", celular);

                        request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Senhas não conferem</div>\n");
                        request.getRequestDispatcher("adm-admin-admin-edit.jsp").forward(request, response);
                    } else {
                        AdminDAO.editAdmin(idInt, A);
                        request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Administrador alterado com sucesso</div>\n");
                        request.getRequestDispatcher("adm-admin-admin.jsp").forward(request, response);
                    }

                } else {

                    if (!senha.equals(senhaConf)) {
                        request.setAttribute("id", id);
                        request.setAttribute("nome", nome);
                        request.setAttribute("email", email);
                        request.setAttribute("celular", celular);
                        request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Senhas não conferem, tente novamente</div>\n");
                        request.getRequestDispatcher("adm-admin-admin-cad.jsp").forward(request, response);
                    } else {

                        int fm = userDAO.findMail(email);
                        if (fm < 1) {
                            AdminDAO.insertAdmin(A);
                            //mensagem
                            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Administrador cadastrado com sucesso</div>\n");
                            request.getRequestDispatcher("adm-admin-admin.jsp").forward(request, response);
                        } else {
                            request.setAttribute("id", id);
                            request.setAttribute("nome", nome);
                            request.setAttribute("email", email);
                            request.setAttribute("celular", celular);
                            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>E-mail já está cadastrado no sistema</div>\n");
                            request.getRequestDispatcher("adm-admin-admin-cad.jsp").forward(request, response);
                        }
                    }

                }

            } else {
                //erro
                request.setAttribute("id", id);
                request.setAttribute("nome", nome);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.setAttribute("celular", celular);

                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Preencha todos os campos obrigatórios.</div>\n");
                request.getRequestDispatcher("adm-admin-admin-cad.jsp").forward(request, response);

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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(cadAdministrador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ModeloException ex) {
            Logger.getLogger(cadAdministrador.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(cadAdministrador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ModeloException ex) {
            Logger.getLogger(cadAdministrador.class.getName()).log(Level.SEVERE, null, ex);
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
