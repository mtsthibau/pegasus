/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import modelo.dao.AdminDAO;
import modelo.dao.EntrDAO;
import modelo.dao.ParamDao;
import modelo.dao.PostsDAO;
import modelo.dao.RemDAO;
import modelo.entidade.Administrador;
import modelo.entidade.Entregador;
import modelo.entidade.Parametro;
import modelo.entidade.Post;
import modelo.entidade.Remetente;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 *
 * @author matheus
 */
@WebServlet(name = "informRecebimento", urlPatterns = {"/views/informRecebimento"})
public class informRecebimento extends HttpServlet {

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
            throws ServletException, IOException, ModeloException, EmailException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String id = request.getParameter("id");
            int idInt = Integer.parseInt(id);

            Post p = PostsDAO.getPost(idInt);
            Remetente r = RemDAO.getRem(p.getRem());
           
            int po = PostsDAO.informRecebimento(idInt);

            //iniciar coleta
            HtmlEmail email = new HtmlEmail();
            email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
            email.setSmtpPort(465);
            email.setSSL(true);
            email.setAuthenticator(new DefaultAuthenticator("mtsthibau@gmail.com", "thibmat420"));
            email.setSSLOnConnect(true);
            email.addTo(r.getEmail(), r.getNome());
            email.setFrom("mtsthibau@gmail.com", "Pegasus Entregas");
            email.setSubject("PEGASUS - PAGAMENTO RECEBIDO"); // assunto do e-mail
            // set the html message
            email.setHtmlMsg("<div style='color:#FF530D'><h2><strong>PEGASUS ENTREGAS</strong></h2><br></div>"
                    + "<div><h3>O Pagamento da sua entrega Nº." + idInt + "foi recebido com sucesso, agora ela já está disponível para"
                    + "os entregadores, em breve um entregador irá aceitar sua entrega, fique atento. <br> Muito Obrigado.</h3><br></div>");//TODO gerar link
            email.send();

            //mensagem
            request.setAttribute("id", idInt);
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'> Informe de pagamento\n"
                    + "realizado com sucesso, a entrega agora está disponível para ser realizada.</div>\n");
            request.getRequestDispatcher("adm-admin-post.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-admin-entr.jsp").forward(request, response);
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
        } catch (ModeloException | EmailException ex) {
            Logger.getLogger(realEntrega.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ModeloException | EmailException ex) {
            Logger.getLogger(realEntrega.class.getName()).log(Level.SEVERE, null, ex);
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
