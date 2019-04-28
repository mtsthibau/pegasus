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
                    <div style="margin-top: 80px;">
                        <!------------------------- Corpo da Página -------------------->
                        <div class="col-md-12 content-home">
                            <div class="col-lg-2"></div>
                            <div class="col-sm-8">
                                <h1 class=" titulo-sessao">PEGASUS</h1>

                                <p class="texto-campo-descricao formatTexto">
                                    O Negócio
                                    Com o grande crescimento do comércio eletrônico no Brasil o país mudou bastante em relação ao mercado de entregas expressas. As empresas e lojas começaram a fazer grandes investimentos em e-commerce e com isso as empresas de Transportes e até mesmo os Correios começaram a investir em formas de entregar e informar ao Consumidor Final todos os passos de sua mercadoria.
                                    Devido a estes investimentos as entregas expressas ou em domicilio  tornaram-se cada vez mais comuns e frequentes, obtendo destaque por fornecerem aos consumidores a simplicidade de realizar uma compra on-line e receber o produto no local desejado.
                                    Porém mesmo com esses investimentos é bastante comum vermos os consumidores fazendo reclamações em sites, fóruns e até mesmo em redes sociais a respeito da demora no prazo de entrega ou do extravio de suas mercadoria. 
                                </p>
                                <br>
                                <h3 >Objetivo<hr></h3>
                                <p class="texto-campo-descricao formatTexto">
                                    O principal objetivo na elaboração da Pegasus é criar uma ferramenta de entregas compartilhadas, visando uma solução alternativa para o problema de atrasos, desencontros e extravios de encomendas entre os correios e os usuários nos processos de entregas. Inicialmente os serviçoe da Pegasus serão implantados somente na cidade de Belo Horizonte, Minas Gerais; futuramente a empresa pretende expandir seus serviços para outras cidades e brasileiras.
                                    Da maneira como o  sistema funciona, será possível ser um entregador sem qualquer vinculo empregatício, onde o mesmo decide em quais horários trabalhar, a maneira como irá realizar as entregas selecionadas, na ordem de sua preferência.
                                    <br>
                                    <br>
                                    O projeto viabiliza uma solução alternativa e muito prática para o mercado de entregas expressas, através do sistema Web Pegasus.
                                    O produto desenvolvido possue grande potencial no mercado devido a forma de seu funcionamento, suas características o tornam um forte concorrente para os Correios, com grande chance de ter um bom retorno financeiro tanto para o site, quanto para os entregadores cadastrados, alem disso é muito atrativo aos usuarios do serviço, pois garante maior eficiencia no processo de entrega. 
                                    Outro ponto positivo apresentado pela ferramenta é o acompanhamento online das entregas em transito, funcionalidade crucial que o sites dos Correios e outras transportadoras possuem, porém o sistema da Pegasus oferece um rastreamento em tempo real, no qual o usuário recebe notificações via e-mail de onde se encontra a sua encomenda. 
                                    <br><br>Os serviços oferecidos pela Pegasus a tornam uma boa alternativa para reduzir os atrasos e extravios de entregas expressas na cidade de Belo Horizonte. 
                                    Através de uma ferramenta de compartilhamento e gerenciamento de entregas a empresa visa facilitar a forma como a encomenda é transportada, rastreada e entregue em seu destino. 
                                </p>
                                <br>
                                <br>
                                <br>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-------------------------- Rodapé ----------------------------->
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
</div>

<!--        <script>(function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s);
                            js.id = id;
                            js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.4";
                            fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                    $(function () {
                    $('[data-toggle="popover"]').popover({
                    html: true,
                            //            content: '<a href="#myModalLogin"></a>',
                            content: '<a href="#ajuda"></a>',
                    });
                    })
        </script>-->

<script>
    $('.bxslider').bxSlider({infiniteLoop: false,
        hideControlOnEnd: true,
        auto: true
    });
</script>
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



