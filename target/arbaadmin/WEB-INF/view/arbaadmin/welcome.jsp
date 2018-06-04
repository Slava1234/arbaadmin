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
    <title>Welcome</title>


</head>
<body>

<div class="container col-md-12" style="text-align: center; padding-top: 218px;">

    <a href="./customer" class="btn btn-default btn-lg">Заказчик</a>
    <a href="./carrier/main" class="btn btn-default btn-lg">Перевозчик</a>

</div>


<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="https://malsup.github.com/jquery.form.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/jquery.mark.es6.min.js"></script>
<script src="<c:url value="/resources/js/script.js" />"></script>


</body>
</html>
