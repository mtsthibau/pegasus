<%-- 
    Document   : adm-rem
    Created on : 06/06/2016, 02:41:29
    Author     : matheus
--%>

<%@page import="modelo.entidade.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

        <!-----------------------Java Script---------------------------->
        <script src="../js/jquery-2.2.2.min.js"></script>
        <script src="../js/jquery.bxslider.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <!--<script src="../js/bootstrap.min.js"></script>-->

        <link rel="shortcut icon" href="IMG/logo.png" type="image/x-icon" />
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
                            <a href=""><img src="../IMG/logo.png"></a>
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
                            <ul class="nav hidden-xs hidden-sm">
                                <li class="active">
                                    <a href="adm-rem.jsp" class="menu-texto"><i class="fa fa-home menu-icon"></i> Inicio</a>
                                    <a href="adm-rem-post.jsp" class="menu-texto"><i class="fa fa-truck menu-icon"></i> Minhas Entregas</a>
                                    <a href="adm-rem-hist.jsp" class="menu-texto"><i class="fa fa-history menu-icon"></i> Histórico de Entregas</a>
                                    <a href="editRemetente?id=<%=usuario.getId()%>" class="menu-texto"><i class="fa fa-user menu-icon"></i> Meu Perfíl</a>
                                    <a href="adm-rem-rast.jsp" class="menu-texto"><i class="fa fa-map-marker menu-icon"></i> Rastreamento de Entregas</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-md-9 col-lg-9">
                            <div class="col-xs-12">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <h4>Seja bem vindo(a), <%=usuario.getNome()%>.</h4>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="panel panel-orange">
                                                <div class="panel-heading">
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            <i class="fa fa-truck fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3>Postar Entregas</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-rem-post.jsp">
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Mais Detalhes</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-right"></i></span>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="panel panel-orange">
                                                <div class="panel-heading">
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            <i class="fa fa-history fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3>Histórico de Entregas</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-rem-hist.jsp">
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Mais Detalhes</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-right"></i></span>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="panel panel-orange">
                                                <div class="panel-heading">
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            <i class="fa fa-map-marker fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3>Rastreamento de Entregas</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-rem-rast.jsp">
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Mais Detalhes</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-right"></i></span>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="panel panel-orange">
                                                <div class="panel-heading">
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            <i class="fa fa-users fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3>Meu Perfil</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="editRemetente?id=<%=usuario.getId()%> ">
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Mais Detalhes</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-right"></i></span>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-12 col-md-10 col-xs-12" style="margin-bottom: 155px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>






