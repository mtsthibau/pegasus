<%-- 
    Document   : adm-rem-perf
    Created on : 13/04/2016, 22:17:34
    Author     : matheus
--%>

<%@page import="modelo.entidade.User"%>
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

        <script src="scripts/adm-rem-perf.js"></script>
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
                            ${msgRetorno } 
                            <div class="col-lg-12">
                                <h3>  
                                    <button onclick="del(${id })" class="btn btn-danger pull-right">
                                        <span class="fa fa-remove"></span> Deletar Conta</button>
                                    <a class="fa fa-chevron-left" name="back" 
                                       value="back" onclick="history.go(-1);"> </a>
                                    Perfil </h3>
                                <form action="altRemetente">
                                    <div style="display: none">
                                        <input id="id" value="${id }" name="id"/>
                                        <input id="latitude" name="latitude" value="${latitude }"/>
                                        <input id="longitude" name="longitude" value="${longitude }"/>
                                    </div>
                                    <hr/>
                                    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                        <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                            <div class="form-group">
                                                <label class="label-form">Nome</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="nome" name="nome" value="${nome} " placeholder="nome completo"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">E-mail</label><label class="requerido"> *</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="email" class="form-control" id="email" name="email" value="${email } " placeholder="E-mail de contato"/>
                                            </div>
                                        </div>
                                    </div>                          
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">Senha</label><label class="requerido"> *</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="password" class="form-control" id="senha" name="senha" value="" placeholder="Senha"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">Confirmação de Senha</label><label class="requerido"> *</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="password" class="form-control" id="senhaConf" name="senhaConf" value="" placeholder="Confirme aqui sua senha"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">CPF</label><label class="requerido"> *</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="cpf" name="cpf" value="${cpf } " />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">Celular</label><label class="requerido"> *</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="celular" name="celular" value="${celular } " placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">Telefone</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="telefone" name="telefone" value="${telefone } " placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">CEP</label><label class="requerido"> *</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="cep" name="cep" value="${cep } " placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">Logradouro</label><label class="requerido"> *</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="logradouro" name="logradouro" value="${logradouro } " placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">Número</label><label class="requerido"> *</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="numero" name="numero" value="${numero } " placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">Complemento</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="complemento" name="complemento" value="${complemento } " placeholder=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label class="label-form">Bairro</label><label class="requerido"> *</label></label>  
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="bairro" name="bairro" value="${bairro} " placeholder=""/>
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
                                            <button type="reset" class="btn btn-default">Limpar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw6aEcrP14Um0XJxWDmUjPnjpwSfGoHOQ&signed_in=true&callback=initMap"
            async defer></script>
    </body>
</html>
