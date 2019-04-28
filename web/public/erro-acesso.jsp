<%-- 
    Document   : erro-acesso
    Created on : 13/05/2016, 20:39:55
    Author     : Jeff
--%>

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

        <script src="scripts/adm-rem-admin.js"></script>

        <link rel="shortcut icon" href="../IMG/logo.png" type="image/x-icon" />
    </head>
    <body>
        <div class="col-xs-12">
            <div class="col-xs-4"></div>
            <div class="col-xs-4 text-center text-danger">
                <br/><br/><br/>

                <div class="row">
                    <span class="fa fa-warning fa-5x "></span>
                    <h1 class="">Você não possui acesso a este conteúdo ou essa página não existe.</h1>
                </div>
                <div class="row">
                    <br>
                    <a class="btn btn-primary btn-lg" name="back" 
                       value="back" onclick="history.go(-1);"><span class="fa fa-chevron-left"></span> Voltar</a>
                </div>

            </div>
        </div>
    </body>
</html>
