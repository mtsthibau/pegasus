<%@page import="modelo.entidade.User"%>
<%@page import="java.util.List"%>
<%@page import="modelo.entidade.Parametro"%>
<%@page import="modelo.entidade.Parametro"%>
<%@page import="controlador.ControladorParam"%>
<%@page import="controlador.ControladorParam"%>
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

        <script src="scripts/adm-admin-admin.js"></script>

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
                            <ul class="nav">
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
                                ${msgRetorno}
                                <%
                                    ControladorParam c = new ControladorParam();
                                    List<Parametro> params = c.getParams();

                                    for (Parametro p : params) {
                                %>
                                <div class="col-xs-12 col-md-6">
                                    <div class="panel panel-default" style="height: 300px">
                                        <div class="panel-heading">
                                            <h4><strong><%=p.getNome()%></strong><br><small> Parâmetro <%=p.getId()%></small><span class="pull-right fa fa-database fa-2x" style="margin-top: -20px"></span></h4>
                                        </div>
                                        <div class="panel-body">
                                            <form action="admParametros">
                                                <div class="col-xs-3">
                                                    <p><h4>Valor<span class="requerido"> *</span></h4></p>
                                                </div>
                                                <div class="col-xs-9" style="height: 70px; margin: 0px 0px -25px">
                                                    <input type="text" value="<%=p.getId()%>" name="id" style="display: none"/><br>
                                                    <input type="text" id="valor" value="<%=p.getValor()%>" name="valor" class="form-control" style="margin-top: -15px  "/><br>
                                                </div>
                                                <div class="col-xs-3">
                                                    <h4>Descrição</h4>
                                                </div>
                                                <div class="col-xs-9" style="height: 90px">
                                                    <h4> <%=p.getDescricao()%></h4><br>
                                                </div>
                                                <div class="col-xs-12 text-right" style="height: 70px; margin: 20px ">
                                                    <input type="submit" class="btn btn-success"/>
                                                </div>
                                            </form> 
                                        </div>
                                    </div>
                                </div>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

