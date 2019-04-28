<%-- 
    Document   : adm-rem-rast
    Created on : 13/04/2016, 21:57:39
    Author     : matheus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.entidade.User"%>
<%@page import="modelo.entidade.Entregador"%>
<%@page import="modelo.dao.EntrDAO"%>
<%@page import="controlador.controladorEntr"%>
<%@page import="modelo.entidade.Post"%>
<%@page import="controlador.ControladorPost"%>
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
            <script src="scripts/adm-rem-rast.js"></script>
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
                                </button>
                                <div class="col-md-8 col-sm-12 col-xs-12">
                                    <h3>Rastreamento</h3>
                                    <hr/>
                                    <div id="map" style="width:100%;height: 365px">
                                        <span class="fa fa-map-marker fa-5x text-primary" style="margin-top: 15%; margin-left: 48%;"></span>
                                        <h2 class="text-center">Mapa de rastreamento</h2>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 9px">
                                    <h4 class="menu-icon"><spam class="fa fa-archive"></spam> Entregas</h4><hr>
                                    <ul class="nav col-lg-12" style="width:100%;height:365px;line-height:3em;overflow:scroll;">
                                        <%
                                            ControladorPost c = new ControladorPost();
                                            List<Post> posts = c.getPostsTransito(usuario.getId());
                                            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:MM");
                                            controladorEntr e = new controladorEntr();
                                            if (!posts.isEmpty()) {

                                                for (Post p : posts) {
                                                    int entrId = p.getIdFkEntr();
                                                    Entregador entr = e.getEntr(entrId);
                                        %>
                                        <div class="alert alert-warning" role="alert">
                                            <a class="alert-link" onclick="initMap(<%=entr.getLatitude()%>, <%=entr.getLongitude()%>)"> 
                                                <h5>Post Nº - <%=p.getId()%> <span class="pull-right"><%=1%></span></h5>
                                                <h5><br>Destinatário</h5>
                                                <hr>    
                                                <h6><%=p.getDestinatario()%></h6>
                                                <h6><%=p.getLogradouro()%> Nº <%=p.getNumero()%>, Compl.<%=p.getComplemento()%></h6>
                                                <h6>Bairro <%=p.getBairro()%></h6>
                                            </a>
                                        </div>
                                        <%
                                                }
                                            }else{    
                                        %>
                                         <div class="alert alert-warning" role="alert">
                                            <a class="alert-link"> 
                                                <h5><span class="fa fa-warning"></span> Você não possui entregas para rastrear.</h5>
                                            </a>
                                        </div>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw6aEcrP14Um0XJxWDmUjPnjpwSfGoHOQ&signed_in=true&callback=initMap"
    async defer></script>
</body>
</html>

