<%-- 
    Document   : adm-admin-esca
    Created on : 13/04/2016, 01:58:15
    Author     : matheus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controlador.controladorRem"%>
<%@page import="modelo.entidade.Remetente"%>
<%@page import="modelo.entidade.Post"%>
<%@page import="controlador.ControladorPost"%>
<%@page import="controlador.ControladorPost"%>
<%@page import="controlador.controladorEntr"%>
<%@page import="modelo.entidade.Entregador"%>
<%@page import="modelo.entidade.Entregador"%>
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
            <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css"> <!--importação para paginação-->

            <!-----------------------Java Script---------------------------->
            <script src="../js/jquery-2.2.2.min.js"></script>
            <script src="../js/jquery.bxslider.min.js"></script>
            <script src="../js/bootstrap.js"></script>
            <script src="../js/toastr.js"></script>
            <script src="../js/jquery.maskedinput.js"></script>
            <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script> <!--importação para paginação-->

            <script src="scripts/adm-entr-minh.js"></script>



            <link rel="shortcut icon" href="IMG/logo.png" type="image/x-icon" />
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
                        <!------------------------ VIEWS CONTEÚDOS -------------------->
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
                                        <%
                                            //trazendo dados com controller
                                            ControladorPost c = new ControladorPost();

                                        %>
                                        Minhas Entregas
                                    </h3>
                                    <br/>
                                    ${msgRetorno }     
                                    <div>
                                        <!-- Table -->
                                        <table class="table display" id="myTable" data-order='[[ 2, "asc" ]]' data-page-length='9'>
                                            <thead>
                                            <td class="hidden-xs col-md-1"><b>#</b></td>
                                            <td class="col-xs-1"><b>Entrega</b></th>
                                            <td class="col-xs-1"><b>Status</b></th>
                                            <td class="col-xs-1"><b>Data</b></th>
                                            <td class="col-xs-1 col-md-1"><b>Tipo</b></td>
                                            <td class="hidden-xs col-md-6"><b>Destino</b></th>
                                            <td class="col-xs-1"><b>Detalhes</b></th>
                                            <td class="col-xs-1"><b>Devolver</b></th>
                                                </thead>
                                                <%                                                    List<Post> posts = c.getMyPosts(usuario.getId());
                                                    for (Post p : posts) {
                                                        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                                                        String dataFormat = formatter.format(p.getData());
                                                %>
                                            <tr>
                                                <td class="col-xs-1"><b></b><%=p.getId()%></td>
                                                <td class="col-xs-1 text-center">   
                                                    <% if (p.getStatus().equals("Aguardando Coleta")) {%>
                                                    <a href="obterRotaRet?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>" class="btn btn-success fa fa-map-marker"></a>
                                                    <% } else if (p.getStatus().equals("Coleta Iniciada")) {%>                                            
                                                    <a href="obterRotaRet?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>" class="btn btn-default fa fa-map-marker"></a>
                                                    <% } else if (p.getStatus().equals("Aguardando Entrega")) {%>
                                                    <a href="obterRotaEntr?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>" class="btn btn-info fa fa-map-marker"></a>
                                                    <% } else if (p.getStatus().equals("Entrega Iniciada")) {%>                                            
                                                    <a href="obterRotaEntr?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>" class="btn btn-primary fa fa-map-marker"></a>
                                                    <% } else {%>                                            
                                                    <a href="obterRotaEntr?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>" class="btn btn-warning fa fa-map-marker"></a>
                                                    <%  } %>
                                                </td>
                                                <td class="col-xs-1">
                                                    <% if (p.getStatus().equals("Aguardando Coleta")) {%>
                                                    <a href="obterRotaRet?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>"><%=p.getStatus()%></a>
                                                    <% } else if (p.getStatus().equals("Coleta Iniciada")) {%>                                            
                                                    <a href="obterRotaRet?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>"><%=p.getStatus()%></a>
                                                    <% } else if (p.getStatus().equals("Aguardando Entrega")) {%>
                                                    <a href="obterRotaEntr?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>"><%=p.getStatus()%></a>
                                                    <% } else if (p.getStatus().equals("Entrega Iniciada")) {%>                                            
                                                    <a href="obterRotaEntr?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>"><%=p.getStatus()%></a>
                                                    <% } else {%>                                            
                                                    <a href="obterRotaEntr?id=<%=p.getId()%>&idFkEntr=<%=usuario.getId()%>"><%=p.getStatus()%></a>
                                                    <%  }%>
                                                </td>
                                                <td class="col-xs-1"><%=dataFormat%></td>
                                                <td class="col-xs-1"><%=p.getTipo()%></td>
                                                <td class="hidden-xs col-md-7"><%=p.getLogradouro()%> N°.<%=p.getNumero()%>, <%=p.getBairro()%></td>
                                                <td class="col-xs-1">
                                                    <a href="detPostagemDisp?id=<%=p.getId()%>" class="btn btn-primary pull-right"><span class="fa fa-info-circle"></span></a>
                                                </td>
                                                <td class="col-xs-1">
                                                    <button onclick="dev(<%=p.getId()%>)" class="btn btn-danger pull-right"><span class="fa fa-minus-circle"></span> Devolver</button>
                                                </td>
                                            </tr>
                                            <%  }%>
                                        </table>
                                        <br>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Script que configura a paginação em uma tabela-->
    <script>
        $(document).ready(function () {
            $('#myTable').DataTable({
                select: true,
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

