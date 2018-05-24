<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <title>Bookmarks</title>


</head>
<body>

<div class="container col-md-12">


    <div class="preloader"></div>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a style="margin-top: 5px;" class="btn btn-success" href="${pageContext.request.contextPath}/cv/add">Добавить</a>
                <a style="margin-top: 5px;" href="${pageContext.request.contextPath}/"  class="btn btn-primary">Назад</a>
            </div>



        </div><!-- /.container-fluid -->
    </nav>

    <table class="table table-striped" id="cv-data-table">
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

            <th hidden class="text-size-14 font-size-13" scope="col">experiance_places</th>
            <th hidden class="text-size-14 font-size-13" scope="col">skills</th>
            <th hidden class="text-size-14 font-size-13" scope="col">about</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach items="${cvs}" var="cv">
            <tr>
                <th class="cv_id text-size-14 font-size-13" scope="row">${cv.id}</th>
                <td data-toggle="modal" data-target="#dataInfo" class="cv-fio text-size-14 font-size-13 fio"><a
                        style="cursor: pointer">${cv.fio}</a></td>
                <td class="cv-birthdate text-size-14 font-size-13">${cv.birthdate}</td>
                <td class="cv-phone text-size-14 font-size-13">${cv.phone}</td>
                <td class="cv-email text-size-14 font-size-13">${cv.email}</td>
                <td class="cv-sellary text-size-14 font-size-13">${cv.sellary}</td>
                <td class="cv-experiance_years text-size-14 font-size-13">${cv.experiance_years}</td>


                <td class="text-size-14 font-size-13">


                    <div class="btn-group dropleft">

                        <a href="" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">Редактировать</a>
                        <div class="dropdown-menu"
                             style="width: 200px; text-align: center;padding-top: 0px;height: 165px;">
                            <div class="form-group">
                                <textarea class="" style="margin-bottom: 7px;width: 100%;" rows="5"
                                          placeholder="Комментарий"
                                          style="width: 100%">${cv.comment}</textarea>
                                <button class="btn btn-success btn-xs save-comment">Сохранить</button>
                            </div>

                        </div>
                    </div>
                    <br>
                    <p class="cv-row-comment">${cv.comment}</p>


                </td>


                <td style="text-align: center;">
                    <img class="edit-cv-btn" data-toggle="modal" data-target="#dataInfoEdit"
                         style="width: 30px;cursor: pointer;" src="<c:url value="/resources/img/edit.png" />"
                         alt="edit"/>


                    <c:choose>
                        <c:when test="${cv.bookmark=='1'}">
                            <img class="bookmark-cv" state="1"
                                 style="width: 30px;cursor: pointer;"
                                 src="<c:url value="/resources/img/star_added.png" />"
                                 alt="bookmark"/>
                        </c:when>
                        <c:otherwise>
                            <img class="bookmark-cv" state="0"
                                 style="width: 30px;cursor: pointer;"
                                 src="<c:url value="/resources/img/add_new_star.png" />"
                                 alt="bookmark"/>
                        </c:otherwise>
                    </c:choose>





                </td>

                <td hidden class="cv-experiance_places text-size-14 font-size-13">${cv.experiance_places}</td>
                <td hidden class="cv-skills text-size-14 font-size-13">${cv.skills}</td>
                <td hidden class="cv-about text-size-14 font-size-13">${cv.about}</td>

            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>


<!-- View cv -->
<div class="modal fade" id="dataInfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 0 30px 0 30px;">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel">Modeal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">ФИО</th>
                        <th class="font-size-15" scope="col">EMAIL</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="cv-view-fio font-size-13"></td>
                        <td class="cv-view-email font-size-13">cv.email</td>
                    </tr>
                    </tbody>
                </table>

                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">ТЕЛЕФОН</th>
                        <th class="font-size-15" scope="col">Зарплата</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="cv-view-phone font-size-13">cv.phone</td>
                        <td class="cv-view-sellary font-size-13">cv.sellary</td>
                    </tr>
                    </tbody>
                </table>

                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">Дата рождения</th>
                        <th class="font-size-15" scope="col">Опыт работы</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="cv-view-birthday font-size-13">cv.birthdate</td>
                        <td class="cv-view-experiance-years font-size-13">cv.experiance_years</td>
                    </tr>
                    </tbody>
                </table>

                <hr>
                <h4 class="font-size-15">Места работы</h4>
                <textarea class="cv-view-experiance-place font-size-13" style="width: 100%" readonly rows="12">cv.experiance_place</textarea>

                <hr>
                <h4 class="font-size-15">Навыки</h4>
                <textarea class="cv-view-skills font-size-13" style="width: 100%" readonly
                          rows="12">cv.skills</textarea>

                <hr>
                <h4 class="font-size-15">Общие данные</h4>
                <textarea class="cv-view-about font-size-13" style="width: 100%" readonly rows="8">cv.about</textarea>

                <hr>
                <h4 class="font-size-15">Комментарий</h4>
                <p class="cv-view-comment font-size-13">cv.comment</p>
            </div>
        </div>
    </div>
</div>


<!-- Edit cv -->
<div class="modal fade" id="dataInfoEdit" tabindex="-1" role="dialog" aria-labelledby="ModalLabelEdit"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 0 30px 0 30px;">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabelEdit">Modeal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">ФИО</th>
                        <th class="font-size-15" scope="col">EMAIL</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="cv-edit-fio font-size-13">
                            <div class="form-group">
                                <input type="text" class="form-control">
                            </div>
                        </td>
                        <td class="cv-edit-email font-size-13">
                            <div class="form-group">
                                <input type="text" class="form-control">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">ТЕЛЕФОН</th>
                        <th class="font-size-15" scope="col">Зарплата</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="cv-edit-phone font-size-13">
                            <div class="form-group">
                                <input type="text" class="form-control">
                            </div>
                        </td>
                        <td class="cv-edit-sellary font-size-13">
                            <div class="form-group">
                                <input type="text" class="form-control">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">Дата рождения</th>
                        <th class="font-size-15" scope="col">Опыт работы</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="cv-edit-birthday font-size-13">
                            <div class="form-group">
                                <input type="text" class="form-control">
                            </div>
                        </td>
                        <td class="cv-edit-experiance-years font-size-13">
                            <div class="form-group">
                                <input type="text" class="form-control">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <hr>
                <h4 class="font-size-15">Места работы</h4>
                <div class="form-group">
                    <textarea class="cv-edit-experiance-place font-size-13 form-control" style="width: 100%"
                              rows="12"></textarea>
                </div>

                <hr>
                <h4 class="font-size-15">Навыки</h4>
                <div class="form-group">
                <textarea class="cv-edit-skills font-size-13 form-control" style="width: 100%"
                          rows="12"></textarea>
                </div>

                <hr>
                <h4 class="font-size-15">Общие данные</h4>
                <div class="form-group">
                    <textarea class="cv-edit-about font-size-13 form-control" style="width: 100%" rows="8"></textarea>
                </div>

                <hr>
                <h4 class="font-size-15">Комментарий</h4>
                <div class="form-group cv-edit-comment font-size-13">
                    <input type="text" class="form-control">
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                <button type="button" class="btn btn-primary cv-edit-save">Сохранить</button>
            </div>
        </div>
    </div>
</div>


<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="http://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="<c:url value="/resources/js/script.js" />"></script>
<script>
    $(document).ready(function () {
        $('#cv-data-table').DataTable();



        // preloader
        $('.preloader').fadeOut(500);
    });
</script>


</body>
</html>
