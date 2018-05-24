<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Upload File Request Page</title>
</head>
<body>


<div class="container col-md-6 col-md-offset-3" style="border: 1px solid #e7e7e7;margin-top: 10px;border-radius: 10px;">
    <a style="margin-top: 5px;margin-bottom: 15px;" href="${pageContext.request.contextPath}/" class="btn btn-primary">Назад</a>
    <form method="POST" action="${pageContext.request.contextPath}/upload-new-cv-file-handler?id=${param["id"]}"
          enctype="multipart/form-data">
        <input type="file" name="file"><br/>
        <input class="btn- btn-success btn-sm" type="submit" value="Загрузить">
    </form>
</div>


<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="http://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/resources/js/script.js" />"></script>


</body>
</html>