<%-- 
    Document   : adm-rem-post
    Created on : 05/04/2016, 01:17:58
    Author     : matheus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.entidade.User"%>
<%@page import="servlets.cadPostagem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controlador.ControladorPost"%>
<%@page import="java.util.List"%>
<%@page import="modelo.entidade.Post"%>
<%@page import="modelo.dao.PostsDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <html>
        <head>
            <link rel="shortcut icon" href="img/logo.png">

            <title>Pegasus</title>
            <!-------------------------StyleSheet CSS--------------------------->
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <link href="../css/bootstrap.css" rel="stylesheet">
            <link href="../css/bootstrap.min.css" rel="stylesheet">
            <link href="../css/font-awesome.min.css" rel="stylesheet"/>
            <link rel="stylesheet" href="../css/style.css" />
            <link rel="stylesheet" href="../css/jquery.bxslider.css">
            <link href="../css/toastr.css" rel="stylesheet"/>
            <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css"> <!--importação para paginação-->

            <!-----------------------Java Script---------------------------->
            <script src="../js/jquery-2.2.2.min.js"></script>
            <script src="../js/jquery.bxslider.min.js"></script>
            <script src="../js/bootstrap.js"></script>
            <script src="../js/toastr.js"></script>
            <script src="../js/jquery.maskedinput.js"></script>
            <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script> <!--importação para paginação-->

            <script src="scripts/adm-rem-post.js"></script>

            <link rel="shortcut icon" href="../IMG/logo.png" type="image/x-icon" />
        </head>

        <body>
            <%
                User usuario = (User) session.getAttribute("UsuarioLogado");
                if (usuario == null || !usuario.getTipoUsuario().equals("remetente")) {
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert-danger\'><h4>Você não possui permissão para acessar este conteúdo!</h4></div>\n");
                    request.getRequestDispatcher("../public/erro-acesso.jsp").forward(request, response);
                }
            %>
            <div>
                <div class="container-fluid">
                    <div class="row">
                        <!------------------------- MENU ----------------------------->
                        <header class="col-lg-12 col-md-12 col-sm-12 barra-topo">
                            <div class="col-lg-2 col-md-3 col-xs-2 logo">
                                <a href="../index.jsp"><img src="../IMG/logo.png"></a>
                            </div>
                            <div class="col-lg-10 col-md-9 col-xs-12 login">
                                <ul>
                                    <li class="menuContato">
                                        <a href="../public/content-pegasus-portal.jsp" class="text-uppercase">PEGASUS</a>
                                    </li>
                                    <li class="menuContato">
                                        <a href="../public/content-contato.jsp" class="text-uppercase">CONTATO</a>
                                    </li>
                                    <li class="menuContato">
                                        <a href="../public/content-entregador.jsp" class="text-uppercase">SEJA ENTREGADOR</a>
                                    </li>
                                    <li class="menuContato">
                                        <a href="../public/cadastro.jsp" class="text-uppercase">CADASTRAR</a>
                                    </li>
                                </ul>
                                <% if (usuario.getId() != 0) {%>
                                <a href="LogoutServlet" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Sair</a>
                                <%} else {%>
                                <a href="../public/content-login.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                <%}%>
                            </div>
                            <div class="col-xs-10 hidden-lg hidden-md pull-right">
                                <button class="btn btn-lg btn-categorias-celular glyphicon glyphicon-list" type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseMenuCel"
                                        aria-expanded="false" aria-controls="collapseMenuCel"> </button>
                                <div class="collapse pull-left" id="collapseMenuCel">

                                    <div class="col-sm-2 col-xs-2" role="navigation">
                                        <ul class="nav navbar">
                                            <li class="menuContato">
                                                <a href="../public/content-pegasus-portal.jsp" class="text-uppercase">PEGASUS</a>
                                            </li>
                                            <li class="menuContato">
                                                <a href="../public/content-contato.jsp" class="text-uppercase">CONTATO</a>
                                            </li>
                                            <li class="menuContato">
                                                <a href="../public/content-entregador.jsp" class="text-uppercase">SEJA ENTREGADOR</a>
                                            </li>
                                            <li class="menuContato">
                                                <a href="../public/cadastro.jsp" class="text-uppercase">CADASTRAR</a>
                                            </li>
                                            <li class="menuContato">
                                                <% if (usuario.getId() != 0) {%>
                                                <a href="LogoutServlet" class="text-uppercase"> Sair</a>
                                                <%} else {%>
                                                <a href="../public/content-login.jsp" class="text-uppercase"><span class="fa fa-sign-in"></span> Entrar</a>
                                                <%}%>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <!------------------------ VIEWS CONTEÚDOS -------------------->
                        <div style="margin-top: 140px;">  
                            <div class="col-md-3 col-lg-3" id="slider1">
                                <ul class="nav">
                                    <li class="active">
                                        <a href="adm-rem.jsp" class="menu-texto"><i class="fa fa-home menu-icon"></i> Inicio</a>
                                        <a href="adm-rem-post.jsp" class="menu-texto"><i class="fa fa-truck menu-icon"></i> Minhas Entregas</a>
                                        <a href="adm-rem-hist.jsp" class="menu-texto"><i class="fa fa-history menu-icon"></i> Histórico de Entregas</a>
                                        <a href="editRemetente?id=<%=usuario.getId()%>" class="menu-texto"><i class="fa fa-user menu-icon"></i> Meu Perfíl</a>
                                        <a href="adm-rem-rast.jsp" class="menu-texto"><i class="fa fa-map-marker menu-icon"></i> Rastreamento de Entregas</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-12">
                                    <a href="adm-rem-post-cad.jsp" class="btn btn-success btn-lg btn-nova-categoria">
                                        <span class="glyphicon glyphicon-plus"></span> Cadastrar
                                    </a>
                                    <h3>
                                        <%  ControladorPost c = new ControladorPost();%>
                                        Lista de Entregas
                                    </h3>
                                    <br/>
                                    ${msgRetorno }     
                                    <div>
                                        <!-- Table -->
                                        <table class="table display" id="myTable" data-order='[[ 0, "asc" ]]' data-page-length='9'>
                                            <thead>
                                            <td class="col-xs-1"><b>#</b></td>
                                            <td class="col-lg-3 col-md-3 col-xs-3"><b>Destinatário</b></td>
                                            <td class="col-lg-3 hidden-3 hidden-xs"><b>Endereço</b></td>
                                            <td class="col-xs-1 hidden-md hidden-xs"><b>Urgência</b></td>
                                            <td class="col-xs-1"><b>Tipo</b></td>
                                            <td class="col-lg-1 hidden-md hidden-xs"><b>Data</b></td>
                                            <td class="col-lg-1 col-md-1 col-xs-1 hidden-xs"><b>Preço(R$)</b></td>
                                            <td class="col-lg-1 col-md-1 col-xs-1"><b>Pagar</b></td>
                                            <td class="col-lg-1 col-md-1"><b>Excluir</b></td>
                                            </thead>
                                            <%
                                                //listagem de posts
                                                List<Post> posts = c.getPostsRem(usuario.getId());

                                                for (Post p : posts) {
                                                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                                                    String dataFormat = formatter.format(p.getData());
                                            %>
                                            <tr>
                                                <td class="col-xs-1"><b></b><%=p.getId()%></td>
                                                <td class="col-lg-3 col-md-3 col-xs-2"> <a href="editPostagem?id=<%=p.getId()%>"><%=p.getDestinatario()%></a></td>
                                                <td class="col-lg-3 col-md-3 hidden-md hidden-xs"><%=p.getLogradouro()%> <%=p.getNumero()%>, <%=p.getBairro()%></td>
                                                <td class="col-xs-1 hidden-md hidden-xs"><%=p.getUrgencia()%></td>
                                                <td class="col-xs-1"><%=p.getTipo()%></td>
                                                <td class="col-lg-1 hidden-md hidden-xs"><%=dataFormat%></td>
                                                <td class="col-lg-1 col-md-1 col-xs-1 hidden-xs"><%=p.getValorTotal()%></td>
                                                <td class="col-lg-1 col-md-1">
                                                    <form action="https://www.sandbox.paypal.com/cgi-bin/webscr"  method="post">
                                                        <input type="hidden" name="cmd" value="_xclick"/>
                                                        <input type="hidden" name="business" value="mtsthibau@gmail.com"/>
                                                        <input type="hidden" name="item_name" value="Entrega N - <%=p.getId()%>"/>
                                                        <input type="hidden" name="item_number" value="<%=p.getId()%>"/>
                                                        <input type="hidden" name="amount" value="<%=p.getValorTotal()%>"/>
                                                        <input type="hidden" name="no_shipping" value="2"/>
                                                        <input type="hidden" name="no_note" value="1"/>
                                                        <input type="hidden" name="currency_code" value="BRL"/>
                                                        <input type="hidden" name="return" value="http://host/paypal_teste/retorno.jsp"/>
                                                        <input type="hidden" name="cancel_return" value="http://host/paypal_teste/retorno.jsp"/>
                                                        <input type="hidden" name="notify_url" value="http://host/paypal_teste/retorno.jsp"/>
                                                        <input type="hidden" name="bn" value="PP-BuyNowBF"/>
                                                        <input type="image" src="https://www.paypal.com/pt_BR/i/btn/x-click-but23.gif" border="0" name="submit" alt="Realize os pagamentos de maneira rapida, fácil e segura com PayPal."/>
                                                        <img alt="" border="0" src="https://www.paypal.com/pt_BR/i/scr/pixel.gif" width="1" height="1"/>
                                                    </form>
                                                </td>
                                                <td class="col-lg-1 col-md-1 col-xs-1">
                                                    <button onclick="del(<%=p.getId()%>)" class="btn btn-danger"><span class="fa fa-remove"></span> Excluir</button>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

