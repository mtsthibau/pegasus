/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.PostsDAO;
import modelo.entidade.Post;

/**
 *
 * @author matheus
 */
@WebServlet(name = "detHistEntr", urlPatterns = {"/views/detHistEntr"})
public class detHistEntr extends HttpServlet {

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
        try {
            //capturando parametros via URL
            String id = request.getParameter("id");
            int idInt = Integer.parseInt(id);

            Post post = PostsDAO.getPost(idInt);
            //mensagem
            request.setAttribute("id", post.getId());
            request.setAttribute("tipo", post.getTipo());
            request.setAttribute("data", post.getData());
            request.setAttribute("descricao", post.getDescricao());
            request.setAttribute("peso", post.getPeso());
            request.setAttribute("altura", post.getAltura());
            request.setAttribute("profundidade", post.getProfundidade());
            request.setAttribute("largura", post.getLargura());
            request.setAttribute("urgencia", post.getUrgencia());
            request.setAttribute("periodo", post.getPeriodo());
            request.setAttribute("limite", post.getPeriodo());
            request.setAttribute("destinatario", post.getDestinatario());
            request.setAttribute("telefone", post.getTelefone());
            request.setAttribute("celular", post.getCelular());
            request.setAttribute("email", post.getEmail());
            request.setAttribute("cep", post.getCep());
            request.setAttribute("logradouro", post.getLogradouro());
            request.setAttribute("numero", post.getNumero());
            request.setAttribute("complemento", post.getComplemento());
            request.setAttribute("bairro", post.getBairro());
            request.setAttribute("distancia", post.getDistancia());
            request.setAttribute("valorTotal", post.getValorTotal());

            request.getRequestDispatcher("adm-entr-hist-det.jsp").forward(request, response);

        } catch (NumberFormatException | ServletException | IOException | SQLException e) {
            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert alert-danger\'>"
                    + "“Não foi possível localizar sua entrega</div>\n");
            request.getRequestDispatcher("adm-entr-hist.jsp").forward(request, response);
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
