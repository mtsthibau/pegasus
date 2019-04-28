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
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 *
 * @author matheus
 */
@WebServlet(name = "contato", urlPatterns = {"/public/contato"})
public class contato extends HttpServlet {

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
            throws ServletException, IOException, EmailException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String email1 = request.getParameter("email");
            String nome = request.getParameter("nome");
            String assunto = request.getParameter("assunto");
            String motivo = request.getParameter("motivo");

            //ENVIAR NOTOFICAÇÃO POR E_MAIL
            HtmlEmail email = new HtmlEmail();
            email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
            email.setSmtpPort(465);
            email.setSSL(true);
            email.setAuthenticator(new DefaultAuthenticator("mtsthibau@gmail.com", "thibmat420"));
            email.setSSLOnConnect(true);
            email.addTo("mtsthibau@gmail.com", "Pegasus"); //destinatário
            email.setFrom(email1, nome); // remetente
            email.setSubject(assunto); // assunto do e-mail
            // set the html message
            email.setHtmlMsg(motivo);
            email.send();

            //mensagem
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Mensagem de Contato enviada com sucesso!</div>\n");
            request.getRequestDispatcher("content-contato.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("content-contato.jsp").forward(request, response);
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
        } catch (EmailException ex) {
            Logger.getLogger(contato.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (EmailException ex) {
            Logger.getLogger(contato.class.getName()).log(Level.SEVERE, null, ex);
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
