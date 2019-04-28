<%-- 
    Document   : adm-rem-admin-cad
    Created on : 05/04/2016, 01:17:58
    Author     : matheus
--%>

<%@page import="modelo.entidade.User"%>
<%@page import="servlets.cadPostagem"%>
<%@page import="java.util.ArrayList"%>
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
            <!-----------------------Java Script---------------------------->
            <script src="../js/jquery-2.2.2.min.js"></script>
            <script src="../js/jquery.bxslider.min.js"></script>
            <script src="../js/bootstrap.js"></script>
            <script src="../js/toastr.js"></script>
            <script src="../js/jquery.maskedinput.js"></script>

            <script src="scripts/adm-rem-post.js"></script>

            <link rel="shortcut icon" href="../IMG/logo.png" type="image/x-icon" />
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
                                        <a href="adm-admin.jsp" class="menu-texto"><i class="fa fa-home menu-icon"></i> Inicio</a>
                                        <a href="adm-admin-admin.jsp" class="menu-texto"><i class="fa fa-users menu-icon"></i> Administradores</a>
                                        <a href="adm-admin-entr.jsp" class="menu-texto"><i class="fa fa-truck menu-icon"></i> Entregadores</a>
                                        <a href="adm-admin-esca.jsp" class="menu-texto"><i class="fa fa-bookmark menu-icon"></i> Escalas de Peso</a>
                                        <a href="adm-admin-hist.jsp" class="menu-texto"><i class="fa fa-history menu-icon"></i> Históricos</a>
                                        <a href="adm-admin-post.jsp" class="menu-texto"><i class="fa fa-archive menu-icon"></i> Entregas</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-9">
                                <form action="cadAdministrador" method="POST">
                                    <div class="col-lg-12">
                                        ${msgRetorno } 
                                        <h3>
                                            <a class="fa fa-chevron-left" name="back" 
                                               value="back" onclick="history.go(-1);"> </a>
                                            Editar Administrador - ${nome } </h3>
                                        <hr/>
                                        <div style="display: none">
                                            <input type="text" class="form-control" id="id" name="id" value="${id }"/>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Nome</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="nome" name="nome" value="${nome }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">E-mail</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="email" name="email" value="${email }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Senha</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="senha" name="senha" value="${senha }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Senha Confirmação</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="senhaConf" name="senhaConf" value="${senhaConf }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Celular</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="celular" name="celular" value="${celular }" placeholder=""/>
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
</body>
</html>

