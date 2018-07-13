<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Auth</title>

</head>
<body>

<div class="container col-md-12">


    <form action="${pageContext.request.contextPath}/check-auth" class="col-md-3 col-md-offset-4" style="margin-top: 100px" method="POST">
        <label for="login">Логин</label>
        <input class="form-control" type="text" id="login" name="login" placeholder="Логин">

        <label for="password" style="margin-top: 20px">Пароль</label>
        <input class="form-control" type="password" id="password" name="password" placeholder="Пароль">

        <button type="submit" class="btn btn-success" style="margin-top: 20px">Войти</button>
    </form>


</div>

<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>
