<%-- 
    Document   : adm-admin-entr
    Created on : 05/04/2016, 01:17:58
    Author     : matheus
--%>

<%@page import="modelo.entidade.Entregador"%>
<%@page import="controlador.controladorRem"%>
<%@page import="modelo.entidade.Remetente"%>
<%@page import="modelo.entidade.User"%>
<%@page import="modelo.dao.PostsDAO"%>
<%@page import="modelo.entidade.Post"%>
<%@page import="servlets.cadPostagem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controlador.ControladorPost"%>
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

            <script src="scripts/adm-entr-rota-ret.js"></script>

            <link rel="shortcut icon" href="../IMG/logo.png" type="image/x-icon" />
        </head>

        <body>
            <%
                User usuario = (User) session.getAttribute("UsuarioLogado");
                if (usuario == null || !usuario.getTipoUsuario().equals("entregador")) {
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
                        <!--------------------------------------- VIEWS CONTEÚDOS ----------------------------------------->
                        <div style="margin-top: 140px;">  
                            <div class="col-md-3 col-lg-3" id="slider1">
                                <ul class="nav">
                                    <li class="active">
                                        <a href="adm-entr.jsp" class="menu-texto"><i class="fa fa-home menu-icon"></i> Inicio</a>
                                        <a href="adm-entr-disp.jsp" class="menu-texto"><i class="fa fa-archive menu-icon"></i> Entregas Disponíveis</a>
                                        <a href="adm-entr-hist.jsp" class="menu-texto"><i class="fa fa-history menu-icon"></i> Histórico de Entregas</a>
                                        <a href="adm-entr-minh.jsp" class="menu-texto"><i class="fa fa-truck menu-icon"></i> Minhas Entregas</a>
                                    </li>   
                                </ul>
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-12">
                                    <h3>
                                        <a class="fa fa-chevron-left" name="back" 
                                           value="back" onclick="history.go(-1);"></a>
                                        Realizar Entrega - ${id }
                                        <div class="pull-right"> 
                                            <a href="reportarRota?id=${id }" class="btn btn-danger">
                                                <span class="fa fa-warning"></span> Reportar</a>
                                        </div>
                                    </h3>
                                    <hr>
                                    ${msgRetorno } 
                                    <div class="col-xs-12">
                                        <br>
                                        <button onclick="initMap(${latitude}, ${longitude})" 
                                                class="btn btn-default" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                            <span class="fa fa-map-marker"></span> VISUALIZAR ROTA
                                        </button>
                                        <div class="collapse" id="collapseExample">
                                            <div class="well">
                                                <div id="map" style="width:100%;height: 450px">
                                                </div>  
                                            </div>
                                            <div class="col-xs-3" style="margin-top: 14px; margin-left: -13px;">
                                                <a href="iniciarEntrega?id=${id }" class="btn btn-orange">
                                                    <span class="fa fa-arrow-right"></span> Iniciar rota de entrega
                                                </a>
                                            </div>
                                            <div class="col-xs-1"></div>
                                            <div class="well col-xs-8" style="margin-top: 13px">
                                                <h4><strong><span class="fa fa-warning"></span> Atenção <%=usuario.getNome()%>!</strong></h4>
                                                <h5>
                                                    Essa entrega está marcada para ser finalizada preferencialmente 
                                                    no periodo da <strong>${periodo}.</strong><br> Por favor contacte o destinatário 
                                                    no caso da sequência fora do período preferencial.
                                                </h5>
                                                </h4>
                                            </div>
                                        </div> 
                                    </div>
                                    <form action="finalEntrega">
                                        <div class="col-xs-12">      
                                            <div class="form-group" style="display: none">
                                                <input type="text" class="form-control" id="id" name="id" value="${id }" placeholder=""/>
                                            </div>
                                            <br>
                                            <h4>Finalizar Entrega</h4>
                                            <hr>
                                            <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                    <div class="form-group">
                                                        <label class="label-form">RG do Recebedor</label><label class="requerido"> *</label></label>  
                                                    </div>
                                                </div>
                                                <div class="col-lg-9">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="rg" name="rgRecebedor" value="${rgRecebedor}" placeholder=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                    <div class="form-group">
                                                        <label class="label-form">Nome Completo</label><label class="requerido"> *</label></label>  
                                                    </div>
                                                </div>
                                                <div class="col-lg-9">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="recebedor" name="recebedor" placeholder=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <blockquote class="blockquote">
                                                <br>
                                                <br>
                                                <footer>Campos  obrigatórios<span class="requerido"> *</span></footer>
                                            </blockquote>
                                            <div class="modal-footer">
                                                <div class="form-group">
                                                    <input type="submit" class="btn btn-success"/>
                                                    <button type="reset" class="btn btn-default">Limpar
                                                    </button>
                                                </div>
                                            </div>
                                    </form>
                                </div>
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

