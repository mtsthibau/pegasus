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

        <script src="scripts/cadastro.js"></script>
    </head>
    <body>
        <div>
            <div class="container-fluid">
                <%
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
                    <!------------------------ VIEWS CONTEÚDOS -------------------->
                    <div class="col-xs-12">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-10">
                            <div style="margin-top: 90px;">  
                                <h1 class=" titulo-sessao"> Cadastra-se</h1>
                                <div class="well">
                                    <h4>Cadastre-se e comece já a enviar suas correspondências pela Pegasus Entregas.<br></h4>
                                    <hr>
                                    <h4><strong>Atenção</strong><br> O sitema Pegasus atende somente a cidade de Belo Horizonte.<br> Você poderá 
                                        cadastrar entregas para serem realizadas a sua preferência.</h4>
                                </div>
                                <div class="col-xs-12">
                                    ${msgRetorno } 
                                </div>
                                <form action="cadRemetente" method="POST">
                                    <div class="col-md-6">
                                        <h3>
                                            <a class="fa fa-chevron-left" name="back" 
                                               value="back" onclick="history.go(-1);"> </a>
                                            Perfil </h3>
                                        <hr/>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Nome</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="nome" name="nome" value="${nome}" placeholder="nome completo"/>
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
                                                    <input type="email" class="form-control" id="email" name="email" value="${email}" placeholder="E-mail de contato"/>
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
                                                    <input type="password" class="form-control" id="senha" name="senha" value="${senha}" placeholder="Senha"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="label-form">Conf. Senha</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="confSsenha" name="confSsenha" value="${confSsenha}" placeholder="Senha"/>
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
                                                    <input type="text" class="form-control" id="cpf" name="cpf" value="${cpf }" placeholder="CPF"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label class="label-form">Telefône</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="telefone" name="telefone" value="${telefone}"/>
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
                                                    <input type="text" class="form-control" id="celular" name="celular" value="${celular }"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3>Endereço</h3>
                                        <hr/>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">CEP</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="cep" name="cep" value="${cep }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Logradouro</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="logradouro" name="logradouro" value="${logradouro }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Número</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="numero" name="numero" value="${numero }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Compl.</label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="complemento" name="complemento" value="${complemento }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Bairro</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="bairro" name="bairro" value="${bairro }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Latitude</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="latitude" name="latitude" value="${latitude}" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Longitude</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="longitude" name="longitude" value="${longitude}" placeholder=""/>
                                                </div>
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
                <h4><a href="" style="color:#FFFFFF"> Trabalhe conosco</a></h4><br>
            </div>

            <!-----------------Menu de serviços------------------------------>
            <div class="col-md-3 col-xs-12 servico">
                <br>
                <h3><span class="glyphicon glyphicon-wrench"></span> Serviços</h3>
                <hr>
                <h4><a href="" style="color:#FFFFFF"> Conheça o Portal Pegasus</a></h4><br>
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
        </div>        <footer>
            <!--COPYRIGHT-->
            <div class="col-lg-12 col-md-12 col-xs-12 rodape-copy">
                <h6>© Copyright 2016 | Pegasus Softwares. Todos os direitos reservados.
                    <a href="#content-home"><img src="../IMG/logo_black.png" class="logo-rodape"></a>
                </h6>
            </div>
        </footer>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw6aEcrP14Um0XJxWDmUjPnjpwSfGoHOQ&signed_in=true&callback=initMap"
        async defer></script>
    </body>
</html>
