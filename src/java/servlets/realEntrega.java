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
import java.util.Date;
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
@WebServlet(name = "realEntrega", urlPatterns = {"/views/realEntrega"})
public class realEntrega extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws modelo.ModeloException
     * @throws java.sql.SQLException
     * @throws java.text.ParseException
     * @throws org.apache.commons.mail.EmailException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ModeloException, SQLException, ParseException, EmailException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            String acao = request.getParameter("acao");
            String id = request.getParameter("id");
            String idfkEntr = request.getParameter("idFkEntr");
            String rg = request.getParameter("rg");
            String responsavel = request.getParameter("responsavel");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");

            Entregador eCtrl = new Entregador();

            Post p = new Post();
            int idInt = Integer.parseInt(id);
            int intFkEntr = Integer.parseInt(idfkEntr);
            p = PostsDAO.getPost(idInt);
            Remetente r = RemDAO.getRem(p.getRem());
            Entregador e = EntrDAO.getEntregador(intFkEntr);
            int entr = p.getIdFkEntr();
            int horaMin;
            int horaMax;

            if ("coletar".equals(acao)) {
                //retirada entrega
                HtmlEmail email = new HtmlEmail();
                email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
                email.setSmtpPort(465);
                email.setSSL(true);
                email.setAuthenticator(new DefaultAuthenticator("mtsthibau@gmail.com", "thibmat420"));
                email.setSSLOnConnect(true);
                email.addTo(r.getEmail(), r.getNome()); //destinatário
                email.setFrom(e.getEmail(), e.getNome()); // remetente
                email.addCc(p.getEmail(), p.getDestinatario());
                email.setSubject("PEGASUS - COLETA FINALIZADA"); // assunto do e-mail
                // set the html message
                email.setHtmlMsg("<div style='color:#FF530D'><h2><strong>PEGASUS ENTREGAS</strong><br></div>"
                        + "<div><h3>Sua entrega Nº" + p.getId() + " foi retirada do endereço do remetente e está em transito a partir de agora.</div><br><br></h2>"
                        + "Muito obrigado por utilizar Pegasus! <br>Volte Sempre!</h3>");
                email.send();

                //Alterar localização do entregador
                eCtrl.setLatitude(latitude);
                eCtrl.setLongitude(longitude);
                EntrDAO.getLocalEntr(eCtrl, entr);
                PostsDAO.retirarEntr(p, idInt);

                //mensagem
                request.setAttribute("id", idInt);
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'> Coleta realizada com sucesso, finalize a entrega</div>\n");
                request.getRequestDispatcher("adm-entr-rota-entr.jsp").forward(request, response);

            } else {
                //aceitar entrega
                int idFkEntrInt = Integer.parseInt(idfkEntr);

                String strToken = Double.toString(p.getId());
                strToken = userDAO.MD5(strToken);
                strToken += strToken + strToken;
                strToken += strToken + strToken + strToken;

                //ENVIAR NOTOFICAÇÃO POR E_MAIL
                HtmlEmail email = new HtmlEmail();
                email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
                email.setSmtpPort(465);
                email.setSSL(true);
                email.setAuthenticator(new DefaultAuthenticator("mtsthibau@gmail.com", "thibmat420"));
                email.setSSLOnConnect(true);
                email.addTo(r.getEmail(), r.getNome()); //destinatário
                email.setFrom(e.getEmail(), e.getNome()); // remetente
                email.addCc(p.getEmail(), p.getDestinatario());
                email.setSubject("PEGASUS - ENTREGA ACEITA"); // assunto do e-mail
                // set the html message
                email.setHtmlMsg("<div style='color:#FF530D'><h2><strong>PEGASUS ENTREGAS</strong><br></div>"
                        + "<div><h3>Sua entrega Nº" + p.getId() + " foi aceita por um entregador.<br> Agora é apenas uma"
                        + "questão de tempo para que ela chegue até você.</div><br>"
                        + "<strong><a href=\"http://localhost:8080/Pegasus/public/mapRastreamento?token=" + strToken + "&420hAshcOdebtqQdmS420=" + p.getId() + "&s=" + strToken + "\"> Clique aqui e acompanhe seu pedido em tempo real</a>\n"
                        + "<br></h2>"
                        + "Muito obrigado por utilizar Pegasus App! </strong><br></h3>");
                email.send();

                //ACEITAR ENTREGA
                double valorApagar = p.getValorTotal() / 100 * 90; //tela parametrizacao
                valorApagar = Math.floor(valorApagar * 100) / 100;
                EntrDAO.somarSaldo(entr, valorApagar, e.getSaldo(), latitude, longitude);
                PostsDAO.aceitarEntr(idInt, idFkEntrInt);

                //mensagem
                request.setAttribute("id", idInt);
                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Entrega aceita com sucesso</div>\n");
                request.getRequestDispatcher("adm-entr-disp.jsp").forward(request, response);
            }

        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-entr-minh.jsp").forward(request, response);
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
        } catch (ParseException ex) {
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
