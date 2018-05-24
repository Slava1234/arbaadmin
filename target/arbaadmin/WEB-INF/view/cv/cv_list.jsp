<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link rel="stylesheet" href="">


    <title>User data</title>
</head>
<body>

<div class="container col-md-12">

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a style="margin-top: 5px;" class="btn btn-success" href="${pageContext.request.contextPath}/cv/add">Добавить</a>
            </div>

        </div><!-- /.container-fluid -->
    </nav>

        <div class="row">
            <p>Всего ${amount}</p>
            <div class="col-md-12">
                <div class="input-group" id="adv-search">
                    <div class="input-group-btn">
                        <div class="btn-group" role="group">
                            <div class="dropdown dropdown-lg" style="margin: 0 auto;">
                                <button style="height: 34px;" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Поиск <span class="caret"></span></button>
                                <div class="dropdown-menu dropdown-menu-right" role="menu">
                                    <form class="form-horizontal" role="form" method="get" action="${pageContext.request.contextPath}/cv/search">
                                        <div class="form-group">

                                            <div class="input-group col-md-12" id="adv-search2">
                                                <input type="text" name="search_query" class="form-control" placeholder="Поиск резюме" />
                                            </div>

                                            <div class="form-check">
                                                <input checked type="checkbox" class="form-check-input" name="names" id="names">
                                                <label class="form-check-label" for="names">Искать в именах</label>
                                            </div>
                                            <div class="form-check">
                                                <input checked type="checkbox" class="form-check-input" name="birthdates" id="birthdates">
                                                <label class="form-check-label" for="birthdates">Искать по дате рождения</label>
                                            </div>
                                            <div class="form-check">
                                                <input checked type="checkbox" class="form-check-input" name="phones" id="phones">
                                                <label class="form-check-label" for="phones">Искать по номеру телефона</label>
                                            </div>
                                            <div class="form-check">
                                                <input checked type="checkbox" class="form-check-input" name="sellarys" id="sellarys">
                                                <label class="form-check-label" for="sellarys">Искать по зарплате</label>
                                            </div>
                                            <div class="form-check">
                                                <input checked type="checkbox" class="form-check-input" name="skills" id="skills">
                                                <label class="form-check-label" for="skills">Искать по навыкам</label>
                                            </div>
                                            <div class="form-check">
                                                <input checked type="checkbox" class="form-check-input" name="comments" id="comments">
                                                <label class="form-check-label" for="comments">Искать по комментариям</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Искать</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>

    <hr>




















    <table class="table table-striped">
        <thead>
        <tr>
            <th class="text-size-14 font-size-13" scope="col">#</th>
            <th class="text-size-14 font-size-13" scope="col">ФИО</th>
            <th class="text-size-14 font-size-13" scope="col">Дата рождения</th>
            <th class="text-size-14 font-size-13" scope="col">Телефон</th>
            <th class="text-size-14 font-size-13" scope="col">Почта</th>
            <th class="text-size-14 font-size-13" scope="col">Желаемая зарплата</th>
            <th class="text-size-14 font-size-13" scope="col">Опыт работы</th>
            <th class="text-size-14 font-size-13" scope="col">Комментарий</th>
            <th class="text-size-14 font-size-13" scope="col">Действие</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach items="${cvs}" var="cv">
            <tr>
                <th class="text-size-14 font-size-13" scope="row">${cv.id}</th>
                <td class="text-size-14 font-size-13">${cv.fio}</td>
                <td class="text-size-14 font-size-13">${cv.birthdate}</td>
                <td class="text-size-14 font-size-13">${cv.phone}</td>
                <td class="text-size-14 font-size-13">${cv.email}</td>
                <td class="text-size-14 font-size-13">${cv.sellary}</td>
                <td class="text-size-14 font-size-13">${cv.experiance_years}</td>
                <td class="text-size-14 font-size-13">${cv.comment}</td>
                <td>
                    <img src="/resources/img/edit.png" alt="edit">
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>

<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>








</body>
</html>
