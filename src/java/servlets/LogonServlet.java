/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import modelo.entidade.User;
import modelo.dao.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jeff
 */
@WebServlet(name = "LogonServlet", urlPatterns = {"/public/LogonServlet"})
public class LogonServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {

            String Login = request.getParameter("txt_login");
            String Senha = request.getParameter("psw_senha");
            String nivelUser = null;

            if (Login == null || Senha == null) {
                response.sendRedirect("content-login.jsp?m=1");
            }
            User Logado = userDAO.realizarLogin(Login, Senha);
            nivelUser = Logado.getTipoUsuario();

            if (Logado != null) {
                HttpSession Sessao = request.getSession();
                Sessao.setAttribute("UsuarioLogado", Logado);

                if (nivelUser.equals("admin")) {
                    response.sendRedirect("/Pegasus/views/adm-admin.jsp");
                } else if (nivelUser.equals("remetente")) {
                    response.sendRedirect("/Pegasus/views/adm-rem.jsp");
                } else if (nivelUser.equals("entregador")) {
                    response.sendRedirect("/Pegasus/views/adm-entr.jsp");
                } else {
                    response.sendRedirect("content-login.jsp?m=1");
                }
                //response.sendRedirect("index.jsp");
                //request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert-success\'><h4>Você não possui permissão para acessar este conteúdo!</h4></div>\n");
            } else {
                //RequestDispatcher Rd = request.getRequestDispatcher("login.jsp?m=1");
                //Rd.include(request, response);
                //response.sendRedirect("content-login.jsp?m=1");
                //out.println("<h2> Usuário ou senha incorretos.</h2>");
            }
        } catch (SQLException e) {
            System.out.println(e);
            response.sendRedirect("content-login.jsp?m=1");

        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("content-login.jsp?m=2");

        } finally {
            out.close();
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
