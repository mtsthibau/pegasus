<%-- 
    Document   : adm-admin
    Created on : 06/06/2016, 10:19:01
    Author     : matheus
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.entidade.Entregador"%>
<%@page import="modelo.entidade.Post"%>
<%@page import="controlador.ControladorPost"%>
<%@page import="controlador.controladorEntr"%>
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
        <link href="../css/toastr.css" rel="stylesheet"/>
        <!-----------------------Java Script---------------------------->
        <script src="../js/jquery-2.2.2.min.js"></script>
        <script src="../js/jquery.bxslider.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/toastr.js"></script>
        <script src="../js/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>

        <script src = "../views/scripts/adm-admin.js"></script>
    </head>

    <body>
        <div>
            <div class="container-fluid">
                <div class="row">
                    <script>
                        var arrayParams = [];
                        var arrayParams2 = [];
                    </script>
                    <%
                        User usuario = (User) session.getAttribute("UsuarioLogado");
                        if (usuario == null || !usuario.getTipoUsuario().equals("admin")) {
                            request.setAttribute("msgRetorno", "<div class=\'col-md-12 alert-danger\'><h4>Você não possui permissão para acessar este conteúdo!</h4></div>\n");
                            request.getRequestDispatcher("../public/erro-acesso.jsp").forward(request, response);
                        }

                        ControladorPost c = new ControladorPost();
                        controladorEntr cEntr = new controladorEntr();
                        Entregador e = cEntr.getEntr(usuario.getId());

                        List<Post> posts = c.getPostsOK();

                        int cont = 0;
                        int cont2 = 0;
                        double total = 0.0;
                        
                        for (Post p : posts) {
                            cont ++;
                            total += p.getValorTotal();
                    %>
                    <script>
                        arrayParams[<%=cont%>] = <%=p.getValorTotal()%>;
                    </script>
                    <%
                        }
                            double totalEntr =  total/ 100 * 90;
                            total = total / 100 * 10;

                        List<Entregador> entrs = cEntr.getRanking();

                        for (Entregador ent : entrs) {
                            cont2++;
                    %>
                    <script>
                        arrayParams2[0, <%=cont2%>] = "<%=ent.getNota()%>, <%=ent.getNome()%>";
                    </script>
                    <%}%>
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
                        <div class="col-md-9 col-lg-9 cards">
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
                                                            <i class="fa fa-users fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3>Administradores</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-admin-admin.jsp">
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Mais Detalhes</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-right"></i></span>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <!--                                <div class="col-md-6 col-lg-6">
                                                                            <div class="panel panel-orange">
                                                                                <div class="panel-heading">
                                                                                    <div class="row">
                                                                                        <div class="col-xs-3">
                                                                                            <i class="fa fa-trophy fa-5x"></i>
                                                                                        </div>
                                                                                        <div class="col-xs-9 text-right">
                                                                                            <div class="titulo-card">Avaliações</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <a href="adm-admin-aval.jsp">
                                                                                    <div class="panel-footer">
                                                                                        <span class="pull-left">Mais Detalhes</span>
                                                                                        <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                        
                                                                                        <div class="clearfix"></div>
                                                                                    </div>
                                                                                </a>
                                                                            </div>
                                                                        </div>-->
                                        <div class="col-md-6 col-lg-6">
                                            <div class="panel panel-orange">
                                                <div class="panel-heading">
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            <i class="fa fa-truck fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3>Entregadores</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-admin-entr.jsp">
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
                                                            <i class="fa fa-bookmark fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3>Escalas de Peso</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-admin-esca.jsp">
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
                                                            <div class="titulo-card"><h3>Históricos</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-admin-hist.jsp">
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
                                                            <i class="fa fa-gears fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3>Configuração do Sistema</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-admin-params.jsp">
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
                                                            <i class="fa fa-archive fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-right">
                                                            <div class="titulo-card"><h3> Entregas</h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="adm-admin-post.jsp">
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Mais Detalhes</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-right"></i></span>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">                                            
                                                    <h3>Resultados</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-12 col-md-6" style="margin-bottom: 20px">
                                                            <div id="doubleChart" style="height:310px; border: 1px solid #ccc"></div>
                                                        </div>
                                                        <div class="col-xs-12 col-md-6">
                                                            <div id="doubleChart2" style="height:310px; border: 1px solid #ccc"></div>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <div id="top_x_div" style="height:310px; border: 1px solid #ccc"></div>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <div id="chart_div" style="height:310px; border: 1px solid #ccc"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
                $(document).ready(function () {
                var param = [];
                var params2 = [];
                var params3 = [];             
                
                param.total = <%=total%>;
                param.totalEntr = <%=totalEntr%>;
                        param.cont = <%=cont%>;

                            params2 = arrayParams;
        params3 = arrayParams2;
                initParams(param, params2, params3);
            });
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw6aEcrP14Um0XJxWDmUjPnjpwSfGoHOQ&signed_in=true&callback="
        async defer></script>
    </body>
</html>