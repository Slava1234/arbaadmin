<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Title</title>
</head>
<body>

<div class="container col-md-6 col-md-offset-3">
    <a style="margin-top: 5px;" href="${pageContext.request.contextPath}/carrier/main"  class="btn btn-primary">Назад</a><br><br>
    <form method="post" action="${pageContext.request.contextPath}/carrier/add-company-post" modelAttribute="Company">

        <div class="form-group">
            <label for="company_name">Название компании</label>
            <input maxlength="255" name="company_name" type="text" class="form-control" id="company_name" placeholder="Название компании">
        </div>

        <div class="form-group">
            <label for="bin_iin">БИН/ ИИН</label>
            <input maxlength="255" name="bin_iin" type="text" class="form-control" id="bin_iin" placeholder="БИН/ ИИН">
        </div>

        <div class="form-group">
            <label for="company_city">Город</label>
            <input maxlength="255" name="company_city" type="text" class="form-control" id="company_city" placeholder="Город">
        </div>

        <div class="form-group">
            <label for="company_address">Адрес</label>
            <input maxlength="255" name="company_address" type="text" class="form-control" id="company_address" placeholder="Адрес">
        </div>

        <div class="form-group">
            <label for="contact_person">Контактное лицо</label>
            <input maxlength="255" name="contact_person" type="text" class="form-control" id="contact_person" placeholder="Контактное лицо">
        </div>

        <div class="form-group">
            <label for="phone">Телефон</label>
            <input maxlength="255" name="phone" type="text" class="form-control" id="phone" placeholder="Телефон">
        </div>

        <div class="form-group">
            <label for="site">Сайт</label>
            <input maxlength="255" name="site" type="text" class="form-control" id="site" placeholder="Сайт">
        </div>


        <button type="submit" class="btn btn-success add-new-company">Добавить</button>
    </form>

</div>

<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>
