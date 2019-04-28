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
import modelo.dao.EntrDAO;
import modelo.dao.AdminDAO;
import modelo.dao.RemDAO;
import modelo.dao.userDAO;
import modelo.entidade.Administrador;
import modelo.entidade.Entregador;
import modelo.entidade.Post;
import modelo.entidade.Remetente;
import modelo.entidade.Usuario;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 *
 * @author matheus
 */
@WebServlet(name = "solTrocaSenha", urlPatterns = {"/public/solTrocaSenha"})
public class solTrocaSenha extends HttpServlet {

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
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, EmailException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String emailUser = request.getParameter("email");

            if ("".equals(emailUser) || emailUser == null) {
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Preencha todos os campos obrigatórios</div>\n");
                request.getRequestDispatcher("content-perdi-senha.jsp").forward(request, response);
                return;
            }

            Entregador e = EntrDAO.solTrocaSenha(emailUser);
            Remetente r = RemDAO.solTrocaSenha(emailUser);
            Administrador a = AdminDAO.solTrocaSenha(emailUser);

            if (e != null) {
                idU = e.getId();
                nomeU = e.getNome();
                emailU = e.getEmail();

            }
            if (a != null) {
                idU = a.getId();
                nomeU = a.getNome();
                emailU = a.getEmail();
            }
            if (r != null) {
                idU = r.getId();
                nomeU = r.getNome();
                emailU = r.getEmail();
            }

            if (e != null || r != null || a != null) {

                String strToken = Integer.toString(idU);
                strToken = userDAO.MD5(strToken);
                

                //ENVIAR NOTOFICAÇÃO POR E_MAIL
                HtmlEmail email = new HtmlEmail();
                email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
                email.setSmtpPort(465);
                email.setSSL(true);
                email.setAuthenticator(new DefaultAuthenticator("mtsthibau@gmail.com", "thibmat420"));
                email.setSSLOnConnect(true);
                email.addTo(emailU, nomeU);
                email.setFrom("mtsthibau@gmail.com", "Pegasus");
                email.setSubject("PEGASUS - TROCA DE SENHA"); // assunto do e-mail
                // set the html message
                email.setHtmlMsg("<div style='color:#FF530D'><h2><strong>PEGASUS ENTREGAS</strong><br></div>"
                        + "<div><h3>Para trocar sua senha acesse o link <br> </div>"
                        + "<strong><a href=\"http://localhost:8080/Pegasus/public/trocarSenha?email=" + emailU + "&hssha=" + strToken + "&t=" + idU + "\"> Altere agora mesmo sua senha e volte a ter acesso aos serviços Pegasus.</a>\n"
                        + "<br></h2>");
                email.send();

                request.setAttribute("id", idU);
                request.setAttribute("emailUser", emailU);
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Confira seu e-mail para ter acesso a alteração de senhas.</div>\n");
                request.getRequestDispatcher("content-perdi-senha.jsp").forward(request, response);

            } else {
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'> E-mail ou Senha incorretos</div>\n");
                request.getRequestDispatcher("content-perdi-senha.jsp").forward(request, response);
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
        } catch (SQLException ex) {
            Logger.getLogger(solTrocaSenha.class.getName()).log(Level.SEVERE, null, ex);
        } catch (EmailException ex) {
            Logger.getLogger(solTrocaSenha.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(solTrocaSenha.class.getName()).log(Level.SEVERE, null, ex);
        } catch (EmailException ex) {
            Logger.getLogger(solTrocaSenha.class.getName()).log(Level.SEVERE, null, ex);
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
