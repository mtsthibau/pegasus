<%-- 
    Document   : index
    Created on : 05/04/2016, 00:16:34
    Author     : matheus
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.entidade.User"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
        <script src="../js/jquery.bxslider.js"></script>
        <script src="../js/jquery.bxslider.min.js"></script>
        <script src="../js/bootstrap.js"></script>        
        <link rel="shortcut icon" href="IMG/logo_black.png" type="image/x-icon" />

    </head>
    <body>
        <%
            String CodMsg = request.getParameter("m");
            User usuario = (User) session.getAttribute("UsuarioLogado");
        %>
        <div class="row">
            <!------------------------- MENU ----------------------------->
            <header class="col-lg-12 col-md-12 col-sm-12 barra-topo">
                <div class="col-lg-2 col-md-3 col-xs-2 logo">
                    <a href="../index.jsp"><img src="../IMG/logo.png"></a>
                </div>
                <div class="col-lg-10 col-md-9 col-xs-12 login">
                    <ul>
                        <li class="menuContato">
                            <a href="content-pegasus-portal.jsp" class="text-uppercase">PEGASUS</a>
                        </li>
                        <li class="menuContato">
                            <a href="content-contato.jsp" class="text-uppercase">CONTATO</a>
                        </li>
                        <li class="menuContato">
                            <a href="content-entregador.jsp" class="text-uppercase">SEJA ENTREGADOR</a>
                        </li>
                        <li class="menuContato">
                            <a href="cadastro.jsp" class="text-uppercase">CADASTRAR</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-10 hidden-lg hidden-md pull-right">
                    <button class="btn btn-lg btn-categorias-celular glyphicon glyphicon-list" type="button"
                            data-toggle="collapse"
                            data-target="#collapseMenuCel"
                            aria-expanded="false" aria-controls="collapseMenuCel"></button>
                    <div class="collapse pull-left" id="collapseMenuCel">
                        <div class="col-sm-2 col-xs-2" role="navigation">
                            <ul class="nav navbar">
                                <li role="presentation" class="col-md-1 col-xs-1 col-sm-1 menuContato">
                                    <a href="" class="text-uppercase"></a>
                                </li>
                                <li class="col-md-1 col-xs-1 col-sm-1 menuContato">
                                <li class="menuContato">
                                    <a href="content-pegasus-portal.jsp" class="text-uppercase">PEGASUS</a>
                                </li>
                                <li class="menuContato">
                                    <a href="content-contato.jsp" class="text-uppercase">CONTATO</a>
                                </li>
                                <li class="menuContato">
                                    <a href="content-entregador.jsp" class="text-uppercase">SEJA ENTREGADOR</a>
                                </li>
                                <li class="menuContato">
                                    <a href="cadastro.jsp" class="text-uppercase">CADASTRAR</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
        </div>
        <div class="col-md-12" style="margin-top: 170px;">
            <div class="col-md-4">
                <!--espaço-->
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3>Entrar</h3></div>
                    <form action="LogonServlet" method="post"/>
                    <div class="panel-body">
                        ${msgRetorno}

                        <% if (CodMsg != null) {
                                if (CodMsg.equals("1")) { %>
                        <div class="alert alert-danger" role="alert">E-mail ou senha incorretos.</div>
                        <% } else if (CodMsg.equals("2")) { %>
                        <div class="alert alert-danger" role="alert">Falha ao tentar conectar com a Base de Dados. Por favor, tente novamente</div>
                        <% } else if (CodMsg.equals("3")) { %>
                        <div class="alert alert-danger" role="alert">Erro inesperado. Contate o adminitrador do sistema.</div>
                        <% } else if (CodMsg.equals("4")) { %>
                        <div class="alert alert-danger" role="alert">Preencha os campos obrigatórios</div>
                        <% }
                            }%>
                        <div class="form-group">
                            <label> E-mail<label class="requerido">*</label></label>
                            <input type="text" name="txt_login" class="form-control" placeholder="Confirme seu E-mail">
                        </div>
                        <div class="form-group">
                            <label>Senha <label class="requerido">*</label></label>
                            <input type="password" name="psw_senha" class="form-control" placeholder="Digite uma nova senha.">
                        </div>
                        <input type="submit" class="btn btn-primary" style="float: left;"/>
                        <input type="reset" class="btn btn-default" style="margin-left: 20px;"/>
                    </div>
                    </form>
                    <div class="panel-footer">
                        Ainda não é um remetente? <a href="cadastro.jsp">CADASTRE-SE</a><br><br>
                        Perdeu sua senha? <a href="content-perdi-senha.jsp">RECUPERE</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-------------------------- Rodapé ----------------------------->
    <div class="col-lg-12  col-md-12 col-xs-12 barra-rodape">
        <!--ENDEREÇOS E REDES SOCIAIS-->
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 endereco">
            <br>
            <h3><span class="glyphicon glyphicon-map-marker"></span> Encontre a Pegasus</h3>
            <hr>
            <h4>
                Rua Plêiades, 451, Santa Lúcia<br>Belo Horizonte - MG <br><strong>CEP 30360-190</strong><br><br>
                <strong>Matheus Thibau Paulino</strong><br> +55 31 99988-5874
            </h4>
            <br>
        </div>
        <!------------------MENU-------------------->
        <div class="col-lg-3 col-md-3 col-xs-12 institucional">
            <br>
            <h3><span class="glyphicon glyphicon-cloud"></span> Pegasus</h3><hr>
            <h4><a href="" style="color:#FFFFFF"> Envie tudo pela Pegasus</a></h4>
            <h4><a href="" style="color:#FFFFFF"> Receba suas entregas pela Pegasus</a></h4>
            <h4><a href="" style="color:#FFFFFF"> Seja um entregador Pegasus</a></h4>
        </div>

        <!-----------------Menu de serviços------------------------------>
        <div class="col-md-3 col-xs-12 servico">
        </div>
        <!---------------API FACEBOOK-------------------------------->
        <div class="col-xs-12 col-md-3" style="margin-top: 45px;">
            <div class="fb-page" data-href="https://www.facebook.com/PegasusSoft"
                 data-tabs="timeline" data-width="340" data-height="200" 
                 data-small-header="false" data-adapt-container-width="false" 
                 data-hide-cover="false" data-show-facepile="true">
                <div class="fb-xfbml-parse-ignore">
                    <blockquote cite="https://www.facebook.com/PegasusSoft">
                        <a href="https://www.facebook.com/PegasusSoft">Pegasus Software</a>
                    </blockquote>
                </div>
            </div>                            
        </div>
    </div>
    <footer>
        <!--COPYRIGHT-->
        <div class="col-lg-12 col-md-12 col-xs-12 rodape-copy">
            <h6>© Copyright 2016 | Pegasus Softwares. Todos os direitos reservados.
                <a href="#content-home"><img src="../IMG/logo_black.png" class="logo-rodape"></a>
            </h6>
        </div>
    </footer>
</body>
</html>
