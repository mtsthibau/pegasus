/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalTime;
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
import modelo.dao.userDAO;
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
@WebServlet(name = "finalEntrega", urlPatterns = {"/views/finalEntrega"})
public class finalEntrega extends HttpServlet {

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
            throws ServletException, IOException, ModeloException, SQLException, ParseException, EmailException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            String id = request.getParameter("id");
            String rgRecebedor = request.getParameter("rgRecebedor");
            String recebedor = request.getParameter("recebedor");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");
            String idFkEntr = request.getParameter("idFkEntr");

            int idInt = Integer.parseInt(id);
            Post p = PostsDAO.getPost(idInt);
            p.setRgRecebedor(rgRecebedor);
            p.setRecebedor(recebedor);

            Remetente r = RemDAO.getRem(p.getRem());
            Entregador e = EntrDAO.getEntregador(p.getIdFkEntr());

            double token = Math.random() * 100;
            String strToken = Double.toString(token);
            strToken = userDAO.MD5(strToken);
            strToken += strToken + strToken;

            HtmlEmail email = new HtmlEmail();

            email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
            email.setSmtpPort(465);
            email.setSSL(true);
            email.setAuthenticator(new DefaultAuthenticator("mtsthibau@gmail.com", "thibmat420"));
            email.setSSLOnConnect(true);
            email.addTo(p.getEmail(), p.getDestinatario()); //destinatário
            email.setFrom(e.getEmail(), e.getNome()); // remetente
            email.setSubject("PEGASUS - ENTREGA FINALIZADA"); // assunto do e-mail
            // set the html message
            email.setHtmlMsg("<div style='color:#FF530D'><h2><strong>PEGASUS ENTREGAS</strong><br></div>"
                    + "<div><h3>Sua entrega Nº" + p.getId() + " foi finalizada com sucesso.</div><br><br></h2>"
                    + "<strong><a href=\"http://localhost:8080/Pegasus/public/avalEntregador?token=" + strToken + "&420hAshcOdebtqQdmS420=" + p.getId() + "&s=" + strToken + "\"> "
                    + "Dê seu feedback, para a Pegasus continuar grantindo excelência nas entregas.<br>Avalie o entregador!</a>\n"
                    + "Muito obrigado por utilizar Pegasus! <br>Volte Sempre!</h3>");
            email.send();

            //TODO FAZER 
            PostsDAO.finalizarEntr(p, idInt);

            //Alterar localização do entregador
            e.setLatitude(latitude);
            e.setLongitude(longitude);
            EntrDAO.getLocalEntr(e, e.getId());
            //mensagem
            request.setAttribute("idPost", idInt);
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Entrega finalizada com sucesso!</div>\n");
            request.getRequestDispatcher("adm-entr-minh.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-entr-rota-entr.jsp").forward(request, response);
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
        } catch (ParseException ex) {
            Logger.getLogger(realEntrega.class.getName()).log(Level.SEVERE, null, ex);
        } catch (EmailException ex) {
            Logger.getLogger(finalEntrega.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(realEntrega.class.getName()).log(Level.SEVERE, null, ex);
        } catch (EmailException ex) {
            Logger.getLogger(finalEntrega.class.getName()).log(Level.SEVERE, null, ex);
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
