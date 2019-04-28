<%-- 
    Document   : adm-admin-entr
    Created on : 05/04/2016, 01:17:58
    Author     : matheus
--%>

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

            <script src="scripts/adm-entr-disp-det.js"></script>

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
                        </header>                        <!------------------------ VIEWS CONTEÚDOS ----------------------------------------->
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
                                           value="back" onclick="history.go(-1);"> </a>
                                        Detalhes da Entrega - ${id }
                                    </h3>
                                    <hr>
                                    ${msgRetorno }     
                                    <div class="panel panel-primary">
                                        <div class="panel-heading"><h4><span class="fa fa-info-circle"></span> Informações detalhadas da entrega</h4></div>
                                        <div class="panel-body">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <h5><b>COD.:</b> ${id}</h5>
                                                    <hr>
                                                </div> 
                                                <div class="col-xs-3">
                                                    <h5><b>Data:</b> ${data}</h5>
                                                    <hr>
                                                </div> 
                                                <div class="col-xs-3">
                                                    <h5><b>Tipo:</b> ${tipo}</h5>
                                                    <hr>
                                                </div>  
                                                <div class="col-xs-3">
                                                    <h5><b>Valor Total:</b> R$${valorTotal}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Destinatário:</b><br> ${destinatario}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>E-mail:</b><br> ${email}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Telefone:</b><br> ${telefone}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Celular:</b> <br>${celular}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>CEP:</b> ${cep}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Logradouro:</b> ${logradouro}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Nº.:</b> ${numero} <b>Comp.:</b> ${complemento}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Bairro:</b> ${bairro}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-12">
                                                    <h5><b>Descrição:</b> ${descricao}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Peso:</b> ${peso}kg</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Altura:</b> ${altura}cm</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Largura:</b> ${largura}cm</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Profundidade:</b> ${profundidade}cm</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Urgência:</b> ${urgencia}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Distância Total:</b> ${distancia}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Latitude:</b> ${latitude}</h5>
                                                    <hr>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>longitude:</b> ${longitude}</h5>
                                                    <hr>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <h4>Remetente<hr></h4>
                                                <%
                                                    double longitude = (double) request.getAttribute("longitude");
                                                    double latitude = (double) request.getAttribute("latitude");

                                                    int id = (int) request.getAttribute("rem");

                                                    //trazendo dados com controller
                                                    controladorRem r = new controladorRem();
                                                    // listagem de entrs List
                                                    Remetente rem = r.getRem(id);
                                                %>
                                                <div class="col-xs-3">
                                                    <h5><b>ID:</b> <%=id%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Nome:</b> <%=rem.getNome()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Celular:</b> <%=rem.getCelular()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>E-mail:</b> <%=rem.getEmail()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>CEP:</b> <%=rem.getCep()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Logradouro:</b> <%=rem.getLogradouro()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Nº:</b> <%=rem.getNumero()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Complemento:</b> <%=rem.getComplemento()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Bairro:</b> <%=rem.getBairro()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Latitude</b> <%=rem.getLatitude()%></h5>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h5><b>Longitude:</b> <%=rem.getLongitude()%></h5>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <br>
                                                <br>
                                                <button onclick="initMap(<%=rem.getLatitude()%>, <%=rem.getLongitude()%>, <%=latitude%>, <%=longitude%>)" 
                                                        class="btn btn-orange" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                    <span class="fa fa-map-marker"></span> VISUALIZAR MAPA DE ROTA
                                                </button>
                                                <br>
                                                <div class="collapse" id="collapseExample">
                                                    <div class="well">
                                                        <div id="map" style="width:100%;height: 450px">
                                                            <button onclick="initMap(<%=rem.getLatitude()%>, <%=rem.getLongitude()%>, <%=latitude%>, <%=longitude%>)" 
                                                                    class="btn btn-primary  btn-lg center-block">
                                                                <span class="fa fa-repeat"></span>
                                                            </button>
                                                        </div>  
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw6aEcrP14Um0XJxWDmUjPnjpwSfGoHOQ&signed_in=true&callback=initMap"
    async defer></script>
</body>
</html>

