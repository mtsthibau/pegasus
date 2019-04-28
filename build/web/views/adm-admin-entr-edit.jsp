<%-- 
    Document   : adm-rem-admin-cad
    Created on : 05/04/2016, 01:17:58
    Author     : matheus
--%>

<%@page import="modelo.entidade.User"%>
<%@page import="servlets.cadEntregador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.entidade.Entregador"%>
<%@page import="modelo.dao.EntrDAO"%>

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
            <!-----------------------Java Script---------------------------->
            <script src="../js/jquery-2.2.2.min.js"></script>
            <script src="../js/jquery.bxslider.min.js"></script>
            <script src="../js/bootstrap.js"></script>
            <script src="../js/toastr.js"></script>
            <script src="../js/jquery.maskedinput.js"></script>

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
                                <form action="altEntregador">
                                    <div class="col-lg-12">
                                        ${msgRetorno } 
                                        <h3>
                                            <a class="fa fa-chevron-left" name="back" 
                                               value="back" onclick="history.go(-1);"> </a>
                                            Editar Entregador - ${nome } </h3>
                                        <hr/>
                                        <div style="display: none ">
                                            <input type="text" class="form-control" id="id" name="id" value="${id }" placeholder=""/>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Nome</label><label class="requerido"> *</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="nome" name="nome" value="${nome }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">E-mail</label><label class="requerido"> *</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="email" name="email" value="${email }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Senha</label><label class="requerido"> *</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="senha" name="senha" value="${senha }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Senha Confirmação</label><label class="requerido"> *</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="senhaConf" name="senhaConf" value="${senhaConf }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">CNPJ</label><label class="requerido"> *</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="cnpj" name="cnpj" value="${cnpj }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Telefone</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="telefone" name="telefone" value="${telefone }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">CEP</label><label class="requerido"> *</label> 
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="cep" name="cep" value="${cep }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Endereço</label><label class="requerido"> *</label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="logradouro" name="logradouro" value="${logradouro }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Número</label><label class="requerido"> *</label> 
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="numero" name="numero" value="${numero }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Complemento</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="complemento" name="complemento" value="${complemento }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Bairro</label><label class="requerido"> *</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="bairro" name="bairro" value="${bairro }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
<!--                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Cidade</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="cidade" name="cidade" value="Belo Horizonte" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>-->
<!--                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Estado</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="estado" name="estado" value="MG" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>-->
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Tipo Veículo</label><label class="requerido"> *</label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <select class="form-control" id="tipoVeiculo" name="tipoVeiculo">
                                                        <option value="${tipoVeiculo }"> ${tipoVeiculo }</option>
                                                        <option value="Motocicleta"> Motocicleta </option>
                                                        <option value="Automóvel"> Automóvel </option>
                                                        <option value="Van"> Van </option>
                                                        <option value="Caminhonete"> Caminhonete </option>
                                                        <option value="Caminhão"> Caminhão </option>
                                                    </select>
                                                </div>  
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Banco</label><label class="requerido"> *</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="banco" name="banco" value="${banco }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Agência</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="agencia" name="agencia" value="${agencia }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                                                <div class="form-group">
                                                    <label class="label-form">Conta</label><label class="requerido"> *</label></label>  
                                                </div>
                                            </div>
                                            <div class="col-lg-9">
                                                <div class="form-group">
                                                    <input type="tel" class="form-control" id="conta" name="conta" value="${conta }" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="col-xs-3"></div>
                                            <div class="col-xs-9">
                                                <div class="well">
                                                    <h5><strong>Saldo Atutal - </strong>  R$ ${saldo}</h5>
                                                    <h5><strong>Total Recebido - </strong>  R$ ${totalRecebido}</h5>
                                                </div>
                                                <a href="zerarSaldo?id=${id }&admin=<%=usuario.getId()%>&saldo=${saldo}" class="btn btn-orange">
                                                    <span class="fa fa-dollar"></span> Infomar pagamento
                                                </a>
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
                                                <button type="reset" class="btn btn-default">Limpar
                                                </button>
                                            </div>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

