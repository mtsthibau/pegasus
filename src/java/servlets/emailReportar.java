/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.EntrDAO;
import modelo.dao.PostsDAO;
import modelo.dao.RemDAO;
import modelo.entidade.Entregador;
import modelo.entidade.Post;
import modelo.entidade.Remetente;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 *
 * @author matheus
 */
@WebServlet(name = "emailReportar", urlPatterns = {"/views/emailReportar"})
public class emailReportar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws org.apache.commons.mail.EmailException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, EmailException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String id = request.getParameter("id");
            String tipoProblema = request.getParameter("tipoProblema");
            String descricao = request.getParameter("descricao");
            int idInt = Integer.parseInt(id);

            Post p = PostsDAO.getPost(idInt);
            int remetente = p.getRem();
            int entregador = p.getIdFkEntr();
            Remetente r = RemDAO.getRem(remetente);
            Entregador e = EntrDAO.getEntregador(entregador);

            HtmlEmail email = new HtmlEmail();
            email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
            email.setSmtpPort(465);
            email.setSSL(true);
            email.setAuthenticator(new DefaultAuthenticator("mtsthibau@gmail.com", "thibmat420"));
            email.setSSLOnConnect(true);
            email.addTo(p.getEmail(), p.getDestinatario()); //destinatário
            email.setFrom(e.getEmail(), e.getNome()); // remetente
            email.addCc(r.getEmail(), r.getNome());
            email.setSubject("PEGASUS - " + tipoProblema); // assunto do e-mail
            // set the html message
            email.setHtmlMsg("<div style='color:#FF530D'>"
                    + "<h2><strong>PEGASUS ENTREGAS</strong></h2></div>"
                    + "<div style='color:#101025'>"
                    + "<h3><strong>Fique atento!</strong><br>Para sua comodidade informamos todos os paços da sua entrega.</b><br><br>"
                    + "CODIGO DA ENTREGA: " + p.getId() + "<br>"
                    + "<br> Destinatário -  <br>"
                    + p.getDestinatario() + " - <small> " + p.getCelular() + "<br>E-mail: " + p.getEmail() + "<br>"
                    + "" + p.getLogradouro() + " N°" + p.getNumero() + ", Compl."
                    + p.getComplemento() + " " + "<br>" + p.getBairro() + " CEP " + p.getCep() + "</small><br>"
                    + "<hr>Entregador - <br>" + e.getNome() + " - " + e.getCelular()
                    + "</small></div><div style='color: #FF0000;'></h3><h2><strong>PROBLEMA REPORTADO - " + tipoProblema
                    + "</strong><br></div><div><h2>" + descricao + "</h2><br><br></div>");
            email.send();

            request.setAttribute("id", p.getId());
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Notificação do problema enviado por e-mail</div>\n");
            request.getRequestDispatcher("adm-entr-minh.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-entr-post-rep.jsp").forward(request, response);
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
            Logger.getLogger(emailReportar.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(emailReportar.class.getName()).log(Level.SEVERE, null, ex);
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
