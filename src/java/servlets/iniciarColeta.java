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
@WebServlet(name = "iniciarColeta", urlPatterns = {"/views/iniciarColeta"})
public class iniciarColeta extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ModeloException, EmailException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            String id = request.getParameter("id");
            String latitudeAtual = request.getParameter("latitudeAtual");
            String longitudeAtual = request.getParameter("longitudeAtual");

            Entregador eCtrl = new Entregador();
            Post p = new Post();
            int idInt = Integer.parseInt(id);
            p = PostsDAO.getPost(idInt);
            Remetente r = RemDAO.getRem(p.getRem());
            Entregador e = EntrDAO.getEntregador(p.getIdFkEntr());
            int entr = p.getIdFkEntr();

            //iniciar coleta
            HtmlEmail email = new HtmlEmail();
            email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
            email.setSmtpPort(465);
            email.setSSL(true);
            email.setAuthenticator(new DefaultAuthenticator("mtsthibau@gmail.com", "thibmat420"));
            email.setSSLOnConnect(true);
            email.addTo(r.getEmail(), r.getNome());
            email.setFrom(e.getEmail(), e.getNome());
            email.addCc(p.getEmail(), p.getDestinatario());
            email.setSubject("PEGASUS - COLETA INICIADA"); // assunto do e-mail
            // set the html message
            email.setHtmlMsg("<div style='color:#FF530D'><h2><strong>PEGASUS ENTREGAS</strong></h2><br></div>"
                    + "<div><h3>Sua entrega Nº" + p.getId() + " foi iniciado pelo entregador. Fique Atento!</h3><br></div>");
            email.send();

            //Alterar localização do entregador
            eCtrl.setLatitude(latitudeAtual);
            eCtrl.setLongitude(longitudeAtual);
            EntrDAO.getLocalEntr(eCtrl, entr);

            PostsDAO.iniciarColeta(idInt);

            //mensagem
            request.setAttribute("id", idInt);
            request.setAttribute("rem", r.getId());
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'> Coleta iniciada com sucesso</div>\n");
            request.getRequestDispatcher("adm-entr-rota-ret.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-entr-disp.jsp").forward(request, response);
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
            Logger.getLogger(realEntrega.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(realEntrega.class.getName()).log(Level.SEVERE, null, ex);
        } catch (EmailException ex) {
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
        } catch (ModeloException ex) {
            Logger.getLogger(realEntrega.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(realEntrega.class.getName()).log(Level.SEVERE, null, ex);
        } catch (EmailException ex) {
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
