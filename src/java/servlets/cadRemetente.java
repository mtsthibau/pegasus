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
import modelo.dao.RemDAO;
import modelo.dao.userDAO;
import modelo.entidade.Remetente;

/**
 *
 * @author matheus
 */
@WebServlet(name = "cadRemetente", urlPatterns = {"/views/cadRemetente", "/public/cadRemetente"})
public class cadRemetente extends HttpServlet {

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

        try {
            String acao = request.getParameter("logica");

            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String confSsenha = request.getParameter("confSsenha");
            String cpf = request.getParameter("cpf");
            String telefone = request.getParameter("telefone");
            String celular = request.getParameter("celular");
            String cep = request.getParameter("cep");
            String logradouro = request.getParameter("logradouro");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");

            if (!"".equals(nome) && !"".equals(email) && !"".equals(cpf) && !"".equals(celular)
                    && !"".equals(cep) && !"".equals(logradouro) && !"".equals(numero) && !"".equals(bairro)
                    && !"".equals(senha) && !"".equals(confSsenha) && !"".equals(latitude) && !"".equals(longitude)) {

                if (!senha.equals(confSsenha)) {
                    request.setAttribute("id", id);
                    request.setAttribute("nome", nome);
                    request.setAttribute("email", email);
                    request.setAttribute("senha", senha);
                    request.setAttribute("cpf", cpf);
                    request.setAttribute("cep", cep);
                    request.setAttribute("logradouro", logradouro);
                    request.setAttribute("numero", numero);
                    request.setAttribute("celular", celular);
                    request.setAttribute("telefone", telefone);
                    request.setAttribute("complemento", complemento);
                    request.setAttribute("bairro", bairro);
                    request.setAttribute("latitude", latitude);
                    request.setAttribute("longitude", longitude);
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Senhas nao conferem, tente novamente.</div>\n");
                    request.getRequestDispatcher("cadastro.jsp").forward(request, response);
                    return;
                }
                Remetente R = new Remetente();

                R.setNome(nome);
                R.setEmail(email);
                R.setSenha(senha);
                R.setCpf(cpf);
                R.setTelefone(telefone);
                R.setCelular(celular);
                R.setCep(cep);
                R.setLogradouro(logradouro);
                R.setNumero(numero);
                R.setComplemento(complemento);
                R.setBairro(bairro);
                R.setLatitude(latitude);
                R.setLongitude(longitude);

                RemDAO rem = new RemDAO();
                int fm = userDAO.findMail(email);

                if (fm < 1) {
                    RemDAO.insertRem(R);
                    //mensagem
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Perfíl cadastrado com sucesso!</div>\n");
                    request.getRequestDispatcher("content-login.jsp").forward(request, response);

                } else {
                    request.setAttribute("id", id);
                    request.setAttribute("nome", nome);
                    request.setAttribute("email", email);
                    request.setAttribute("senha", senha);
                    request.setAttribute("cpf", cpf);
                    request.setAttribute("cep", cep);
                    request.setAttribute("logradouro", logradouro);
                    request.setAttribute("numero", numero);
                    request.setAttribute("celular", celular);
                    request.setAttribute("telefone", telefone);
                    request.setAttribute("complemento", complemento);
                    request.setAttribute("bairro", bairro);
                    request.setAttribute("latitude", latitude);
                    request.setAttribute("longitude", longitude);
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>E-mail já está cadastrado no sistema.</div>\n");
                    request.getRequestDispatcher("cadastro.jsp").forward(request, response);
                }

            } else {

                request.setAttribute("id", id);
                request.setAttribute("nome", nome);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.setAttribute("cpf", cpf);
                request.setAttribute("cep", cep);
                request.setAttribute("logradouro", logradouro);
                request.setAttribute("numero", numero);
                request.setAttribute("celular", celular);
                request.setAttribute("telefone", telefone);
                request.setAttribute("complemento", complemento);
                request.setAttribute("bairro", bairro);
                request.setAttribute("latitude", latitude);
                request.setAttribute("longitude", longitude);

                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Preencha todos os campos obrigatórios</div>\n");
                request.getRequestDispatcher("cadastro.jsp").forward(request, response);
            }

        } catch (IOException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente.</div>\n");
            request.getRequestDispatcher("adm-rem-perf.jsp").forward(request, response);

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
            Logger.getLogger(cadRemetente.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(cadRemetente.class
                    .getName()).log(Level.SEVERE, null, ex);
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
