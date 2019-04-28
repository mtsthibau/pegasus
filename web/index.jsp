<%-- 
    Document   : index
    Created on : 05/04/2016, 00:16:34
    Author     : matheus
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.entidade.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/jquery.bxslider.css">

        <!-----------------------Java Script---------------------------->
        <script src="js/jquery-2.2.2.min.js"></script>
        <script src="js/jquery.bxslider.js"></script>
        <script src="js/jquery.bxslider.min.js"></script>
        <script src="js/bootstrap.js"></script>        
        <link rel="shortcut icon" href="IMG/logo_black.png" type="image/x-icon" />

    </head>
    <body>
        <%
            User usuario = (User) session.getAttribute("UsuarioLogado");
        %>
        <div>
            <div class="container-fluid">
                <div class="row">
                    <header class="col-lg-12 col-md-12 col-sm-12 barra-topo">
                        <div class="col-lg-2 col-md-3 col-xs-2 logo">
                            <a href="index.jsp"><img src="IMG/logo.png"></a>
                        </div>
                        <div class="col-lg-10 col-md-9 col-xs-12 login">
                            <ul>
                                <li class="menuContato">
                                    <a href="public/content-pegasus-portal.jsp" class="text-uppercase">PEGASUS</a>
                                </li>
                                <li class="menuContato">
                                    <a href="public/content-contato.jsp" class="text-uppercase">CONTATO</a>
                                </li>
                                <li class="menuContato">
                                    <a href="public/content-entregador.jsp" class="text-uppercase">SEJA ENTREGADOR</a>
                                </li>
                                <li class="menuContato">
                                    <a href="public/cadastro.jsp" class="text-uppercase">CADASTRAR</a>
                                </li>
                            </ul>
                            <%
                                if (usuario != null) {
                                    if (usuario.getTipoUsuario().equals("entregador")) {
                            %>       
                            <a href="views/adm-entr.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                            <% }
                                if (usuario.getTipoUsuario().equals("admin")) {
                            %>
                            <a href="views/adm-admin.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                            <% }
                                if (usuario.getTipoUsuario().equals("remetente")) {
                            %> 
                            <a href="views/adm-rem.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                            <% }
                            } else {%>
                            <a href="public/content-login.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
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
                                            <a href="public/content-pegasus-portal.jsp" class="text-uppercase">PEGASUS</a>
                                        </li>
                                        <li class="menuContato">
                                            <a href="public/content-contato.jsp" class="text-uppercase">CONTATO</a>
                                        </li>
                                        <li class="menuContato">
                                            <a href="public/content-entregador.jsp" class="text-uppercase">SEJA ENTREGADOR</a>
                                        </li>
                                        <li class="menuContato">
                                            <a href="public/cadastro.jsp" class="text-uppercase">CADASTRAR</a>
                                        </li>
                                        <%
                                            if (usuario != null) {
                                                if (usuario.getTipoUsuario().equals("entregador")) {
                                        %>       
                                        <a href="views/adm-entr.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                        <% }
                                            if (usuario.getTipoUsuario().equals("admin")) {
                                        %>
                                        <a href="views/adm-admin.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                        <% }
                                            if (usuario.getTipoUsuario().equals("remetente")) {
                                        %> 
                                        <a href="views/adm-rem.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                        <% }
                                        } else {%>
                                        <a href="public/content-login.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </header>
                    <div style="margin-top: 100px;">
                        <div class="col-md-12 content-home">
                            <!---------------------------BANNER----------------------->
                            <div class="slide">
                                <ul class="bxslider">
                                    <a href="public/content-remetente.jsp"><li><img class="img-responsive" src="IMG/bannerRemetente.png"/></li></a>
                                    <a href="public/content-entregador.jsp"><li><img class="img-responsive" src="IMG/bannerSejaEntregador.png"/></li></a>
                                </ul>
                            </div>
                            <!------------------- E-Mail Marketing ------------------->
                            <div class="col-xs-12 email-marketing">
                                <!--<img src="../img/selo1.png" class="icone-selo col-xs-12"/>-->
                                <a href="public/content-entregador.jsp">
                                    <img src="IMG/mail-512.png" class="col-md-2 img-responsive icone-envelope"/>
                                    <div class="col-sm-12 col-md-3 convite-email-marketing">
                                        <h4>Desejo ser entregador Pegasus</h4>
                                    </div>
                                </a>
                                <div class="col-xs-12 col-md-4" id="mc_embed_signup">
                                    <form action="//facebook.us13.list-manage.com/subscribe/post?u=d02739b2aeff512f630d45551&amp;id=6638bbfe96"
                                          method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" 
                                          class="validate" target="_blank" novalidate>
                                        <div class="col-sm-12 col-xs-12" id="mc_embed_signup_scroll">
                                            <input type="email" value="" placeholder="Digite seu e-mail, para se inscrever." name="EMAIL" class="form-control input-email-marketing"
                                                   id="mce-EMAIL" required />
                                        </div>
                                </div>
                                <div class="col-xs-12 col-md-3">
                                    <button type="submit" value="Enviar!" name="subscribe" id="mc-embedded-subscribe"
                                            class="col-xs-12 btn-orange-lg"><span class="fa fa-paper-plane"></span> Inscrever
                                    </button>
                                </div>
                                </form>
                            </div>
                            <div class="col-xs-12">
                                <div class="alert alert-danger" id="mce-error-response" id="mce-responses" style="display:none"></div>
                                <div class="alert alert-success" id="mce-success-response" id="mce-responses" style="display:none"></div>
                            </div>
                            <!--                            <div class="col-xs-12">
                                                            <div class="well" style="height: 150px">
                                                                <div class="col-xs-3"></div>
                                                                <div class="col-xs-6">
                                                                    <a href="public/mapRastreamento?id=93" class="btn btn-orange center-block"><span class="fa fa-map-marker"></span> RASTREAMENTO</a>
                                                                </div>
                                                            </div>
                                                        </div>-->
                            <div class="col-xs-12" style="color:#FF8600; margin-bottom: 40px; margin-top: 40px;">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-8 text-center">
                                    <div class="col-xs-6 col-md-4">
                                        <span class="fa fa-money fa-5x"></span><br><hr>
                                        <h4>Econômico</h4>
                                        <br>
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <span class="fa fa-history fa-5x"></span><br><hr>
                                        <h4>Veloz</h4>
                                        <br>
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <span class="fa fa-cloud fa-5x"></span><br><hr>
                                        <h4>On-line</h4>
                                        <br>
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <span class="fa fa-map-marker fa-5x"></span><br><hr>
                                        <h4>Rastreável</h4>
                                        <br>
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <span class="fa fa-users fa-5x"></span><br><hr>
                                        <h4>Personalizado</h4>
                                        <br>
                                    </div>
                                    <div class="col-xs-6 col-md-4">
                                        <span class="fa fa-cab fa-5x"></span><br><hr>
                                        <h4>Disponível</h4>
                                        <br>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="col-xs-8 email-marketing">
                                        <h3 class="col-xs-8 text-center" style="color: white; margin-top: 10px">
                                            Acompanhe os 10 melhores entregadores Pegasus</h3>
                                        <a href="public/content-ranking.jsp" class="btn btn-orange-lg col-xs-3">
                                            <span class="fa fa-trophy"></span> VEJA O RANKING</a></div>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="row">
                                    <div class="col-xs-12 col-md-4">
                                        <div class="thumbnail">
                                            <img src="IMG/glyphsco-1463369832.jpg" class="img-responsive" alt="Transportadores">

                                            <div class="caption" style="height: 190px;">
                                                <h3>Envie tudo pela Pegasus</h3>

                                                <p><h4>
                                                    Envie tudo pela Pegasus! Utilize nosso sistema para solicitar entregas em tempo hábil, envie suas correspondencias de qualquer tipo, peso ou tamanho sem sair de casa, nossos entregadores vão até você.
                                                </h4>
                                                </p>
                                            </div>
                                        </div>
                                        <a href="public/content-remetente.jsp" class="btn btn-orange"><span class="fa fa-plus"></span> Veja Mais</a>
                                        <br>
                                        <br>
                                    </div>  

                                    <div class="col-xs-12 col-md-4">
                                        <div class="thumbnail">
                                            <img src="IMG/38791555-2824-4baa-9559-617f96b42772.jpg" class="img-responsive" alt="Transportadores">

                                            <div class="caption" style="height: 190px;">
                                                <h3>Receba suas entregas pela Pegasus</h3>

                                                <p>
                                                <h4> Receba suas entregas pela Pegasus
                                                    Receba suas entregas em casa com todo o conforto que a Pegasus vai te proporcionar! 
                                                    Com o nosso sitema você pode rastrear suas entregas em tempo real. 
                                                </h4>
                                                </p>
                                            </div>
                                        </div>  
                                        <a href="public/content-destinatario.jsp" class="btn btn-orange"><span class="fa fa-plus"></span> Veja Mais</a>
                                        <br>
                                        <br>
                                    </div>
                                    <div class="col-xs-12 col-md-4">
                                        <div class="thumbnail">
                                            <img src="IMG/glyphsco-1463369854.jpg" class="img-responsive" alt="Transportadores">

                                            <div class="caption" style="height: 190px;">
                                                <h3>Seja um entregador Pegasus</h3>
                                                <p>
                                                <h4>A pegasus precisa de um parceiro como você!<br>
                                                    Realize entregas com a Pegasus e ganhe dinheiro como autônomo.  
                                                    Seja seu próprio chefe e seja pago dirigindo em seu próprio horário.
                                                </h4>
                                                </p>
                                            </div>
                                        </div>
                                        <a href="public/content-entregador.jsp" class="btn btn-orange"><span class="fa fa-plus"></span> Veja Mais</a>
                                        <br>
                                        <br>
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
                    </div>

                </div>
            </div>
        </div>
        <!----------------------------- FOOTER -------------------------->
        <footer>
            <!--COPYRIGHT-->
            <div class="col-lg-12 col-md-12 col-xs-12 rodape-copy">
                <h6>© Copyright 2016 | Pegasus Softwares. Todos os direitos reservados.
                    <a href="#content-home"><img src="IMG/logo_black.png" class="logo-rodape"></a>
                </h6>
            </div>
        </footer>
    </div>
    <div id="fb-root"></div>
    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.6";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        $('.bxslider').bxSlider({
            infiniteLoop: false,
            hideControlOnEnd: true,
            auto: true
        });

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

</script>
<script type='text/javascript' src='//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js'></script>
</body>
</html>

