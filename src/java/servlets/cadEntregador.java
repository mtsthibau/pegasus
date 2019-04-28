/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import modelo.dao.EntrDAO;
import modelo.dao.userDAO;
import modelo.entidade.Entregador;

/**
 *
 * @author matheus
 */
@WebServlet(name = "cadEntregador", urlPatterns = {"/views/cadEntregador"})
public class cadEntregador extends HttpServlet {

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
            throws ServletException, IOException, ModeloException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String acao = request.getParameter("logica");

            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String senhaConf = request.getParameter("senhaConf");
            String cnpj = request.getParameter("cnpj");
            String tipoVeiculo = request.getParameter("tipoVeiculo");
            String telefone = request.getParameter("telefone");
            String celular = request.getParameter("celular");
            String cep = request.getParameter("cep");
            String logradouro = request.getParameter("logradouro");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String banco = request.getParameter("banco");
            String agencia = request.getParameter("agencia");
            String conta = request.getParameter("conta");
            String status = request.getParameter("status");
            String saldo = request.getParameter("saldo");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");

            if (!"".equals(nome) && !"".equals(email) && !"".equals(senha) && !"".equals(cnpj)
                    && !"".equals(tipoVeiculo) && !"".equals(celular) && !"".equals(cep)
                    && !"".equals(logradouro) && !"".equals(numero) && !"".equals(bairro)
                    && !"".equals(banco) && !"".equals(conta) && !"".equals(agencia)
                    && !"".equals(conta) && !"".equals(status) && !"".equals(latitude)
                    && !"".equals(longitude)) {

                Entregador E = new Entregador();
                E.setNome(nome);
                E.setEmail(email);
                E.setSenha(senha);
                E.setCnpj(cnpj);
                E.setTipoVeiculo(tipoVeiculo);
                E.setTelefone(telefone);
                E.setCelular(celular);
                E.setCep(cep);
                E.setLogradouro(logradouro);
                E.setNumero(numero);
                E.setComplemento(complemento);
                E.setBairro(bairro);
                E.setCidade(cidade);
                E.setEstado(estado);
                E.setBanco(banco);
                E.setAgencia(agencia);
                E.setConta(conta);
                E.setStatus(status);
                E.setLatitude(latitude);
                E.setLongitude(longitude);

                //todo verificar
                int fm = userDAO.findMail(email);
                if (fm < 1) {
                    if (!senhaConf.equals(senha)) {
                        request.setAttribute("id", id);
                        request.setAttribute("nome", nome);
                        request.setAttribute("email", email);
                        request.setAttribute("senha", senha);
                        request.setAttribute("cnpj", cnpj);
                        request.setAttribute("telefone", telefone);
                        request.setAttribute("cep", cep);
                        request.setAttribute("logradouro", logradouro);
                        request.setAttribute("numero", numero);
                        request.setAttribute("complemento", complemento);
                        request.setAttribute("bairro", bairro);
                        request.setAttribute("cidade", cidade);
                        request.setAttribute("estado", estado);
                        request.setAttribute("tipoVeiculo", tipoVeiculo);
                        request.setAttribute("banco", banco);
                        request.setAttribute("agencia", agencia);
                        request.setAttribute("status", status);
                        request.setAttribute("saldo", saldo);

                        request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Senhas não conferem, tente novamente!</div>\n");
                        request.getRequestDispatcher("adm-admin-entr.jsp").forward(request, response);
                        return;

                    } else {
                        EntrDAO.insertEntregador(E);
                        request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>Entregador cadastrado com sucesso</div>\n");
                        request.getRequestDispatcher("adm-admin-entr.jsp").forward(request, response);

                    }
                } else {

                    request.setAttribute("id", id);
                    request.setAttribute("nome", nome);
                    request.setAttribute("email", email);
                    request.setAttribute("senha", senha);
                    request.setAttribute("cnpj", cnpj);
                    request.setAttribute("telefone", telefone);
                    request.setAttribute("cep", cep);
                    request.setAttribute("logradouro", logradouro);
                    request.setAttribute("numero", numero);
                    request.setAttribute("complemento", complemento);
                    request.setAttribute("bairro", bairro);
                    request.setAttribute("cidade", cidade);
                    request.setAttribute("estado", estado);
                    request.setAttribute("tipoVeiculo", tipoVeiculo);
                    request.setAttribute("banco", banco);
                    request.setAttribute("agencia", agencia);
                    request.setAttribute("status", status);
                    request.setAttribute("saldo", saldo);

                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-success\'>E-mail já está cadastrado no sistema</div>\n");
                    request.getRequestDispatcher("adm-rem-perf-cad.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("id", id);
                request.setAttribute("nome", nome);
                request.setAttribute("email", email);
                request.setAttribute("senha", senha);
                request.setAttribute("cnpj", cnpj);
                request.setAttribute("telefone", telefone);
                request.setAttribute("cep", cep);
                request.setAttribute("logradouro", logradouro);
                request.setAttribute("numero", numero);
                request.setAttribute("complemento", complemento);
                request.setAttribute("bairro", bairro);
                request.setAttribute("cidade", cidade);
                request.setAttribute("estado", estado);
                request.setAttribute("tipoVeiculo", tipoVeiculo);
                request.setAttribute("banco", banco);
                request.setAttribute("agencia", agencia);
                request.setAttribute("status", status);
                request.setAttribute("saldo", saldo);
                request.setAttribute("conta", conta);
                request.setAttribute("senha", senha);
                request.setAttribute("senhaConf", senhaConf);

                request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>Preencha todos os campos obrigatórios</div>\n");
                request.getRequestDispatcher("adm-admin-entr-cad.jsp").forward(request, response);
            }

        } catch (ServletException | IOException e) {
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

        } catch (ModeloException ex) {
            Logger.getLogger(cadEntregador.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(cadEntregador.class
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

        } catch (ModeloException ex) {
            Logger.getLogger(cadEntregador.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(cadEntregador.class
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
