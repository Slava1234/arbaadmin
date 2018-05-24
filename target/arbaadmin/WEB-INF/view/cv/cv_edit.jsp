<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <title>Edit cv</title>
</head>
<body>

<div class="container">
    <form method="post" action="${pageContext.request.contextPath}/cv/update" modelAttribute="cv">

        <input name="id" hidden type="text" value="${cv.id}">

        <div class="form-group">
            <label for="fio">ФИО</label>
            <input name="fio" type="text" class="form-control" id="fio" value="${cv.fio}">
        </div>

        <div class="form-group">
            <label for="birthdate">Дата рождения</label>
            <input name="birthdate" type="text" class="form-control" id="birthdate" value="${cv.birthdate}">
        </div>

        <div class="form-group">
            <label for="phone">Телефон</label>
            <input name="phone" type="text" class="form-control" id="phone" value="${cv.phone}">
        </div>

        <div class="form-group">
            <label for="email">Почта</label>
            <input name="email" type="text" class="form-control" id="email" value="${cv.email}">
        </div>

        <div class="form-group">
            <label for="sellary">Желаемая зарплата</label>
            <input name="sellary" type="text" class="form-control" id="sellary" value="${cv.sellary}">
        </div>

        <div class="form-group">
            <label for="experiance_years">Опыт работы</label>
            <input name="experiance_years" type="text" class="form-control" id="experiance_years" value="${cv.experiance_years}">
        </div>

        <div class="form-group">
            <label for="experiance_places">Места работы</label>
            <textarea rows="20" name="experiance_places"  class="form-control" id="experiance_places">${cv.experiance_places}</textarea>
        </div>

        <div class="form-group">
            <label for="skills">Навыки</label>
            <textarea rows="20" name="skills" type="text" class="form-control" id="skills">${cv.skills}</textarea>
        </div>

        <div class="form-group">
            <label for="about">Общая инфа</label>
            <textarea rows="20" name="about" type="text" class="form-control" id="about">${cv.about}</textarea>
        </div>

        <div class="form-group">
            <label for="comment">Комментарий</label>
            <input name="comment" type="text" class="form-control" id="comment" value="${cv.comment}">
        </div>














        <button type="submit" class="btn btn-primary">Обновить</button>
    </form>
</div>

<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
</body>
</html>
