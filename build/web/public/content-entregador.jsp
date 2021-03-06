<%-- 
    Document   : content-pegasus-portal
    Created on : 04/06/2016, 21:32:02
    Author     : matheus
--%>

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

        <!-----------------------Java Script---------------------------->
        <script src="../js/jquery-2.2.2.min.js"></script>
        <script src="../js/jquery.bxslider.js"></script>
        <script src="../js/jquery.bxslider.min.js"></script>
        <script src="../js/bootstrap.js"></script>        
        <link rel="shortcut icon" href="../IMG/logo_black.png" type="image/x-icon" />

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
                    <!------------------------ VIEWS CONTEÚDOS -------------------->
                    <div style="margin-top: 100px;">
                        <!------------------------- Corpo da Página -------------------->
                        <div class="col-md-12 content-home">
                            <div class="col-lg-2"></div>
                            <div class="col-sm-8">
                                <h1 class=" titulo-sessao">Seja um entregador</h1>
                                <h3>Entregador</h3>

                                <p  class="formatTexto">
                                <h4>
                                    Seja um entregador Pegasus! A pegasus precisa de um parceiro como você!<br>
                                    Realize entregas com a Pegasus e ganhe dinheiro como autônomo. Seja seu próprio chefe e seja pago dirigindo em seu veículo nos seus horários vagos.<br><br>
                                    Para ser um entregador Pegasus basta entrar em contato através do campo de e-mail abaixo.<br><br>
                                    Assim que possivel um de nossos administradores entrará em contato informando todos os pré requisitos necessários para fazer parte da nossa equipe, e irá  agendar um entrevista.<br><br>
                                    O entregador (empreendedor Individual) não possue qualquer vinculo empregatício com a Pegasus. Porem o entregador tem o compromisso com os remetentes e destinatários que poderão avalia-lo, garantindo a qualidade dos serviços Pegasus.<br>
                                </h4>
                                </p>
                                <div class="col-xs-12 email-marketing">
                                    <div class="col-xs-8" id="mc_embed_signup">
                                        <form action="//facebook.us13.list-manage.com/subscribe/post?u=d02739b2aeff512f630d45551&amp;id=6638bbfe96"
                                              method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" 
                                              class="validate" target="_blank" novalidate>
                                            <div class="col-sm-12 col-xs-12" id="mc_embed_signup_scroll">
                                                <input type="email" value="" placeholder="Digite seu e-mail, para se inscrever." name="EMAIL" class="form-control input-email-marketing"
                                                       id="mce-EMAIL" required />
                                                <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                                            </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <button type="submit" value="Enviar!" name="subscribe" id="mc-embedded-subscribe"
                                                class="col-xs-12 btn-orange-lg"><span class="fa fa-paper-plane"></span> Inscrever
                                        </button>
                                    </div>
                                    </form>
                                    <script type='text/javascript' src='//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js'></script>
                                    <script type='text/javascript'>
                                        (function ($) {
                                            window.fnames = new Array();
                                            window.ftypes = new Array();
                                            fnames[0] = 'EMAIL';
                                            ftypes[0] = 'email';
                                            fnames[1] = 'FNAME';
                                            ftypes[1] = 'text';
                                            fnames[2] = 'LNAME';
                                            ftypes[2] = 'text';
                                        }(jQuery));
                                        var $mcj = jQuery.noConflict(true);</script>
                                    <!--End mc_embed_signup-->
                                </div>     
                                <div class="col-xs-12">
                                    <div class="alert alert-danger" id="mce-error-response" id="mce-responses" style="display:none"></div>
                                    <div class="alert alert-success" id="mce-success-response" id="mce-responses" style="display:none"></div>
                                </div>
                            </div>
                            <div class="col-sm-1"></div>
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

        <!----------------------------- FOOTER -------------------------->
        <footer>
            <!--COPYRIGHT-->
            <div class="col-lg-12 col-md-12 col-xs-12 rodape-copy">
                <h6>© Copyright 2016 | Pegasus Softwares. Todos os direitos reservados.
                    <a href="#content-home"><img src="../IMG/logo_black.png" class="logo-rodape"></a>
                </h6>
            </div>
        </footer>
    </div>  
    <script>
        $('.bxslider').bxSlider({
            infiniteLoop: false,
            hideControlOnEnd: true,
            auto: true
        });</script>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.6";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
</body>
</html>



