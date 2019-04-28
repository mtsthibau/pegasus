<%-- 
    Document   : index
    Created on : 05/04/2016, 00:16:34
    Author     : matheus
--%>

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

        <!-----------------------Java Script---------------------------->
        <script src="../js/jquery-2.2.2.min.js"></script>
        <script src="../js/jquery.bxslider.js"></script>
        <script src="../js/jquery.bxslider.min.js"></script>
        <script src="../js/bootstrap.js"></script>  
        <script src="../js/toastr.js"></script>


        <script src="../public/scripts/content-map-rastreamento.js"></script>        
        <link rel="shortcut icon" href="IMG/logo_black.png" type="image/x-icon" />
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
                            <a href="../public/content-login.jsp" class="btn btn-orange pull-right"><span class="fa fa-sign-in"></span> Entrar</a>
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
                                            <a href="../public/content-login.jsp" class="text-uppercase"><span class="fa fa-sign-in"></span> Entrar</a>
                                        </li>
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
                <h1 class=" titulo-sessao"><span class="fa fa-trophy"></span> Avaliar entregador</h1>
                ${msgRetorno}

                <div class="col-xs-2"></div>
                <div  class="col-md-4 col-xs-12">
                    <h3>Entregador(a) ${nome} <hr></h1>
                        <h4>Dados de Contato - 
                            <p style="margin-left: 80px">
                                <br><span class="fa fa-mobile-phone"></span> Celular: ${telefone}<br>
                                <br><span class="fa fa-envelope-o"></span> E-mail: ${email}</h2><br>
                            </p>
                        </h4>
                </div>
                <div  class="col-md-4 col-xs-12">
                    <h3>Entrega Nº - ${entrega}<hr></h3>
                    <h4>Dados da Entrega - 
                        <p style="margin-left: 80px">
                            <br><span class="fa fa-user"></span> Destinatario: ${destinatario}<br>
                            <br><span class="fa fa-envelope-o"></span> E-mail: ${emailDest}<br>
                            <br><span class="fa fa-mobile-phone"></span> E-mail: ${celularDest}<br><br>
                        </p>
                    </h4>
                </div>
            </div>
            <div class="col-xs-2"></div>
            <div class="col-xs-8 well">
                <div class="col-xs-1"></div>
                <div class="col-xs-2 text-center estrela">
                    <a href="avalEntrConf?id=${entregador}&idEntrega=${entrega}&nota=1&notaAc=${nota}&numeroVotos=${numeroVotos}">
                        <img src="../IMG/1466335051_star.svg" class="img-responsive" style="height: 80px" alt="Nota 1">
                    </a>
                </div>
                <div class="col-xs-2 text-center estrela">
                    <a href="avalEntrConf?id=${entregador}&idEntrega=${entrega}&nota=2&notaAc=${nota}&numeroVotos=${numeroVotos}">
                        <img src="../IMG/1466335051_star.svg" class="img-responsive" style="height: 80px">
                    </a>
                </div>
                <div class="col-xs-2 text-center estrela">
                    <a href="avalEntrConf?id=${entregador}&idEntrega=${entrega}&nota=3&notaAc=${nota}&numeroVotos=${numeroVotos}">
                        <img src="../IMG/1466335051_star.svg" class="img-responsive" style="height: 80px">
                    </a>
                </div>
                <div class="col-xs-2 text-center estrela">
                    <a href="avalEntrConf?id=${entregador}&idEntrega=${entrega}&nota=4&notaAc=${nota}&numeroVotos=${numeroVotos}">
                        <img src="../IMG/1466335051_star.svg" class="img-responsive" style="height: 80px">
                    </a>
                </div>
                <div class="col-xs-2 text-center estrela">
                    <a href="avalEntrConf?id=${entregador}&idEntrega=${entrega}&nota=5&notaAc=${nota}&numeroVotos=${numeroVotos}">
                        <img src="../IMG/1466335051_star.svg" class="img-responsive" style="height: 80px">
                    </a>
                </div>
                <div class="col-xs-1"></div>
            </div>
            <div class="col-xs-2"></div>
            <div class="col-xs-2"></div>
            <div class="col-xs-8" style="margin-left: 15%;">  
                <div class="col-xs-12 text-center">
                    <h1> <strong>${notaFormat} </strong></h1>
                    <h2> Nota do Entregador</h2><hr><br>
                    <h3>Selecione uma estrela de 1 a 5 para avaliar o entregador</h3>
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
                <a href="https://www.facebook.com/PegasusSoft/" class="btn btn-default btn-lg fa fa-facebook fa-3x btn-social"></a>
                <a href="" class="btn btn-default btn-lg fa fa-linkedin fa-3x btn-social"></a>
                <a href="" class="btn btn-default btn-lg fa fa-youtube-play fa-3x btn-social"></a>
                <a href="" class="btn btn-default btn-lg fa fa-instagram fa-3x btn-social"></a>
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
                     data-tabs="timeline" data-width="340" data-height="410" 
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw6aEcrP14Um0XJxWDmUjPnjpwSfGoHOQ&signed_in=true&callback=initMap"
async defer></script>
</body>
</html>