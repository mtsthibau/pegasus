<%-- 
    Document   : adm-admin-entr
    Created on : 05/04/2016, 01:17:58
    Author     : matheus
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
            <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css">

            <!-----------------------Java Script---------------------------->
            <script src="../js/jquery-2.2.2.min.js"></script>
            <script src="../js/jquery.bxslider.min.js"></script>
            <script src="../js/bootstrap.js"></script>
            <script src="../js/toastr.js"></script>
            <script src="../js/jquery.maskedinput.js"></script>
            <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>

            <script src="scripts/adm-admin-entr.js"></script>

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
                                <ul class="nav hidden-xs hidden-sm">
                                    <li class="active">
                                        <a href="adm-admin.jsp" class="menu-texto"><i class="fa fa-home menu-icon"></i> Inicio</a>
                                        <a href="adm-admin-admin.jsp" class="menu-texto"><i class="fa fa-users menu-icon"></i> Administradores</a>
                                        <a href="adm-admin-entr.jsp" class="menu-texto"><i class="fa fa-truck menu-icon"></i> Entregadores</a>
                                        <a href="adm-admin-esca.jsp" class="menu-texto"><i class="fa fa-bookmark menu-icon"></i> Escalas de Pesos</a>
                                        <a href="adm-admin-hist.jsp" class="menu-texto"><i class="fa fa-history menu-icon"></i> Históricos</a>
                                        <a href="adm-admin-params.jsp" class="menu-texto"><i class="fa fa-gears menu-icon"></i> Configuração</a>  
                                        <a href="adm-admin-post.jsp" class="menu-texto"><i class="fa fa-archive menu-icon"></i> Entregas</a>
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
                                        Lista de Entregas Abertas
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
                                            <td class="col-lg-1 col-md-1 col-xs-1"><b>Recebimento</b></td>
                                            </thead>
                                            <%
                                                //listagem de posts
                                                List<Post> posts = c.getPostsOpen();

                                                for (Post p : posts) {
                                                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                                                    String dataFormat = formatter.format(p.getData());
                                            %>
                                            <tr>
                                                <td class="col-xs-1"><b></b><%=p.getId()%></td>
                                                <td class="col-lg-3 col-md-3 col-xs-2"> <a href="detPostagem?id=<%=p.getId()%>" onClick="postSuccess();"><%=p.getDestinatario()%></a></td>
                                                <td class="col-lg-3 col-md-3 hidden-md hidden-xs"><%=p.getLogradouro()%> <%=p.getNumero()%>, <%=p.getBairro()%></td>
                                                <td class="col-xs-1 hidden-md hidden-xs"><%=p.getUrgencia()%></td>
                                                <td class="col-xs-1"><%=p.getTipo()%></td>
                                                <td class="col-lg-1 hidden-md hidden-xs"><%=dataFormat%></td>
                                                <td class="col-lg-1 col-md-1 col-xs-1 hidden-xs"><%=p.getValorTotal()%></td>
                                                <td class="col-lg-1 col-md-1 col-xs-1">
                                                    <% if (p.getStatus().equals("Aguardando Pagamento")) {%>
                                                    <a href="informRecebimento?id=<%=p.getId()%>" class="btn btn-primary"><span class="fa fa-credit-card"></span> Receber</button>
                                                        <% } else {%>
                                                        <%=p.getStatus()%>
                                                        <% }%>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </table>
                                        <br>
                                        <br>
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

