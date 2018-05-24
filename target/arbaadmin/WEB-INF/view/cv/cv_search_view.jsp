<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <title>${cv.fio}</title>
</head>
<body>
<div class="container">


    <div class="col-md-8 col-md-offset-2">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ФИО</th>
            <th scope="col">EMAIL</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${cv.fio}</td>
            <td>${cv.email}</td>
        </tr>
        </tbody>
    </table>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">ТЕЛЕФОН</th>
            <th scope="col">Зарплата</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${cv.phone}</td>
            <td>${cv.sellary}</td>
        </tr>
        </tbody>
    </table>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">Дата рождения</th>
            <th scope="col">Опыт работы</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${cv.birthdate}</td>
            <td>${cv.experiance_years}</td>
        </tr>
        </tbody>
    </table>
    </div>


    <div class="col-md-8 col-md-offset-2">

        <hr>
        <h4>Места работы</h4>
        <textarea style="width: 100%" readonly rows="12">${cv.experiance_places}</textarea>

        <hr>
        <h4>Навыки</h4>
        <textarea style="width: 100%" readonly rows="12">${cv.skills}</textarea>

        <hr>
        <h4>Общие данные</h4>
        <textarea style="width: 100%" readonly rows="8">${cv.about}</textarea>

        <hr>
        <h4>Комментарий</h4>
        <p>${cv.comment}</p>
    </div>
</div>


<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
</body>
</html>
