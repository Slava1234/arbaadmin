<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Title</title>
</head>
<body>

<div class="container col-md-6 col-md-offset-3">
    <a style="margin-top: 5px;" href="${pageContext.request.contextPath}/"  class="btn btn-primary">Назад</a><br><br>
    <form
            method="post"
            action="${pageContext.request.contextPath}/cv/add_new_cv"
            modelAttribute="cv"
            enctype="multipart/form-data">

        <div class="form-group">
            <label for="fio">ФИО</label>
            <input name="fio" type="text" class="form-control" id="fio" placeholder="ФИО">
        </div>

        <div class="form-group">
            <label for="birthdate">Дата рождения</label>
            <input name="birthdate" type="text" class="form-control datepicker" id="birthdate" placeholder="Дата рождения">
        </div>

        <div class="form-group">
            <label for="phone">Телефон</label>
            <input name="phone" type="text" class="form-control" id="phone" placeholder="Телефон">
        </div>

        <div class="form-group">
            <label for="email">Почта</label>
            <input name="email" type="text" class="form-control" id="email" placeholder="Почта">
        </div>

        <div class="form-group">
            <label for="sellary">Желаемая зарплата</label>
            <input name="sellary" type="text" class="form-control" id="sellary" placeholder="Желаемая зарплата">
        </div>

        <div class="form-group">
            <label for="experiance_years">Опыт работы</label>
            <input name="experiance_years" type="text" class="form-control" id="experiance_years" placeholder="Опыт работы">
        </div>

        <div class="form-group">
            <label for="experiance_places">Места работы</label>
            <textarea name="experiance_places"  class="form-control" id="experiance_places" placeholder="Места работы"></textarea>
        </div>

        <div class="form-group">
            <label for="skills">Навыки</label>
            <textarea name="skills" type="text" class="form-control" id="skills" placeholder="Навыки"></textarea>
        </div>

        <div class="form-group">
            <label for="about">Общая инфа</label>
            <textarea name="about" type="text" class="form-control" id="about" placeholder="Общая инфа"></textarea>
        </div>

        <div class="form-group">
            <label for="comment">Комментарий</label>
            <input name="comment" type="text" class="form-control" id="comment" placeholder="Комментарий">
        </div>

        <div class="form-group">
            <label for="file">Резюме документ</label>
            <input name="file" type="file" class="form-control" id="file" placeholder="Резюме документ">
        </div>


        <button type="submit" class="btn btn-success">Добавить</button>
    </form>

</div>

<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
    $(function() {
        $( ".datepicker" ).datepicker({
            dateFormat : 'dd.mm.yy',
            changeMonth : true,
            changeYear : true,
            yearRange: '-100y:c+nn',
            maxDate: '-1d'
        });
    });

</script>
</body>
</html>
