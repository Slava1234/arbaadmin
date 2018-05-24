<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <title>Результаты поиска</title>
</head>
<body>

<div class="container">
    <h1>Search</h1>
    <c:forEach items="${results}" var="res">

        <!--
        Tolegen Aida удален
        -->

        <a target="_blank" href="${pageContext.request.contextPath}/cv/search_view?id=${res.id}">${res.id} ${res.fio}</a><hr>
    </c:forEach>
</div>

<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
</body>
</html>
