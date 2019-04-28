<%-- 
    Document   : index
    Created on : 05/04/2016, 00:16:34
    Author     : matheus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.entidade.Entregador"%>
<%@page import="controlador.controladorEntr"%>
<%@page import="modelo.entidade.Remetente"%>
<%@page import="controlador.controladorRem"%>
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
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css"> <!--importação para paginação-->


        <!-----------------------Java Script---------------------------->
        <script src="../js/jquery-2.2.2.min.js"></script>
        <script src="../js/jquery.bxslider.js"></script>
        <script src="../js/jquery.bxslider.min.js"></script>
        <script src="../js/bootstrap.js"></script>  
        <script src="../js/toastr.js"></script>
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script> <!--importação para paginação-->

        <script>
            function teste() {
                initParams("${nome}", "${email}", "${ceular}", "${telefone}");
            }
        </script>
    </head>
    <body>
        <%
            User usuario = (User) session.getAttribute("UsuarioLogado");
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
                            <%
                                if (usuario != null) {
                                    if (usuario.getTipoUsuario().equals("entregador")) {
                            %>       
                            <a href="../views/adm-entr.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                            <% }
                                if (usuario.getTipoUsuario().equals("admin")) {
                            %>
                            <a href="../views/adm-admin.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                            <% }
                                if (usuario.getTipoUsuario().equals("remetente")) {
                            %> 
                            <a href="../views/adm-rem.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                            <% }
                            } else {%>
                            <a href="content-login.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                            <%}%>
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
                                        <%
                                            if (usuario != null) {
                                                if (usuario.getTipoUsuario().equals("entregador")) {
                                        %>       
                                        <a href="../views/adm-entr.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                        <% }
                                            if (usuario.getTipoUsuario().equals("admin")) {
                                        %>
                                        <a href="../views/adm-admin.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                        <% }
                                            if (usuario.getTipoUsuario().equals("remetente")) {
                                        %> 
                                        <a href="../views/adm-rem.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                        <% }
                                        } else {%>
                                        <a href="content-login.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </header>
                </div>
            </div>
        </div>
        <div class="col-xs-12" style="margin-top: 80px;">
            <div class="col-xs-12">
                <h1 class=" titulo-sessao"><span class="fa fa-trophy"></span> Top 10 - Entregadores   </h1>
                ${msgRetorno}
                <div class="col-xs-12">
                    <br>
                    <!-- Table -->
                    <table class="table display" id="myTable" data-order='[[ 4, "DESC" ]]' data-page-length='10'>
                        <thead>
                        <td class="col-xs-1"><b>#</b></td>
                        <td class="col-xs-6"><b>Entregador</b></td>
                        <td class="col-xs-1"><b>Nº de Votos</b></td>
                        <td class="col-xs-2"><b>Pontuação</b></td>
                        <td class="col-xs-1"><b>Média</b></td>
                        </thead>
                        <%
                            controladorEntr cEntr = new controladorEntr();
                            List<Entregador> entrs = cEntr.getRanking();
                            for (Entregador e : entrs) {
                                double nota = e.getNota();
                                double numVotos = e.getNumeroVotos();
                                double media;
                                if (nota == 0) {
                                    media = 0;
                                } else {
                                    media = nota / numVotos;
                                    media = Math.floor(media * 100) / 100;
                                }

                        %>
                        <tr>
                            <td class="col-xs-1"><%=e.getId()%></td>
                            <td class="col-xs-6"><%=e.getNome()%></td>
                            <td class="col-xs-1"><%=e.getNumeroVotos()%></td>
                            <td class="col-xs-2"><%=e.getNota()%></td>
                            <td class="col-xs-1"><%=media%></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <br>
                    <br>
                    <br>
                    <br>
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
    </div>
</div>
</div>
</div>
<!----------------------------- FOOTER -------------------------->
<footer>
    <!--COPYRIGHT-->
    <div class="col-lg-12 col-md-12 col-xs-12 rodape-copy">
        <h6>© Copyright 2016 | Pegasus Softwares. Todos os direitos reservados.
            <a href="#content-home"><img src="../IMG/logo_black.png" class="logo-rodape"></a>
        </h6>
    </div>
</footer>
<script>
    // Funcção para inserir paginação em tabelas
    $(document).ready(function () {
        $('#myTable').DataTable({
            select: true,
            searching: false,
            paging: false,
            lengthChange: false,
            "language": {
                "emptyTable": "Nenhum registro encontrado",
                "info": "",
                "infoEmpty": "Exibindo 0 de 0 registros",
                "infoFiltered": "",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Exibindo MENU Registros",
                "loadingRecords": "Carregando...",
                "processing": "Processando...",
                "search": "Buscar:",
                "zeroRecords": "Não foi possível localizar sua busca",
                "decimal": ",",
                "thousands": ".",
                        "paginate": {
                            "first": "Primeira",
                            "last": "Última",
                            "next": " >",
                            "previous": "<"
                        },
                "aria": {
                    "sortAscending": ": Classificação ascedente",
                    "sortDescending": ": Classificação Descendente"
                }

            }
        });
    });

</script>
</body>
</html>