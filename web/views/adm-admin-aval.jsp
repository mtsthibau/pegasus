<%-- 
    Document   : adm-admin-aval
    Created on : 05/04/2016
    Author     : matheus
--%>

<%@page import="modelo.entidade.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
            <!-----------------------Java Script---------------------------->
            <script src="../js/jquery-2.2.2.min.js"></script>
            <script src="../js/jquery.bxslider.min.js"></script>
            <script src="../js/bootstrap.js"></script>
            <script src="../js/toastr.js"></script>
            <script src="../js/jquery.maskedinput.js"></script>

            <link rel="shortcut icon" href="IMG/logo.png" type="image/x-icon" />
        </head>

        <body>
            <%
                User usuario = (User) session.getAttribute("UsuarioLogado");
                if (usuario == null || !usuario.getTipoUsuario().equals("admin")) {
                    request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert-danger\'><h4>Você não possui permissão para acessar este conteúdo!</h4></div>\n");
                    request.getRequestDispatcher("../public/erro-acesso.jsp").forward(request, response);
                }
            %>
            <div>
                <div class="container-fluid">
                    <div class="row">
                        <!------------------------- MENU ----------------------------->
                        <header class="col-xs-12 barra-topo">
                            <div class="col-lg-2 col-xs-2 logo">
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
                        <div style="margin-top: 120px;">  
                            <div class="col-md-3 col-lg-3" id="slider1">
                                <ul class="nav">
                                    <li class="active">
                                        <a href="adm-admin.jsp" class="menu-texto"><i class="fa fa-home menu-icon"></i> Inicio</a>
                                        <a href="adm-admin-admin.jsp" class="menu-texto"><i class="fa fa-users menu-icon"></i> Administradores</a>
                                        <a href="adm-admin-entr.jsp" class="menu-texto"><i class="fa fa-truck menu-icon"></i> Entregadores</a>
                                        <a href="adm-admin-esca.jsp" class="menu-texto"><i class="fa fa-bookmark menu-icon"></i> Escalas de Pesos</a>
                                        <a href="adm-admin-hist.jsp" class="menu-texto"><i class="fa fa-history menu-icon"></i> Históricos</a>
                                        <a href="adm-admin-params.jsp" class="menu-texto"><i class="fa fa-gears menu-icon"></i> Configuração</a>  
                                        <a href="adm-admin-post.jsp" class="menu-texto"><i class="fa fa-archive menu-icon"></i> Postagens</a>
                                    </li> 
                                </ul>
                            </div>
                            <div class="col-md-9">
                                </button>
                                <div class="col-md-12">
                                    <h2>Lista de Avaliações</h2>
                                    <br/>
                                    <div class="panel panel-default">
                                        <!-- Table -->
                                        <table class="table">
                                            <tr>
                                                <td class="col-lg-1 col-md-1 col-xs-1"><b>#</b></td>
                                                <td class="col-lg-3 col-md-3 col-xs-5"><b>Entrega</b></td>
                                                <td class="col-lg-5 col-md-5 col-xs-5"><b>Entregador</b></td>
                                                <td class="col-lg-3 col-md-3 hidden-xs hidden-sm"><b>Data</b></td>
                                                <td class="col-lg-1 col-md-1 col-xs-1 col-sm-1"><b>Nota</b></td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-1 col-md-1 col-xs-1"><b></b>1</td>
                                                <td class="col-lg-3 col-md-3 col-xs-5"><a href="">093098</a></td>
                                                <td class="col-lg-5 col-md-5 col-xs-5">Matheus Thibau Paulino</td>
                                                <td class="col-lg-3 col-md-3 hidden-xs hidden-sm">08/11/2050</td>
                                                <td class="col-lg-1 col-md-1 col-xs-1 col-sm-1">5</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

